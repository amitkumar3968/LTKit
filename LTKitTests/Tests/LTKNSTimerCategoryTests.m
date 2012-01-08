//
//	LTKNSTimerCategoryTests.m
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

#import "LTKNSTimerCategoryTests.h"
#import "NSTimer+LTKAdditions.h"

@implementation LTKNSTimerCategoryTests

#pragma mark - Unit Tests

- (void)testScheduledTimerWithTimeIntervalRepeatsBlockMethod
{
	NSTimer *nonRepeatingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:NO
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(nonRepeatingTimer, @"Non-repeating timer is nil.");
	STAssertTrue([nonRepeatingTimer isValid], @"Non-repeating timer is not valid.");
	STAssertEqualsWithAccuracy([nonRepeatingTimer timeInterval], 0.0, 0.0001, @"Non-repeating timer's time interval does not equal 0.0.");
	STAssertNotNil([nonRepeatingTimer userInfo], @"Non-repeating timer's user info is nil.");

	[nonRepeatingTimer fire];

	STAssertFalse([nonRepeatingTimer isValid], @"Non-repeating timer is still valid.");

	NSTimer *repeatingTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(repeatingTimer, @"Repeating timer is nil.");
	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
	STAssertEqualsWithAccuracy([repeatingTimer timeInterval], 0.5, 0.0001, @"Repeating timer's time interval does not equal 0.5.");
	STAssertNotNil([repeatingTimer userInfo], @"Repeating timer's user info is nil.");

	[repeatingTimer fire];

	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
}

- (void)testTimerWithTimeIntervalRepeatsBlockMethod
{
	NSTimer *nonRepeatingTimer = [NSTimer timerWithTimeInterval:1.0 repeats:NO
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(nonRepeatingTimer, @"Non-repeating timer is nil.");
	STAssertTrue([nonRepeatingTimer isValid], @"Non-repeating timer is not valid.");
	STAssertEqualsWithAccuracy([nonRepeatingTimer timeInterval], 0.0, 0.0001, @"Non-repeating timer's time interval does not equal 0.0.");
	STAssertNotNil([nonRepeatingTimer userInfo], @"Non-repeating timer's user info is nil.");

	[nonRepeatingTimer fire];

	STAssertFalse([nonRepeatingTimer isValid], @"Non-repeating timer is still valid.");

	NSTimer *repeatingTimer = [NSTimer timerWithTimeInterval:0.5 repeats:YES
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(repeatingTimer, @"Repeating timer is nil.");
	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
	STAssertEqualsWithAccuracy([repeatingTimer timeInterval], 0.5, 0.0001, @"Repeating timer's time interval does not equal 0.5.");
	STAssertNotNil([repeatingTimer userInfo], @"Repeating timer's user info is nil.");

	[repeatingTimer fire];

	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
}

- (void)testTimerWithFireDateTimeIntervalRepeatsBlockMethod
{
	NSDate *nonRepeatingTimerFireDate = [NSDate date];

	NSTimer *nonRepeatingTimer = [NSTimer timerWithFireDate:nonRepeatingTimerFireDate timeInterval:1.0 repeats:NO
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(nonRepeatingTimer, @"Non-repeating timer is nil.");
	STAssertTrue([nonRepeatingTimer isValid], @"Non-repeating timer is not valid.");
	STAssertEqualsWithAccuracy([nonRepeatingTimer timeInterval], 0.0, 0.0001, @"Non-repeating timer's time interval does not equal 0.0.");
	STAssertNotNil([nonRepeatingTimer userInfo], @"Non-repeating timer's user info is nil.");
	STAssertEqualObjects([nonRepeatingTimer fireDate], nonRepeatingTimerFireDate, @"Non-repeating timer's fire date is not equal to the input fire date.");

	[nonRepeatingTimer fire];

	STAssertFalse([nonRepeatingTimer isValid], @"Non-repeating timer is still valid.");

	NSDate *repeatingTimerFireDate = [NSDate date];

	NSTimer *repeatingTimer = [NSTimer timerWithFireDate:repeatingTimerFireDate timeInterval:0.5 repeats:YES
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(repeatingTimer, @"Repeating timer is nil.");
	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
	STAssertEqualsWithAccuracy([repeatingTimer timeInterval], 0.5, 0.0001, @"Repeating timer's time interval does not equal 0.5.");
	STAssertNotNil([repeatingTimer userInfo], @"Repeating timer's user info is nil.");
	STAssertEqualObjects([repeatingTimer fireDate], repeatingTimerFireDate, @"Repeating timer's fire date is not equal to the input fire date.");

	[repeatingTimer fire];

	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
}

- (void)testInitWithFireDateTimeIntervalRepeatsBlockMethod
{
	NSDate *nonRepeatingTimerFireDate = [NSDate date];

	NSTimer *nonRepeatingTimer = [[NSTimer alloc] initWithFireDate:nonRepeatingTimerFireDate timeInterval:1.0 repeats:NO
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(nonRepeatingTimer, @"Non-repeating timer is nil.");
	STAssertTrue([nonRepeatingTimer isValid], @"Non-repeating timer is not valid.");
	STAssertEqualsWithAccuracy([nonRepeatingTimer timeInterval], 0.0, 0.0001, @"Non-repeating timer's time interval does not equal 0.0.");
	STAssertNotNil([nonRepeatingTimer userInfo], @"Non-repeating timer's user info is nil.");
	STAssertEqualObjects([nonRepeatingTimer fireDate], nonRepeatingTimerFireDate, @"Non-repeating timer's fire date is not equal to the input fire date.");

	[nonRepeatingTimer fire];

	STAssertFalse([nonRepeatingTimer isValid], @"Non-repeating timer is still valid.");

	NSDate *repeatingTimerFireDate = [NSDate date];

	NSTimer *repeatingTimer = [[NSTimer alloc] initWithFireDate:repeatingTimerFireDate timeInterval:0.5 repeats:YES
		block:
		^{
			// Intentionally empty
		}
	];

	STAssertNotNil(repeatingTimer, @"Repeating timer is nil.");
	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
	STAssertEqualsWithAccuracy([repeatingTimer timeInterval], 0.5, 0.0001, @"Repeating timer's time interval does not equal 0.5.");
	STAssertNotNil([repeatingTimer userInfo], @"Repeating timer's user info is nil.");
	STAssertEqualObjects([repeatingTimer fireDate], repeatingTimerFireDate, @"Repeating timer's fire date is not equal to the input fire date.");

	[repeatingTimer fire];

	STAssertTrue([repeatingTimer isValid], @"Repeating timer is not valid.");
}

@end