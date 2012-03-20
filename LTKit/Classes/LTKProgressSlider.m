//
//	LTKProgressSlider.m
//	LTKit
//
//	Copyright (c) 2012 Michael Potter
//	http://lucas.tiz.ma
//	lucas@tiz.ma
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "LTKProgressSlider.h"

#import "LTKitCategories.h"
#import "LTKitUtilities.h"

#pragma mark Class Extension -

@interface LTKProgressSlider ()

@property (readwrite, nonatomic, assign) NSInteger trackingRateLevel;
@property (readwrite, nonatomic, assign) CGFloat effectiveWidth;

@property (readwrite, nonatomic, strong) NSTimer *presentationLayerMonitorTimer;
@property (readwrite, nonatomic, strong) UIView *thumbViewContainerView;
@property (readwrite, nonatomic, assign) CGFloat progressAtPreviousTrackingRateLevel;
@property (readwrite, nonatomic, assign) CGFloat touchPointXOffsetAtPreviousTrackingRateLevel;
@property (readwrite, nonatomic, assign) CGFloat currentThumbViewTouchPointX;
@property (readwrite, nonatomic, assign) CGFloat thumbViewTouchPointXOffset;
@property (readwrite, nonatomic, assign, getter = isUsingDefaultThumbViewConfiguration) BOOL usingDefaultThumbViewConfiguration;

- (void)presentationLayerMonitorTimerDidFire;
- (void)configureDefaultThumbView;
- (void)configureThumbViewContainerViewForBoundsInsets;
- (void)adjustThumbViewFrameForCurrentProgress;
- (void)handleThumbViewPanGesture:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation LTKProgressSlider

@synthesize delegate;
@synthesize thumbView;
@synthesize thumbTrackingOverlayView;
@synthesize thumbViewBoundsInsets;
@synthesize trackingRateLevelsEnabled;
@synthesize shouldMonitorPresentationLayerDuringAnimations;
@synthesize presentationLayerMonitoringInterval;
@synthesize numberOfTrackingRateLevels;
@synthesize trackingRateLevelHeight;
@synthesize trackingRateLevelMultiplier;
@synthesize trackingRateLevel;
@synthesize trackingRate;
@synthesize effectiveWidth;

@synthesize presentationLayerMonitorTimer;
@synthesize thumbViewContainerView;
@synthesize progressAtPreviousTrackingRateLevel;
@synthesize touchPointXOffsetAtPreviousTrackingRateLevel;
@synthesize currentThumbViewTouchPointX;
@synthesize thumbViewTouchPointXOffset;
@synthesize usingDefaultThumbViewConfiguration;

#pragma mark - Property Accessors

- (void)setThumbView:(UIView *)newThumbView
{
	// If no thumb view is provided, a default configuration is used.

	if (newThumbView == nil)
	{
		[self configureDefaultThumbView];
	}
	else
	{
		if (!self.usingDefaultThumbViewConfiguration)
		{
			self.thumbViewBoundsInsets = UIEdgeInsetsZero;
		}

		thumbView = newThumbView;
		thumbView.userInteractionEnabled = NO;

		self.usingDefaultThumbViewConfiguration = NO;

		[self.thumbViewContainerView removeFromSuperview];
		self.thumbViewContainerView = [UIView viewWithFrame:thumbView.bounds];
		self.thumbViewContainerView.backgroundColor = [UIColor clearColor];
		[self.thumbViewContainerView addSubview:thumbView];

		[self configureThumbViewContainerViewForBoundsInsets];

		UIPanGestureRecognizer *panGestureRecognizer = [UIPanGestureRecognizer gestureRecognizerWithTarget:self action:@selector(handleThumbViewPanGesture:)];
		[self.thumbViewContainerView addGestureRecognizer:panGestureRecognizer];

		[self addSubview:self.thumbViewContainerView];
	}
}

- (void)setThumbTrackingOverlayView:(UIView *)newThumbTrackingOverlayView
{
	if (self.thumbView == nil)
	{
		[self configureDefaultThumbView];
	}

	thumbTrackingOverlayView = newThumbTrackingOverlayView;
	thumbTrackingOverlayView.center = self.thumbView.center;
	thumbTrackingOverlayView.hidden = YES;

	[self.thumbViewContainerView addSubview:thumbTrackingOverlayView];
}

- (void)setThumbViewBoundsInsets:(UIEdgeInsets)newThumbViewBoundsInsets
{
	thumbViewBoundsInsets = newThumbViewBoundsInsets;

	[self configureThumbViewContainerViewForBoundsInsets];
}

- (void)setTrackingRateLevel:(NSInteger)newTrackingRateLevel
{
	if (trackingRateLevel != newTrackingRateLevel)
	{
		self.progressAtPreviousTrackingRateLevel = self.progress;
		self.touchPointXOffsetAtPreviousTrackingRateLevel = (self.currentThumbViewTouchPointX - (self.thumbViewContainerView.boundsWidth / 2.0f));

		if ([self.delegate respondsToSelector:@selector(progressSlider:didChangeTrackingRateLevel:)])
		{
			[self.delegate progressSlider:self didChangeTrackingRateLevel:newTrackingRateLevel];
		}
	}

	trackingRateLevel = newTrackingRateLevel;
}

- (CGFloat)trackingRate
{
	return (1.0f * powf(self.trackingRateLevelMultiplier, fabsf(self.trackingRateLevel)));;
}

#pragma mark - LTKProgressSlider Methods (Public)

+ (id)progressSliderWithThumbView:(UIView *)thumbView
{
	return [[self alloc] initWithThumbView:thumbView];
}

- (id)initWithThumbView:(UIView *)newThumbView
{
	self = [super initWithProgressViewStyle:UIProgressViewStyleDefault];

	if (self != nil)
	{
		thumbView = newThumbView;
		thumbViewBoundsInsets = UIEdgeInsetsZero;
	}

	return self;
}

#pragma mark - LTKProgressSlider Methods (Private)

- (void)presentationLayerMonitorTimerDidFire
{
	CGFloat interpolatedThumbViewContainerViewFrameMidX = CGRectGetMidX([[self.thumbViewContainerView.layer presentationLayer] frame]);
	CGFloat interpolatedProgress = ((interpolatedThumbViewContainerViewFrameMidX - (self.thumbViewContainerView.boundsWidth / 2.0f)) / self.effectiveWidth);

	if ([self.delegate respondsToSelector:@selector(progressSlider:didChangeProgress:)])
	{
		[self.delegate progressSlider:self didChangeProgress:interpolatedProgress];
	}
}

- (void)configureDefaultThumbView
{
	self.usingDefaultThumbViewConfiguration = YES;
	self.thumbView = [UIImageView imageViewWithImageNamed:@"LTKit.bundle/LTKProgressSliderDefaultThumb"];
	self.thumbTrackingOverlayView = [UIImageView imageViewWithImageNamed:@"LTKit.bundle/LTKProgressSliderDefaultThumbTrackingOverlay"];
	self.thumbViewBoundsInsets = UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f);
}

- (void)configureThumbViewContainerViewForBoundsInsets
{
	self.thumbViewContainerView.contentMode = UIViewContentModeCenter;
	self.thumbViewContainerView.frameMidY = self.boundsMidY;
	self.thumbViewContainerView.bounds = UIEdgeInsetsInsetRect(self.thumbView.bounds, self.thumbViewBoundsInsets);
}

- (void)adjustThumbViewFrameForCurrentProgress
{
	// In order to align the thumb view container view properly at all points along the progress view, its bounds' width is used to offset the normal frame
	// calculation. Effectively, the container view's bounds need to be flush against both the left edge of the progress view (at 0.0 progress) and the right
	// edge of the progress view (at 1.0 progress).

	//	A = ((B / 2.0f) + (C * D));		Get the frame from the progress
	//	D = ((A - (B / 2.0f)) / C);		Get the progress from the frame

	self.thumbViewContainerView.frameMidX = ((self.thumbViewContainerView.boundsWidth / 2.0f) + (self.effectiveWidth * self.progress));
}

- (void)handleThumbViewPanGesture:(UIPanGestureRecognizer *)panGestureRecognizer
{
	CGPoint localizedTouchPoint = [panGestureRecognizer locationInView:self];

	if (panGestureRecognizer.state == UIGestureRecognizerStateBegan)
	{
		// If the delegate indicates that tracking should not begin, then the gesture recognizer is disabled. However, setting a gesture recognizer's enabled
		// property to NO doesn't immediately change the property's value, apparently. It merely changes the state to UIGestureRecognizerStateCancelled. A
		// separate variable must maintain the return value of -progressSliderShouldBeginTracking: so that -progressSliderDidBeginTracking: is not called on
		// the delegate in the event that -progressSliderShouldBeginTracking: returns NO.

		BOOL panGestureRecognizerEnabled = YES;

		if ([self.delegate respondsToSelector:@selector(progressSliderShouldBeginTracking:)])
		{
			panGestureRecognizerEnabled = [self.delegate progressSliderShouldBeginTracking:self];
		}

		panGestureRecognizer.enabled = panGestureRecognizerEnabled;

		// Capture the offset between the right edge of the thumb view container view and the x coordinate of localizedTouchPoint. This offset prevents the
		// container view from suddenly jumping to a new position when panning. Instead, the thumb view pans relative to the original touch point.

		self.thumbViewTouchPointXOffset = (self.thumbViewContainerView.frameMidX - localizedTouchPoint.x);

		if (panGestureRecognizerEnabled && [self.delegate respondsToSelector:@selector(progressSliderDidBeginTracking:)])
		{
			[self.thumbTrackingOverlayView.layer addDefaultFadeTransition];
			self.thumbTrackingOverlayView.hidden = NO;

			[self.delegate progressSliderDidBeginTracking:self];
		}
	}
	else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
	{
		self.currentThumbViewTouchPointX = (localizedTouchPoint.x + self.thumbViewTouchPointXOffset);

		// If tracking rates are to be applied, they are calculated according to height levels: for each multiple of trackingRateLevelHeight that the touch
		// position travels from the origin point (the vertical center of self, the progress view), the tracking rate level is increased (touches above the
		// progress slider) or decreased (touches below the progress slider) by one. The normal tracking rate, 1.0, is multiplied by trackingRateLevelMultiplier
		// for each level.

		if (self.trackingRateLevelsEnabled)
		{
			CGFloat integralValue = 0.0f;
			modff(-((localizedTouchPoint.y - self.boundsMidY) / self.trackingRateLevelHeight), &integralValue);

			if (abs((NSInteger)integralValue) < self.numberOfTrackingRateLevels)
			{
				self.trackingRateLevel = (NSInteger)integralValue;
			}
		}

		// This calculation is effectively the inverse of the one performed in -adjustThumbViewFrameForCurrentProgress, taking into account the x offset
		// captured in the UIGestureRecognizerStateBegan state. The tracking rate is also applied here.

		CGFloat effectiveXPosition = (self.currentThumbViewTouchPointX - self.touchPointXOffsetAtPreviousTrackingRateLevel);
		CGFloat addedProgress = (((effectiveXPosition - (self.thumbViewContainerView.boundsWidth / 2.0f)) / self.effectiveWidth) * self.trackingRate);
		CGFloat unboundedProgress = self.progressAtPreviousTrackingRateLevel + addedProgress;

		CGFloat previousProgress = self.progress;
		self.progress = LTK_CLAMP(unboundedProgress, 0.0f, 1.0f);

		if ((self.progress != previousProgress) && [self.delegate respondsToSelector:@selector(progressSlider:didChangeProgress:)])
		{
			[self.delegate progressSlider:self didChangeProgress:self.progress];
		}
	}
	else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
	{
		self.currentThumbViewTouchPointX = 0.0f;
		self.trackingRateLevel = 0;
		self.progressAtPreviousTrackingRateLevel = 0.0f;
		self.touchPointXOffsetAtPreviousTrackingRateLevel = 0.0f;

		if ([self.delegate respondsToSelector:@selector(progressSliderDidEndTracking:)])
		{
			[self.thumbTrackingOverlayView.layer addDefaultFadeTransition];
			self.thumbTrackingOverlayView.hidden = YES;

			[self.delegate progressSliderDidEndTracking:self];
		}
	}
	else if (panGestureRecognizer.state == UIGestureRecognizerStateCancelled)
	{
		panGestureRecognizer.enabled = YES;
	}
}

#pragma mark - UIProgressView Methods

- (void)setProgress:(float)newProgress animated:(BOOL)animated
{
	CGRect previousThumbViewContainerViewFrame = self.thumbViewContainerView.frame;
	CGFloat animationDuration = fabsf(self.progress - newProgress);

	[super setProgress:newProgress animated:animated];

	if (!animated && [self.delegate respondsToSelector:@selector(progressSlider:didChangeProgress:)])
	{
		[self.delegate progressSlider:self didChangeProgress:self.progress];
	}

	// UIProgressView sets its animation duration to the magnitude of the difference between the current progress and the new progress. The thumb view container
	// view is animated using this same logic.

	if (animated)
	{
		self.thumbViewContainerView.frame = previousThumbViewContainerViewFrame;

		// To prevent potentially awkward interactions, user interaction on the thumb view container view is disabled duration the animation. It is re-enabled
		// when the animation completes.

		[UIView animateWithDuration:animationDuration
			animations:^
			{
				self.thumbViewContainerView.userInteractionEnabled = NO;
				[self adjustThumbViewFrameForCurrentProgress];

				if ([self.delegate respondsToSelector:@selector(progressSlider:willChangeProgress:withAnimationDuration:)])
				{
					[self.delegate progressSlider:self willChangeProgress:newProgress withAnimationDuration:animationDuration];
				}

				if (self.shouldMonitorPresentationLayerDuringAnimations)
				{
					// Set up the repeating timer to monitor the presentation layer during animations to alert the delegate at regular intervals

					self.presentationLayerMonitorTimer = [NSTimer scheduledTimerWithTimeInterval:self.presentationLayerMonitoringInterval repeats:YES
						block:^
						{
							// Based on the currently interpolated position of the thumb view container view, an interpolated progress can be calculated

							CGFloat interpolatedFrameMidX = CGRectGetMidX([[self.thumbViewContainerView.layer presentationLayer] frame]);
							CGFloat interpolatedProgress = ((interpolatedFrameMidX - (self.thumbViewContainerView.boundsWidth / 2.0f)) / self.effectiveWidth);

							if ([self.delegate respondsToSelector:@selector(progressSlider:didChangeProgress:)])
							{
								[self.delegate progressSlider:self didChangeProgress:interpolatedProgress];
							}
						}
					];
				}
			}
			completion:
			^(BOOL finished)
			{
				self.thumbViewContainerView.userInteractionEnabled = YES;

				if ([self.delegate respondsToSelector:@selector(progressSlider:didChangeProgress:)])
				{
					[self.delegate progressSlider:self didChangeProgress:self.progress];
				}

				[self.presentationLayerMonitorTimer invalidate];
			}
		];
	}
}

#pragma mark - UIView Methods

- (void)didMoveToSuperview
{
	[super didMoveToSuperview];

	// If no thumb view is provided, a default configuration is used.

	if (self.thumbView == nil)
	{
		[self configureDefaultThumbView];
	}
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.effectiveWidth = (self.boundsWidth - self.thumbViewContainerView.boundsWidth);
	[self adjustThumbViewFrameForCurrentProgress];
}

@end