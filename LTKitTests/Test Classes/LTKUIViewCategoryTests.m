//
//	LTKUIViewCategoryTests.m
//	LTKitTests
//
//	Copyright (c) 2011 Michael Potter
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

#import "LTKUIViewCategoryTests.h"
#import "UIView+LTKAdditions.h"

#pragma mark Class Extension -

@interface LTKUIViewCategoryTests ()

@property (readwrite, nonatomic, strong) UIView *superview;
@property (readwrite, nonatomic, strong) UIView *subview;

@end

@implementation LTKUIViewCategoryTests

@synthesize superview;
@synthesize subview;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	self.superview = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
	self.subview = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];

	[self.superview addSubview:self.subview];
}

- (void)tearDown
{
	[super tearDown];
}

#pragma mark - Unit Tests

- (void)testFrameOriginProperty
{
	self.subview.frameOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameSizeProperty
{
	self.subview.frameSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);

	self.subview.frameSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameXProperty
{
	self.subview.frameX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameYProperty
{
	self.subview.frameY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameWidthProperty
{
	self.subview.frameWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameHeightProperty
{
	self.subview.frameHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMinXProperty
{
	self.subview.frameMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMidXProperty
{
	self.subview.frameMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMaxXProperty
{
	self.subview.frameMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMinYProperty
{
	self.subview.frameMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMidYProperty
{
	self.subview.frameMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMaxYProperty
{
	self.subview.frameMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameTopLeftPointProperty
{
	self.subview.frameTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameTopMiddlePointProperty
{
	self.subview.frameTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameTopRightPointProperty
{
	self.subview.frameTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMiddleRightPointProperty
{
	self.subview.frameMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameBottomRightPointProperty
{
	self.subview.frameBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameBottomMiddlePointProperty
{
	self.subview.frameBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameBottomLeftPointProperty
{
	self.subview.frameBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testFrameMiddleLeftPointProperty
{
	self.subview.frameMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.frame, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual frame is %@.", NSStringFromCGRect(self.subview.frame), nil], nil);
}

- (void)testBoundsOriginProperty
{
	self.subview.boundsOrigin = CGPointMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(50.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsSizeProperty
{
	self.subview.boundsSize = CGSizeMake(50.0f, 50.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);

	self.subview.boundsSize = CGSizeMake(-100.0f, -100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(-100.0f, -100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsXProperty
{
	self.subview.boundsX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsYProperty
{
	self.subview.boundsY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsWidthProperty
{
	self.subview.boundsWidth = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 0.0f, 200.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsHeightProperty
{
	self.subview.boundsHeight = 30.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMinXProperty
{
	self.subview.boundsMinX = 25.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(25.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMidXProperty
{
	self.subview.boundsMidX = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(50.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMaxXProperty
{
	self.subview.boundsMaxX = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(100.0f, 0.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMinYProperty
{
	self.subview.boundsMinY = 75.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMidYProperty
{
	self.subview.boundsMidY = 100.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMaxYProperty
{
	self.subview.boundsMaxY = 200.0f;

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsTopLeftPointProperty
{
	self.subview.boundsTopLeftPoint = CGPointMake(25.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(25.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsTopMiddlePointProperty
{
	self.subview.boundsTopMiddlePoint = CGPointMake(100.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(50.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsTopRightPointProperty
{
	self.subview.boundsTopRightPoint = CGPointMake(200.0f, 75.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(100.0f, 75.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMiddleRightPointProperty
{
	self.subview.boundsMiddleRightPoint = CGPointMake(200.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsBottomRightPointProperty
{
	self.subview.boundsBottomRightPoint = CGPointMake(200.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsBottomMiddlePointProperty
{
	self.subview.boundsBottomMiddlePoint = CGPointMake(100.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(50.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsBottomLeftPointProperty
{
	self.subview.boundsBottomLeftPoint = CGPointMake(0.0f, 200.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 100.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

- (void)testBoundsMiddleLeftPointProperty
{
	self.subview.boundsMiddleLeftPoint = CGPointMake(0.0f, 100.0f);

	STAssertTrue(CGRectEqualToRect(self.subview.bounds, CGRectMake(0.0f, 50.0f, 100.0f, 100.0f)),
		[NSString stringWithFormat:@"The actual bounds are %@.", NSStringFromCGRect(self.subview.bounds), nil], nil);
}

@end