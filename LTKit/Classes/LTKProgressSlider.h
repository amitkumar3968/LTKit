//
//	LTKProgressSlider.h
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

#import <UIKit/UIKit.h>

@protocol LTKProgressSliderDelegate;

@interface LTKProgressSlider : UIProgressView

@property (readwrite, nonatomic, weak) IBOutlet id<LTKProgressSliderDelegate> delegate;
@property (readwrite, nonatomic, strong) UIView *thumbView;
@property (readwrite, nonatomic, strong) UIView *thumbTrackingOverlayView;
@property (readwrite, nonatomic, assign) UIEdgeInsets thumbViewBoundsInsets;
@property (readwrite, nonatomic, assign) BOOL trackingRateLevelsEnabled;
@property (readwrite, nonatomic, assign) BOOL shouldMonitorPresentationLayerDuringAnimations;
@property (readwrite, nonatomic, assign) NSTimeInterval presentationLayerMonitoringInterval;
@property (readwrite, nonatomic, assign) NSInteger numberOfTrackingRateLevels;
@property (readwrite, nonatomic, assign) CGFloat trackingRateLevelHeight;
@property (readwrite, nonatomic, assign) CGFloat trackingRateLevelMultiplier;
@property (readonly, nonatomic, assign) NSInteger trackingRateLevel;
@property (readonly, nonatomic, assign) CGFloat trackingRate;
@property (readonly, nonatomic, assign) CGFloat effectiveWidth;

+ (id)progressSliderWithThumbView:(UIView *)thumbView;
- (id)initWithThumbView:(UIView *)thumbView;

@end

@protocol LTKProgressSliderDelegate <NSObject>

@optional

- (BOOL)progressSliderShouldBeginTracking:(LTKProgressSlider *)progressSlider;
- (void)progressSliderDidBeginTracking:(LTKProgressSlider *)progressSlider;
- (void)progressSliderDidEndTracking:(LTKProgressSlider *)progressSlider;
- (void)progressSlider:(LTKProgressSlider *)progressSlider willChangeProgress:(CGFloat)progress withAnimationDuration:(NSTimeInterval)animationDuration;
- (void)progressSlider:(LTKProgressSlider *)progressSlider didChangeProgress:(CGFloat)progress;
- (void)progressSlider:(LTKProgressSlider *)progressSlider didChangeTrackingRateLevel:(NSInteger)trackingRateLevel;
- (NSString *)progressSlider:(LTKProgressSlider *)progressSlider titleForTrackingRateLevel:(NSInteger)trackingRateLevel;

@end