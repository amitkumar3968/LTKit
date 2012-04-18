//
//	LTKUIViewCategoryTests.m
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

#import "LTKUIViewCategoryTests.h"

#pragma mark Class Extension -

@interface LTKUIViewCategoryTests ()

@property (readwrite, nonatomic, strong) UIView *testView;

@end

@implementation LTKUIViewCategoryTests

@synthesize testView;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	self.testView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
}

#pragma mark - Unit Tests

- (void)testFrameOriginProperty
{
	self.testView.frameOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameSizeProperty
{
	self.testView.frameSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);

	self.testView.frameSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameXProperty
{
	self.testView.frameX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameYProperty
{
	self.testView.frameY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameWidthProperty
{
	self.testView.frameWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameHeightProperty
{
	self.testView.frameHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMinXProperty
{
	self.testView.frameMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMidXProperty
{
	self.testView.frameMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMaxXProperty
{
	self.testView.frameMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMinYProperty
{
	self.testView.frameMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMidYProperty
{
	self.testView.frameMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMaxYProperty
{
	self.testView.frameMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameTopLeftPointProperty
{
	self.testView.frameTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameTopMiddlePointProperty
{
	self.testView.frameTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameTopRightPointProperty
{
	self.testView.frameTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMiddleRightPointProperty
{
	self.testView.frameMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameBottomRightPointProperty
{
	self.testView.frameBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameBottomMiddlePointProperty
{
	self.testView.frameBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameBottomLeftPointProperty
{
	self.testView.frameBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testFrameMiddleLeftPointProperty
{
	self.testView.frameMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.testView.frame)], nil);
}

- (void)testBoundsOriginProperty
{
	self.testView.boundsOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsSizeProperty
{
	self.testView.boundsSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);

	self.testView.boundsSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsXProperty
{
	self.testView.boundsX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsYProperty
{
	self.testView.boundsY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsWidthProperty
{
	self.testView.boundsWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsHeightProperty
{
	self.testView.boundsHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMinXProperty
{
	self.testView.boundsMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMidXProperty
{
	self.testView.boundsMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMaxXProperty
{
	self.testView.boundsMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMinYProperty
{
	self.testView.boundsMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMidYProperty
{
	self.testView.boundsMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMaxYProperty
{
	self.testView.boundsMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsTopLeftPointProperty
{
	self.testView.boundsTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsTopMiddlePointProperty
{
	self.testView.boundsTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsTopRightPointProperty
{
	self.testView.boundsTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMiddleRightPointProperty
{
	self.testView.boundsMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsBottomRightPointProperty
{
	self.testView.boundsBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsBottomMiddlePointProperty
{
	self.testView.boundsBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsBottomLeftPointProperty
{
	self.testView.boundsBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testBoundsMiddleLeftPointProperty
{
	self.testView.boundsMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.testView.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.testView.bounds)], nil);
}

- (void)testViewWithFrameMethod
{
	UIView *view = [UIView viewWithFrame:CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)];

	STAssertNotNil(view, @"View is nil.");
	STAssertTrue(CGRectEqualToRect(view.frame, CGRectMake(10.0f, 20.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(view.frame)], nil);
	STAssertTrue(CGRectEqualToRect(view.bounds, CGRectMake(0.0f, 0.0f, 30.0f, 40.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(view.bounds)], nil);
}

@end