//
//	LTKCALayerCategoryTests.m
//	LTKitTests
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

#import <LTKit/LTKit.h>

#import "LTKCALayerCategoryTests.h"

#pragma mark Class Extension -

@interface LTKCALayerCategoryTests ()

@property (readwrite, nonatomic, strong) CALayer *testLayer;

@end

@implementation LTKCALayerCategoryTests

@synthesize testLayer;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	self.testLayer = [[CALayer alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
}

- (void)tearDown
{
	[super tearDown];

	[self.testLayer removeAllAnimations];
}

#pragma mark - Unit Tests

- (void)testFrameOriginProperty
{
	self.testLayer.frameOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameSizeProperty
{
	self.testLayer.frameSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);

	self.testLayer.frameSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameXProperty
{
	self.testLayer.frameX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameYProperty
{
	self.testLayer.frameY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameWidthProperty
{
	self.testLayer.frameWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameHeightProperty
{
	self.testLayer.frameHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMinXProperty
{
	self.testLayer.frameMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMidXProperty
{
	self.testLayer.frameMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMaxXProperty
{
	self.testLayer.frameMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMinYProperty
{
	self.testLayer.frameMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMidYProperty
{
	self.testLayer.frameMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMaxYProperty
{
	self.testLayer.frameMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameTopLeftPointProperty
{
	self.testLayer.frameTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameTopMiddlePointProperty
{
	self.testLayer.frameTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameTopRightPointProperty
{
	self.testLayer.frameTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMiddleRightPointProperty
{
	self.testLayer.frameMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameBottomRightPointProperty
{
	self.testLayer.frameBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameBottomMiddlePointProperty
{
	self.testLayer.frameBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameBottomLeftPointProperty
{
	self.testLayer.frameBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testFrameMiddleLeftPointProperty
{
	self.testLayer.frameMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testBoundsOriginProperty
{
	self.testLayer.boundsOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsSizeProperty
{
	self.testLayer.boundsSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);

	self.testLayer.boundsSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsXProperty
{
	self.testLayer.boundsX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsYProperty
{
	self.testLayer.boundsY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsWidthProperty
{
	self.testLayer.boundsWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsHeightProperty
{
	self.testLayer.boundsHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMinXProperty
{
	self.testLayer.boundsMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMidXProperty
{
	self.testLayer.boundsMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMaxXProperty
{
	self.testLayer.boundsMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMinYProperty
{
	self.testLayer.boundsMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMidYProperty
{
	self.testLayer.boundsMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMaxYProperty
{
	self.testLayer.boundsMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsTopLeftPointProperty
{
	self.testLayer.boundsTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsTopMiddlePointProperty
{
	self.testLayer.boundsTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsTopRightPointProperty
{
	self.testLayer.boundsTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMiddleRightPointProperty
{
	self.testLayer.boundsMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsBottomRightPointProperty
{
	self.testLayer.boundsBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsBottomMiddlePointProperty
{
	self.testLayer.boundsBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsBottomLeftPointProperty
{
	self.testLayer.boundsBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testBoundsMiddleLeftPointProperty
{
	self.testLayer.boundsMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testLayer.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testLayer.bounds)], nil);
}

- (void)testPositionXProperty
{
	self.testLayer.positionX = 0.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(-50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testPositionYProperty
{
	self.testLayer.positionY = 0.0f;

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, CGRectMake(0.0f, -50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testLayer.frame)], nil);
}

- (void)testLayerWithFrameMethod
{
	CALayer *layer = [CALayer layerWithFrame:CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)];

	STAssertNotNil(layer, @"Layer is nil.");
	STAssertTrue(CGRectEqualToRect(layer.frame, CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(layer.frame)], nil);
	STAssertTrue(CGRectEqualToRect(layer.bounds, CGRectMake(0.0f, 0.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(layer.bounds)], nil);
}

- (void)testInitWithFrameMethod
{
	CALayer *layer = [[CALayer alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)];

	STAssertNotNil(layer, @"Layer is nil.");
	STAssertTrue(CGRectEqualToRect(layer.frame, CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(layer.frame)], nil);
	STAssertTrue(CGRectEqualToRect(layer.bounds, CGRectMake(0.0f, 0.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(layer.bounds)], nil);
}

- (void)testSetAnchorPointAndPreserveCurrentFrameMethod
{
	CGRect testLayerFrame = self.testLayer.frame;

	[self.testLayer setAnchorPointAndPreserveCurrentFrame:CGPointZero];

	STAssertTrue(CGRectEqualToRect(self.testLayer.frame, testLayerFrame), [NSString stringWithFormat:@"The actual frame is %@.",
		NSStringFromCGRect(self.testLayer.frame)], nil);
	STAssertTrue(CGPointEqualToPoint(self.testLayer.anchorPoint, CGPointZero), [NSString stringWithFormat:@"The actual anchor point is %@.",
		NSStringFromCGPoint(self.testLayer.anchorPoint)], nil);
}

- (void)testSmallestWidthInLayersMethod
{
	CALayer *layer1 = [CALayer layer];
	CALayer *layer2 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
	CALayer *layer3 = [CALayer layerWithFrame:CGRectMake(50.0f, 50.0f, 50.0f, 50.0f)];
	CALayer *layer4 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, -100.0f, -100.0f)];

	NSArray *layers1 = [NSArray arrayWithObject:layer1];
	NSArray *layers2 = [NSArray arrayWithObjects:layer1, layer2, nil];
	NSArray *layers3 = [NSArray arrayWithObjects:layer1, layer2, layer3, nil];
	NSArray *layers4 = [NSArray arrayWithObjects:layer1, layer2, layer3, layer4, nil];

	CGFloat smallestWidth1 = [CALayer smallestWidthInLayers:layers1];
	CGFloat smallestWidth2 = [CALayer smallestWidthInLayers:layers2];
	CGFloat smallestWidth3 = [CALayer smallestWidthInLayers:layers3];
	CGFloat smallestWidth4 = [CALayer smallestWidthInLayers:layers4];

	STAssertEquals(smallestWidth1, 0.0f, @"Actual smallest width in layers1 was %0.1f.", smallestWidth1);
	STAssertEquals(smallestWidth2, 0.0f, @"Actual smallest width in layers2 was %0.1f.", smallestWidth1);
	STAssertEquals(smallestWidth3, 0.0f, @"Actual smallest width in layers3 was %0.1f.", smallestWidth1);
	STAssertEquals(smallestWidth4, 0.0f, @"Actual smallest width in layers4 was %0.1f.", smallestWidth1);
}

- (void)testSmallestHeightInLayersMethods
{
	CALayer *layer1 = [CALayer layer];
	CALayer *layer2 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
	CALayer *layer3 = [CALayer layerWithFrame:CGRectMake(50.0f, 50.0f, 50.0f, 50.0f)];
	CALayer *layer4 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, -100.0f, -100.0f)];

	NSArray *layers1 = [NSArray arrayWithObject:layer1];
	NSArray *layers2 = [NSArray arrayWithObjects:layer1, layer2, nil];
	NSArray *layers3 = [NSArray arrayWithObjects:layer1, layer2, layer3, nil];
	NSArray *layers4 = [NSArray arrayWithObjects:layer1, layer2, layer3, layer4, nil];

	CGFloat smallestHeight1 = [CALayer smallestHeightInLayers:layers1];
	CGFloat smallestHeight2 = [CALayer smallestHeightInLayers:layers2];
	CGFloat smallestHeight3 = [CALayer smallestHeightInLayers:layers3];
	CGFloat smallestHeight4 = [CALayer smallestHeightInLayers:layers4];

	STAssertEquals(smallestHeight1, 0.0f, @"Actual smallest height in layers1 was %0.1f.", smallestHeight1);
	STAssertEquals(smallestHeight2, 0.0f, @"Actual smallest height in layers2 was %0.1f.", smallestHeight2);
	STAssertEquals(smallestHeight3, 0.0f, @"Actual smallest height in layers3 was %0.1f.", smallestHeight3);
	STAssertEquals(smallestHeight4, 0.0f, @"Actual smallest height in layers4 was %0.1f.", smallestHeight4);
}

- (void)testLargestWidthInLayersMethod
{
	CALayer *layer1 = [CALayer layer];
	CALayer *layer2 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
	CALayer *layer3 = [CALayer layerWithFrame:CGRectMake(50.0f, 50.0f, 50.0f, 50.0f)];
	CALayer *layer4 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, -100.0f, -100.0f)];

	NSArray *layers1 = [NSArray arrayWithObject:layer1];
	NSArray *layers2 = [NSArray arrayWithObjects:layer1, layer2, nil];
	NSArray *layers3 = [NSArray arrayWithObjects:layer1, layer2, layer3, nil];
	NSArray *layers4 = [NSArray arrayWithObjects:layer1, layer2, layer3, layer4, nil];

	CGFloat largestWidth1 = [CALayer largestWidthInLayers:layers1];
	CGFloat largestWidth2 = [CALayer largestWidthInLayers:layers2];
	CGFloat largestWidth3 = [CALayer largestWidthInLayers:layers3];
	CGFloat largestWidth4 = [CALayer largestWidthInLayers:layers4];

	STAssertEquals(largestWidth1, 0.0f, @"Actual largest width in layers1 was %0.1f.", largestWidth1);
	STAssertEquals(largestWidth2, 100.0f, @"Actual largest width in layers2 was %0.1f.", largestWidth2);
	STAssertEquals(largestWidth3, 100.0f, @"Actual largest width in layers3 was %0.1f.", largestWidth3);
	STAssertEquals(largestWidth4, 100.0f, @"Actual largest width in layers4 was %0.1f.", largestWidth4);
}

- (void)testLargestHeightInLayersMethod
{
	CALayer *layer1 = [CALayer layer];
	CALayer *layer2 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
	CALayer *layer3 = [CALayer layerWithFrame:CGRectMake(50.0f, 50.0f, 50.0f, 50.0f)];
	CALayer *layer4 = [CALayer layerWithFrame:CGRectMake(0.0f, 0.0f, -100.0f, -100.0f)];

	NSArray *layers1 = [NSArray arrayWithObject:layer1];
	NSArray *layers2 = [NSArray arrayWithObjects:layer1, layer2, nil];
	NSArray *layers3 = [NSArray arrayWithObjects:layer1, layer2, layer3, nil];
	NSArray *layers4 = [NSArray arrayWithObjects:layer1, layer2, layer3, layer4, nil];

	CGFloat largestHeight1 = [CALayer largestHeightInLayers:layers1];
	CGFloat largestHeight2 = [CALayer largestHeightInLayers:layers2];
	CGFloat largestHeight3 = [CALayer largestHeightInLayers:layers3];
	CGFloat largestHeight4 = [CALayer largestHeightInLayers:layers4];

	STAssertEquals(largestHeight1, 0.0f, @"Actual largest height in layers1 was %0.1f.", largestHeight1);
	STAssertEquals(largestHeight2, 100.0f, @"Actual largest height in layers2 was %0.1f.", largestHeight2);
	STAssertEquals(largestHeight3, 100.0f, @"Actual largest height in layers3 was %0.1f.", largestHeight3);
	STAssertEquals(largestHeight4, 100.0f, @"Actual largest height in layers4 was %0.1f.", largestHeight4);
}

- (void)testPresentationCALayerMethod
{
	// This method does not seem to be easily testable. CALayers created in a unit test target do not appear to have presentation layers.
}

- (void)testModelCALayerMethod
{
	STAssertTrue([[self.testLayer modelCALayer] isKindOfClass:[CALayer class]], @"Test layer's model CALayer is not a CALayer.");
	STAssertTrue([[[CAShapeLayer layer] modelCALayer] isKindOfClass:[CALayer class]], @"Shape layer's model CALayer is not a CALayer.");
}

- (void)testAddDefaultFadeTransitionMethod
{
	[self.testLayer addDefaultFadeTransition];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];

	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionFade], @"Added transition type does not equal the string kCATransitionFade.");
	STAssertNil(addedTransition.subtype, @"Added transition subtype is not nil.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddDefaultMoveInTransitionWithSubtypeMethod
{
	// First subtest

	[self.testLayer addDefaultMoveInTransitionWithSubtype:kCATransitionFromTop];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addDefaultMoveInTransitionWithSubtype:kCATransitionFromRight];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromRight],
		@"Added transition subtype does not equal the string kCATransitionFromRight.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addDefaultMoveInTransitionWithSubtype:kCATransitionFromBottom];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromBottom],
		@"Added transition subtype does not equal the string kCATransitionFromBottom.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addDefaultMoveInTransitionWithSubtype:kCATransitionFromLeft];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromLeft],
		@"Added transition subtype does not equal the string kCATransitionFromLeft.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddDefaultPushTransitionWithSubtypeMethod
{
	// First subtest

	[self.testLayer addDefaultPushTransitionWithSubtype:kCATransitionFromTop];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addDefaultPushTransitionWithSubtype:kCATransitionFromRight];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromRight],
		@"Added transition subtype does not equal the string kCATransitionFromRight.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addDefaultPushTransitionWithSubtype:kCATransitionFromBottom];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromBottom],
		@"Added transition subtype does not equal the string kCATransitionFromBottom.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addDefaultPushTransitionWithSubtype:kCATransitionFromLeft];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromLeft],
		@"Added transition subtype does not equal the string kCATransitionFromLeft.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddDefaultRevealTransitionWithSubtypeMethod
{
	// First subtest

	[self.testLayer addDefaultRevealTransitionWithSubtype:kCATransitionFromTop];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addDefaultRevealTransitionWithSubtype:kCATransitionFromRight];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromRight],
		@"Added transition subtype does not equal the string kCATransitionFromRight.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addDefaultRevealTransitionWithSubtype:kCATransitionFromBottom];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromBottom],
		@"Added transition subtype does not equal the string kCATransitionFromBottom.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addDefaultRevealTransitionWithSubtype:kCATransitionFromLeft];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromLeft],
		@"Added transition subtype does not equal the string kCATransitionFromLeft.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddFadeTransitionWithDurationMethod
{
	// First subtest

	[self.testLayer addFadeTransitionWithDuration:1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];

	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionFade], @"Added transition type does not equal the string kCATransitionFade.");
	STAssertNil(addedTransition.subtype, @"Added transition subtype is not nil.");
	STAssertEquals(addedTransition.duration, 1.0, @"Added transition duration does not equal 1.0.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addFadeTransitionWithDuration:0.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];

	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionFade], @"Added transition type does not equal the string kCATransitionFade.");
	STAssertNil(addedTransition.subtype, @"Added transition subtype is not nil.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addFadeTransitionWithDuration:0.01];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];

	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionFade], @"Added transition type does not equal the string kCATransitionFade.");
	STAssertNil(addedTransition.subtype, @"Added transition subtype is not nil.");
	STAssertEquals(addedTransition.duration, 0.01, @"Added transition duration does not equal 0.01.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addFadeTransitionWithDuration:-1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];

	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionFade], @"Added transition type does not equal the string kCATransitionFade.");
	STAssertNil(addedTransition.subtype, @"Added transition subtype is not nil.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddMoveInTransitionWithSubtypeDurationMethod
{
	// First subtest

	[self.testLayer addMoveInTransitionWithSubtype:kCATransitionFromTop duration:1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 1.0, @"Added transition duration does not equal 1.0.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addMoveInTransitionWithSubtype:kCATransitionFromTop duration:0.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addMoveInTransitionWithSubtype:kCATransitionFromTop duration:0.01];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 0.01, @"Added transition duration does not equal 0.01.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addMoveInTransitionWithSubtype:kCATransitionFromTop duration:-1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionMoveIn], @"Added transition type does not equal the string kCATransitionMoveIn.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddPushTransitionWithSubtypeDurationMethod
{
	// First subtest

	[self.testLayer addPushTransitionWithSubtype:kCATransitionFromTop duration:1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 1.0, @"Added transition duration does not equal 1.0.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addPushTransitionWithSubtype:kCATransitionFromTop duration:0.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addPushTransitionWithSubtype:kCATransitionFromTop duration:0.01];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 0.01, @"Added transition duration does not equal 0.01.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addPushTransitionWithSubtype:kCATransitionFromTop duration:-1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionPush], @"Added transition type does not equal the string kCATransitionPush.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddRevealTransitionWithSubtypeDurationMethod
{
	// First subtest

	[self.testLayer addRevealTransitionWithSubtype:kCATransitionFromTop duration:1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	NSString *addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	CAAnimation *addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	CATransition *addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 1.0, @"Added transition duration does not equal 1.0.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Second subtest

	[self.testLayer addRevealTransitionWithSubtype:kCATransitionFromTop duration:0.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];

	// Third subtest

	[self.testLayer addRevealTransitionWithSubtype:kCATransitionFromTop duration:0.01];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, 0.01, @"Added transition duration does not equal 0.01.");

	[self.testLayer removeAnimationForKey:kCATransition];

	// Fourth subtest

	[self.testLayer addRevealTransitionWithSubtype:kCATransitionFromTop duration:-1.0];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"There is not exactly one added animation.");

	addedAnimationKey = [[self.testLayer animationKeys] firstObject];
	addedAnimation = [self.testLayer animationForKey:addedAnimationKey];
	STAssertNotNil(addedAnimationKey, @"Added animation key is nil.");
	STAssertTrue([addedAnimationKey isEqualToString:kCATransition], @"Added animation key does not equal the string kCATransition.");
	STAssertNotNil(addedAnimation, @"Added animation is nil.");
	STAssertTrue([addedAnimation isKindOfClass:[CATransition class]], @"Added animation is not an instance of CATransition.");

	addedTransition = (CATransition *)addedAnimation;

	STAssertTrue([addedTransition.type isEqualToString:kCATransitionReveal], @"Added transition type does not equal the string kCATransitionReveal.");
	STAssertTrue([addedTransition.subtype isEqualToString:kCATransitionFromTop], @"Added transition subtype does not equal the string kCATransitionFromTop.");
	STAssertEquals(addedTransition.duration, LTKDefaultTransitionDuration, [NSString stringWithFormat:@"Added transition duration does not equal %0.2f.",
		LTKDefaultTransitionDuration]);

	[self.testLayer removeAnimationForKey:kCATransition];
}

- (void)testAddAnimationMethod
{
	CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	basicAnimation.duration = 0.2;
	basicAnimation.toValue = [NSNumber numberWithFloat:0.0f];

	[self.testLayer addAnimation:basicAnimation];

	STAssertEquals([[self.testLayer keyedAnimations] count], 0u, @"The number of keyed animations is not 0.");
}

- (void)testAddAnimationForKeyWithStopBlockMethod
{
	static NSString *const SCBasicAnimationKey = @"SCBasicAnimationKey";
	__block volatile BOOL stopBlockFinished = NO;

	CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	basicAnimation.duration = 0.2;
	basicAnimation.toValue = [NSNumber numberWithFloat:0.0f];

	[self.testLayer addAnimation:basicAnimation forKey:SCBasicAnimationKey
		withStopBlock:^(BOOL animationFinished)
		{
			stopBlockFinished = YES;
		}
	];

	STAssertNotNil([self.testLayer animationForKey:SCBasicAnimationKey], @"No animation exists with key SCBasicAnimationKey.");
	STAssertTrue(LTKPerformBlockOnCurrentRunLoopWhileWaiting(2, ^BOOL { return stopBlockFinished; }), @"Animation stop block was never excuted.");
}

- (void)testAddAnimationForKeyWithStartBlockStopBlockMethod
{
	static NSString *const SCBasicAnimationKey = @"SCBasicAnimationKey";
	__block volatile BOOL startBlockFinished = NO;
	__block volatile BOOL stopBlockFinished = NO;

	CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	basicAnimation.duration = 0.2;
	basicAnimation.toValue = [NSNumber numberWithFloat:0.0f];

	[self.testLayer addAnimation:basicAnimation forKey:SCBasicAnimationKey
		withStartBlock:^
		{
			startBlockFinished = YES;
		}
		stopBlock:^(BOOL animationFinished)
		{
			stopBlockFinished = YES;
		}
	];

	STAssertNotNil([self.testLayer animationForKey:SCBasicAnimationKey], @"No animation exists with key SCBasicAnimationKey.");
	STAssertTrue(LTKPerformBlockOnCurrentRunLoopWhileWaiting(2, ^BOOL { return startBlockFinished; }), @"Animation start block was never excuted.");
	STAssertTrue(LTKPerformBlockOnCurrentRunLoopWhileWaiting(2, ^BOOL { return stopBlockFinished; }), @"Animation stop block was never excuted.");
}

- (void)testKeyedAnimationsMethod
{
	static NSString *const SCBasicAnimation2Key = @"SCBasicAnimation2Key";

	CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
	basicAnimation1.duration = 0.2;
	basicAnimation1.toValue = [NSNumber numberWithFloat:0.0f];

	CABasicAnimation *basicAnimation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
	basicAnimation2.duration = 0.2;
	basicAnimation2.toValue = [NSNumber numberWithFloat:0.0f];

	[self.testLayer addAnimation:basicAnimation1];

	STAssertEquals([[self.testLayer keyedAnimations] count], 0u, @"The number of keyed animations is not 0.");

	[self.testLayer addAnimation:basicAnimation2 forKey:SCBasicAnimation2Key];

	STAssertEquals([[self.testLayer keyedAnimations] count], 1u, @"The number of keyed animations is not 1.");
}

- (void)testRenderToImageMethod
{
	UIImage *renderedLayerImage1 = [self.testLayer renderToImage];
	UIImage *renderedLayerImage2 = [[CALayer layer] renderToImage];

	STAssertNotNil(renderedLayerImage1, @"Rendered layer image is nil.");
	STAssertNil(renderedLayerImage2, @"Rendered layer image is not nil.");
	STAssertTrue(CGSizeEqualToSize(renderedLayerImage1.size, self.testLayer.frameSize),
		@"The size of the rendered image does not equal the size of the layer.");
}

- (void)testRenderToImageWithContextSizeMethod
{
	UIImage *renderedLayerImage1 = [self.testLayer renderToImageWithContextSize:CGSizeMake(-25.0f, -25.0f)];
	UIImage *renderedLayerImage2 = [self.testLayer renderToImageWithContextSize:LTKSizeScaleFactor(self.testLayer.frameSize, 0.5f, 0.5f)];
	UIImage *renderedLayerImage3 = [self.testLayer renderToImageWithContextSize:CGSizeZero];

	STAssertNil(renderedLayerImage1, @"Rendered layer image is not nil.");
	STAssertNotNil(renderedLayerImage2, @"Rendered layer image is nil.");
	STAssertNotNil(renderedLayerImage3, @"Rendered layer image is nil.");
	STAssertTrue(CGSizeEqualToSize(renderedLayerImage2.size, LTKSizeScaleFactor(self.testLayer.frameSize, 0.5f, 0.5f)),
		@"The size of the rendered image does not equal half the size of the layer.");
	STAssertTrue(CGSizeEqualToSize(renderedLayerImage3.size, self.testLayer.frameSize),
		@"The size of the rendered image does not equal the size of the layer.");
}

- (void)testRenderToImageWithContextSizeContextTransformMethod
{
	// A pixel-level test would be required to determine how the context was transformed.
	// TODO: Add a category on UIImage to return pixel data.
}

- (void)testEnableDebugBordersRecursivelyMethod
{
	CALayer *sublayer1 = [CALayer layer];
	CALayer *sublayer2 = [CALayer layer];

	[self.testLayer addSublayer:sublayer1];
	[self.testLayer addSublayer:sublayer2];

	[self.testLayer enableDebugBordersRecursively:NO];

	STAssertEquals(self.testLayer.borderWidth, 1.0f, @"The border width of the test layer is not 1.0f.");
	STAssertEquals(sublayer1.borderWidth, 0.0f, @"The border width of sublayer 1 is not 0.0f.");
	STAssertEquals(sublayer2.borderWidth, 0.0f, @"The border width of sublayer 2 is not 0.0f.");

	[self.testLayer enableDebugBordersRecursively:YES];

	STAssertEquals(self.testLayer.borderWidth, 1.0f, @"The border width of the test layer is not 1.0f.");
	STAssertEquals(sublayer1.borderWidth, 1.0f, @"The border width of sublayer 1 is not 1.0f.");
	STAssertEquals(sublayer2.borderWidth, 1.0f, @"The border width of sublayer 2 is not 1.0f.");
}

@end