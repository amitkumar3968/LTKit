//
//	LTKNSArrayCategoryTests.m
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

#import "LTKNSArrayCategoryTests.h"

#pragma mark LTKNSArrayCategoryTestsObject Internal Class

@interface LTKNSArrayCategoryTestsObject : NSObject

@property (readwrite, nonatomic, strong) NSString *stringProperty;
@property (readwrite, nonatomic, strong) NSNumber *numberProperty;

+ (id)objectWithStringProperty:(NSString *)stringProperty numberProperty:(NSNumber *)numberProperty;
- (id)initWithStringProperty:(NSString *)stringProperty numberProperty:(NSNumber *)numberProperty;

@end

@implementation LTKNSArrayCategoryTestsObject

@synthesize stringProperty;
@synthesize numberProperty;

+ (id)objectWithStringProperty:(NSString *)stringProperty numberProperty:(NSNumber *)numberProperty
{
	return [[self alloc] initWithStringProperty:stringProperty numberProperty:numberProperty];
}

- (id)initWithStringProperty:(NSString *)newStringProperty numberProperty:(NSNumber *)newNumberProperty
{
	self = [super init];

	if (self != nil)
	{
		self.stringProperty = newStringProperty;
		self.numberProperty = newNumberProperty;
	}

	return self;
}

@end

#pragma mark - Class Extension -

@interface LTKNSArrayCategoryTests ()

@property (readwrite, nonatomic, copy) NSArray *testArray;
@property (readwrite, nonatomic, strong) NSString *testArrayFirstObject;
@property (readwrite, nonatomic, strong) NSString *testArrayLastObject;

@end

@implementation LTKNSArrayCategoryTests

@synthesize testArray;
@synthesize testArrayFirstObject;
@synthesize testArrayLastObject;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	self.testArrayFirstObject = @"G";
	self.testArrayLastObject = @"A";
	self.testArray = [NSArray arrayWithObjects:self.testArrayFirstObject, @"F", @"E", @"D", @"C", @"B", self.testArrayLastObject, nil];
}

#pragma mark - Unit Tests

- (void)testIsEmptyMethod
{
	NSArray *immutableArray = [NSArray array];
	NSMutableArray *mutableArray = [NSMutableArray array];

	STAssertFalse([self.testArray isEmpty], @"The test array is not empty.");
	STAssertTrue([immutableArray isEmpty], @"The immutable array is not empty.");
	STAssertTrue([mutableArray isEmpty], @"The mutable array is not empty.");

	[mutableArray addObject:@"A"];

	STAssertFalse([mutableArray isEmpty], @"The mutable array is empty.");
}

- (void)testIsNotEmptyMethod
{
	NSArray *immutableArray = [NSArray array];
	NSMutableArray *mutableArray = [NSMutableArray array];

	STAssertTrue([self.testArray isNotEmpty], @"The test array is empty.");
	STAssertFalse([immutableArray isNotEmpty], @"The immutable array is not empty.");
	STAssertFalse([mutableArray isNotEmpty], @"The mutable array is not empty.");

	[mutableArray addObject:@"A"];

	STAssertTrue([mutableArray isNotEmpty], @"The mutable array is empty.");
}

- (void)testFirstObjectMethod
{
	STAssertEqualObjects([self.testArray firstObject], self.testArrayFirstObject,
		@"The first object in the test array did not equal the first object added to the array.");
	STAssertNil([[NSArray array] firstObject], @"The first object of an empty array was not nil.");
}

- (void)testObjectAtBoundedIndexMethod
{
	for (NSUInteger index = 0; index < 100; index++)
	{
		STAssertNoThrowSpecificNamed([self.testArray objectAtBoundedIndex:index], NSException, NSRangeException, @"A range exception was thrown.");

		if (index >= [self.testArray count])
		{
			STAssertEqualObjects([self.testArray objectAtBoundedIndex:index], self.testArrayLastObject,
				@"The upper bounded object did not equal the last object added to the array.");
		}
	}

	NSArray *emptyArray = [NSArray array];

	STAssertThrowsSpecificNamed([emptyArray objectAtBoundedIndex:0], NSException, NSRangeException, @"A range exception was not thrown.");
}

- (void)testSortedArrayUsingDescriptorMethod
{
	LTKNSArrayCategoryTestsObject *firstObjectAdded = [LTKNSArrayCategoryTestsObject objectWithStringProperty:@"C" numberProperty:[NSNumber numberWithInt:2]];
	LTKNSArrayCategoryTestsObject *secondObjectAdded = [LTKNSArrayCategoryTestsObject objectWithStringProperty:@"B" numberProperty:[NSNumber numberWithInt:3]];
	LTKNSArrayCategoryTestsObject *thirdObjectAdded = [LTKNSArrayCategoryTestsObject objectWithStringProperty:@"A" numberProperty:[NSNumber numberWithInt:1]];

	NSArray *testObjects = [NSArray arrayWithObjects:firstObjectAdded, secondObjectAdded, thirdObjectAdded, nil];

	// First subtest

	NSSortDescriptor *stringPropertySortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"stringProperty" ascending:YES];
	NSArray *sortedTestObjectsByStringProperty = [testObjects sortedArrayUsingDescriptor:stringPropertySortDescriptor];

	STAssertEqualObjects([sortedTestObjectsByStringProperty firstObject], thirdObjectAdded,
		@"The first object of the array sorted by stringProperty is not equal to the third object added to the original array.");
	STAssertEqualObjects([sortedTestObjectsByStringProperty objectAtIndex:1], secondObjectAdded,
		@"The second object of the array sorted by stringProperty is not equal to the second object added to the original array.");
	STAssertEqualObjects([sortedTestObjectsByStringProperty lastObject], firstObjectAdded,
		@"The third object of the array sorted by stringProperty is not equal to the first object added to the original array.");

	// Second subtest

	NSSortDescriptor *numberPropertyDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"numberProperty" ascending:YES];
	NSArray *sortedTestObjectsByNumberProperty = [testObjects sortedArrayUsingDescriptor:numberPropertyDescriptor];

	STAssertEqualObjects([sortedTestObjectsByNumberProperty firstObject], thirdObjectAdded,
		@"The first object of the array sorted by numberProperty is not equal to the third object added to the original array.");
	STAssertEqualObjects([sortedTestObjectsByNumberProperty objectAtIndex:1], firstObjectAdded,
		@"The second object of the array sorted by numberProperty is not equal to the first object added to the original array.");
	STAssertEqualObjects([sortedTestObjectsByNumberProperty lastObject], secondObjectAdded,
		@"The third object of the array sorted by numberProperty is not equal to the second object added to the original array.");
}

- (void)testSortedArrayMethod
{
	NSString *firstObjectAdded = @"B";
	NSString *secondObjectAdded = @"C";
	NSString *thirdObjectAdded = @"A";

	NSArray *testObjects = [NSArray arrayWithObjects:firstObjectAdded, secondObjectAdded, thirdObjectAdded, nil];

	NSArray *sortedTestObjects = [testObjects sortedArray];

	STAssertEqualObjects([sortedTestObjects firstObject], thirdObjectAdded,
		@"The first object of the array sorted by stringProperty is not equal to the third object added to the original array.");
	STAssertEqualObjects([sortedTestObjects objectAtIndex:1], firstObjectAdded,
		@"The second object of the array sorted by stringProperty is not equal to the first object added to the original array.");
	STAssertEqualObjects([sortedTestObjects lastObject], secondObjectAdded,
		@"The third object of the array sorted by stringProperty is not equal to the second object added to the original array.");
}

- (void)testReversedArrayMethod
{
	NSString *firstObjectAdded = @"A";
	NSString *secondObjectAdded = @"B";
	NSString *thirdObjectAdded = @"C";

	NSArray *testObjects = [NSArray arrayWithObjects:firstObjectAdded, secondObjectAdded, thirdObjectAdded, nil];

	NSArray *reversedTestObjects = [testObjects reversedArray];

	STAssertEqualObjects([reversedTestObjects firstObject], thirdObjectAdded,
		@"The first object of the reversed array is not equal to the third object added to the original array.");
	STAssertEqualObjects([reversedTestObjects objectAtIndex:1], secondObjectAdded,
		@"The second object of the reversed array is not equal to the second object added to the original array.");
	STAssertEqualObjects([reversedTestObjects lastObject], firstObjectAdded,
		@"The third object of the reversed array is not equal to the first object added to the original array.");

	STAssertTrue([[reversedTestObjects reversedArray] isEqualToArray:testObjects], @"The reversed reversed array did not equal the original array.");
}

@end