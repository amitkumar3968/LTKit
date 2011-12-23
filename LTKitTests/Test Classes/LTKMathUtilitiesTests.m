//
//	LTKMathUtilitiesTests.m
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

#import "LTKMathUtilitiesTests.h"
#import "LTKMath.h"

@implementation LTKMathUtilitiesTests

- (void)testClampMacro
{
	STAssertEquals(LTK_CLAMP(50, 0, 100), 50, @"Clamping 50 between 0 and 100 didn't result in 50.");
	STAssertEquals(LTK_CLAMP(50, 51, 100), 51, @"Clamping 50 between 51 and 100 didn't result in 51.");
	STAssertEquals(LTK_CLAMP(-50, -100, 0), -50, @"Clamping -50 between -100 and 0 didn't result in -50.");
	STAssertEquals(LTK_CLAMP(-50, -49, 0), -49, @"Clamping -50 between -49 and 0 didn't result in -49.");
	STAssertEquals(LTK_CLAMP(50, 50, 100), 50, @"Clamping 50 between 50 and 100 didn't result in 50.");
	STAssertEquals(LTK_CLAMP(100, 50, 100), 100, @"Clamping 100 between 50 and 100 didn't result in 100.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(50.25f, 0.25f, 100.25f), 50.25f, 0.01f, @"Clamping 50.25f between 0.25f and 100.25f didn't result in 50.25f.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(50.25f, 50.50f, 100.25f), 50.50f, 0.01f, @"Clamping 50.25f between 50.50f and 100.25f didn't result in 50.50f.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(-50.25f, -100.25f, 0.25f), -50.25f, 0.01f, @"Clamping -50.25f between -100.25f and 0.25f didn't result in -50.25f.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(-50.25f, -50.00f, 0.25f), -50.00f, 0.01f, @"Clamping -50.25f between -50.00f and 0.25f didn't result in -50.00f.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(50.25f, 50.25f, 100.25f), 50.25f, 0.01f, @"Clamping 50.25f between 50.25f and 100.25f didn't result in 50.25f.");
	STAssertEqualsWithAccuracy(LTK_CLAMP(100.25f, 50.25f, 100.25f), 100.25f, 0.01f, @"Clamping 100.25f between 50.25f and 100.25f didn't result in 100.25f.");
	STAssertThrows(LTK_CLAMP(50, 100, 0), @"Clamping 50 between 100 and 0 didn't throw an exception.");
	STAssertThrows(LTK_CLAMP(-50, 0, -100), @"Clamping -50 between 0 and -100 didn't throw an exception.");
	STAssertThrows(LTK_CLAMP(50.25f, 100.25f, 0.25f), @"Clamping 50.25f between 100.25f and 0.25f didn't throw an exception.");
	STAssertThrows(LTK_CLAMP(-50.25f, 0.25f, -100.25f), @"Clamping -50.25f between 0.25f and -100.25f didn't throw an exception.");
}

@end