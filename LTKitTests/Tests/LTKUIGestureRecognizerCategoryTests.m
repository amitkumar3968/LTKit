//
//	LTKUIGestureRecognizerCategoryTests.m
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

#import "LTKUIGestureRecognizerCategoryTests.h"

#pragma mark Class Extension -

@interface LTKUIGestureRecognizerCategoryTests ()

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;

@end

@implementation LTKUIGestureRecognizerCategoryTests

#pragma mark - LTKUIGestureRecognizerCategoryTests Methods (Private)

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
	// Intentionally empty
}

#pragma mark - Unit Tests

- (void)testGestureRecognizerWithTargetActionMethod
{
	UIGestureRecognizer *gestureRecognizer = [UIGestureRecognizer gestureRecognizerWithTarget:self action:@selector(handleGesture:)];

	STAssertNotNil(gestureRecognizer, @"Gesture recognizer is nil.");
}

@end
