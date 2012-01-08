//
//	LTPProgressSliderViewController.m
//	LTPlayground
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

#import "LTPProgressSliderViewController.h"

#pragma mark Class Extension -

@interface LTPProgressSliderViewController () <LTKProgressSliderDelegate>

@property (readwrite, nonatomic, strong) IBOutlet LTKProgressSlider *exampleProgressSlider;
@property (readwrite, nonatomic, strong) IBOutlet UILabel *exampleProgressPercentageLabel;
@property (readwrite, nonatomic, strong) IBOutlet UISwitch *progressTintColorSwitch;
@property (readwrite, nonatomic, strong) IBOutlet UISwitch *trackingEnabledSwitch;
@property (readwrite, nonatomic, strong) IBOutlet UISwitch *animateProgressSwitch;
@property (readwrite, nonatomic, strong) IBOutlet UILabel *trackingRateDetailLabel;

- (IBAction)progressTintColorSwitchValueChanged;
- (IBAction)customThumbViewSwitchValueChanged:(UISwitch *)customThumbViewSwitch;
- (IBAction)trackingEnabledSwitchValueChanged;
- (IBAction)trackingRateLevelsSwitchValueChanged:(UISwitch *)trackingRateLevelsSwitch;
- (CGFloat)exampleLabelMidXForProgressSlider:(LTKProgressSlider *)progressSlider;

@end

@implementation LTPProgressSliderViewController

@synthesize exampleProgressSlider;
@synthesize exampleProgressPercentageLabel;
@synthesize progressTintColorSwitch;
@synthesize trackingEnabledSwitch;
@synthesize animateProgressSwitch;
@synthesize trackingRateDetailLabel;

#pragma mark - LTPProgressSliderViewController Methods (Private)

- (IBAction)progressTintColorSwitchValueChanged
{
	[self.exampleProgressSlider.layer addDefaultFadeTransition];

	UIColor *progressTintColor = nil;

	if (progressTintColorSwitch.on)
	{
		progressTintColor = [UIColor colorWithHue:((self.exampleProgressSlider.progress * 114.0f) / 359.0f) saturation:1.0f brightness:0.9f alpha:1.0f];
	}

	self.exampleProgressSlider.progressTintColor = progressTintColor;
}

- (IBAction)customThumbViewSwitchValueChanged:(UISwitch *)customThumbViewSwitch
{
	[self.exampleProgressSlider.layer addDefaultFadeTransition];

	if (customThumbViewSwitch.on)
	{
		self.exampleProgressSlider.thumbView = [UIImageView imageViewWithImageNamed:@"LTPProgressSliderThumb"];
		self.exampleProgressSlider.thumbViewBoundsInsets = UIEdgeInsetsMake(0.0f, 4.0f, 0.0f, 4.0f);
	}
	else
	{
		self.exampleProgressSlider.thumbView = nil;
	}

	self.exampleProgressPercentageLabel.frameMidX = [self exampleLabelMidXForProgressSlider:self.exampleProgressSlider];
}

- (IBAction)trackingEnabledSwitchValueChanged
{
	[UIView animateWithDuration:0.3
		animations:
		^{
			self.exampleProgressSlider.thumbView.alpha = (self.trackingEnabledSwitch.on ? 1.0f : 0.0f);
		}
	];
}

- (IBAction)trackingRateLevelsSwitchValueChanged:(UISwitch *)trackingRateLevelsSwitch
{
	self.exampleProgressSlider.trackingRateLevelsEnabled = trackingRateLevelsSwitch.on;
}

- (CGFloat)exampleLabelMidXForProgressSlider:(LTKProgressSlider *)progressSlider
{
	UIEdgeInsets thumbViewBoundsInsets = progressSlider.thumbViewBoundsInsets;
	CGFloat effectiveThumbViewWidth = (progressSlider.thumbView.frameWidth - thumbViewBoundsInsets.left - thumbViewBoundsInsets.right);
	CGFloat labelXOffset = (progressSlider.frameX + (effectiveThumbViewWidth / 2.0f));

	return (labelXOffset + (self.exampleProgressSlider.effectiveWidth * progressSlider.progress));
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.exampleProgressSlider.shouldMonitorPresentationLayerDuringAnimations = YES;
	self.exampleProgressSlider.numberOfTrackingRateLevels = 4;
	self.exampleProgressSlider.trackingRateLevelHeight = 75.0f;
	self.exampleProgressSlider.trackingRateLevelMultiplier = 0.5f;
}

- (void)viewDidUnload
{
	[super viewDidUnload];

	self.exampleProgressSlider = nil;
	self.exampleProgressPercentageLabel = nil;
	self.progressTintColorSwitch = nil;
	self.trackingEnabledSwitch = nil;
	self.animateProgressSwitch = nil;
	self.trackingRateDetailLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.exampleProgressPercentageLabel.frameMidX = [self exampleLabelMidXForProgressSlider:self.exampleProgressSlider];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? (interfaceOrientation == UIInterfaceOrientationPortrait) : YES);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	self.exampleProgressPercentageLabel.frameMidX = [self exampleLabelMidXForProgressSlider:self.exampleProgressSlider];
}

#pragma mark - Delegate Methods

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 5)
	{
		[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

		[self.exampleProgressSlider setProgress:((CGFloat)arc4random() / UINT32_MAX) animated:self.animateProgressSwitch.on];
	}
}

#pragma mark - LTKProgressSliderDelegate Methods

- (BOOL)progressSliderShouldBeginTracking:(LTKProgressSlider *)progressSlider
{
	return self.trackingEnabledSwitch.on;
}

- (void)progressSliderDidBeginTracking:(LTKProgressSlider *)progressSlider
{
	[UIView animateWithDuration:0.3
		animations:
		^{
			self.exampleProgressPercentageLabel.alpha = 1.0f;
		}
	];
}

- (void)progressSliderDidEndTracking:(LTKProgressSlider *)progressSlider
{
	[UIView animateWithDuration:0.7
		animations:
		^{
			self.exampleProgressPercentageLabel.alpha = 0.5f;
		}
	];
}

- (void)progressSlider:(LTKProgressSlider *)progressSlider willChangeProgress:(CGFloat)progress withAnimationDuration:(NSTimeInterval)animationDuration
{
	CGFloat exampleLabelMidX = [self exampleLabelMidXForProgressSlider:progressSlider];

	[UIView animateWithDuration:animationDuration
		animations:
		^{
			self.exampleProgressPercentageLabel.frameMidX = exampleLabelMidX;
		}
	];
}

- (void)progressSlider:(LTKProgressSlider *)progressSlider didChangeProgress:(CGFloat)progress
{
	if (self.progressTintColorSwitch.on)
	{
		progressSlider.progressTintColor = [UIColor colorWithHue:((progress * 114.0f) / 359.0f) saturation:1.0f brightness:0.9f alpha:1.0f];
	}

	self.exampleProgressPercentageLabel.frameMidX = [self exampleLabelMidXForProgressSlider:progressSlider];
	self.exampleProgressPercentageLabel.text = [NSString stringWithFormat:@"%.0f%%", (progress * 100.0f)];
}

- (void)progressSlider:(LTKProgressSlider *)progressSlider didChangeTrackingRateLevel:(NSInteger)trackingRateLevel
{
	NSInteger trackingRateLevelMagnitude = abs(trackingRateLevel);

	if (trackingRateLevelMagnitude == 0)
	{
		self.trackingRateDetailLabel.text = @"Full-Speed";
	}
	else if (trackingRateLevelMagnitude == 1)
	{
		self.trackingRateDetailLabel.text = @"Half-Speed";
	}
	else if (trackingRateLevelMagnitude == 2)
	{
		self.trackingRateDetailLabel.text = @"Quarter-Speed";
	}
	else if (trackingRateLevelMagnitude == 3)
	{
		self.trackingRateDetailLabel.text = @"Fine";
	}
}

@end