//
//	LTKNSStringCategoryTests.m
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

#import "LTKNSStringCategoryTests.h"

@implementation LTKNSStringCategoryTests

#pragma mark - Unit Tests

- (void)testStringIsEmptyMethod
{
	NSString *string1 = nil;
	NSString *string2 = @"string";
	NSString *string3 = @"";
	NSString *string4 = [string3 copy];

	STAssertTrue([NSString stringIsEmpty:string1], @"String 1 is not empty.");
	STAssertFalse([NSString stringIsEmpty:string2], @"String 2 is empty.");
	STAssertTrue([NSString stringIsEmpty:string3], @"String 3 is not empty.");
	STAssertTrue([NSString stringIsEmpty:string4], @"String 4 is not empty.");
}

- (void)testStringIsNotEmptyMethod
{
	NSString *string1 = nil;
	NSString *string2 = @"string";
	NSString *string3 = @"";
	NSString *string4 = [string3 copy];

	STAssertFalse([NSString stringIsNotEmpty:string1], @"String 1 is not empty.");
	STAssertTrue([NSString stringIsNotEmpty:string2], @"String 2 is empty.");
	STAssertFalse([NSString stringIsNotEmpty:string3], @"String 3 is not empty.");
	STAssertFalse([NSString stringIsNotEmpty:string4], @"String 4 is not empty.");
}

- (void)testIsEmptyMethod
{
	NSString *string1 = nil;
	NSString *string2 = @"string";
	NSString *string3 = @"";
	NSString *string4 = [string3 copy];

	STAssertFalse([string1 isEmpty], @"A message sent to nil did not return nil.");
	STAssertFalse([string2 isEmpty], @"String 2 is empty.");
	STAssertTrue([string3 isEmpty], @"String 3 is not empty.");
	STAssertTrue([string4 isEmpty], @"String 4 is not empty.");
}

- (void)testIsNotEmptyMethod
{
	NSString *string1 = nil;
	NSString *string2 = @"string";
	NSString *string3 = @"";
	NSString *string4 = [string3 copy];

	STAssertFalse([string1 isNotEmpty], @"A message sent to nil did not return nil.");
	STAssertTrue([string2 isNotEmpty], @"String 2 is empty.");
	STAssertFalse([string3 isNotEmpty], @"String 3 is not empty.");
	STAssertFalse([string4 isNotEmpty], @"String 4 is not empty.");
}

- (void)testIsNotEqualToStringMethod
{
	NSString *string1 = @"string1";
	NSString *string2 = string1;
	NSString *string3 = [string1 copy];
	NSString *string4 = @"string1";
	NSString *string5 = @"string5";

	STAssertFalse([string1 isNotEqualToString:string2], @"String 1 and string 2 are not equal.");
	STAssertFalse([string1 isNotEqualToString:string3], @"String 1 and string 3 are not equal.");
	STAssertFalse([string1 isNotEqualToString:string4], @"String 1 and string 4 are not equal.");
	STAssertTrue([string1 isNotEqualToString:string5], @"String 1 and string 5 are equal.");
	STAssertFalse([string2 isNotEqualToString:string3], @"String 2 and string 3 are not equal.");
	STAssertFalse([string2 isNotEqualToString:string4], @"String 2 and string 4 are not equal.");
	STAssertTrue([string2 isNotEqualToString:string5], @"String 2 and string 5 are equal.");
	STAssertFalse([string3 isNotEqualToString:string4], @"String 3 and string 4 are not equal.");
	STAssertTrue([string3 isNotEqualToString:string5], @"String 3 and string 5 are equal.");
	STAssertTrue([string4 isNotEqualToString:string5], @"String 4 and string 5 are equal.");
}

- (void)testIsContainedInStringsMethod
{
	NSString *string1 = @"string1";
	NSString *string2 = [string1 copy];
	NSString *string3 = @"string3";
	NSString *string4 = @"string4";

	STAssertTrue(([string1 isContainedInStrings:string1, string2, string3, string4, nil]), @"String 1 is not contained in the sequence of strings.");
	STAssertTrue(([string2 isContainedInStrings:string1, string2, string3, string4, nil]), @"String 2 is not contained in the sequence of strings.");
	STAssertTrue(([string3 isContainedInStrings:string1, string2, string3, string4, nil]), @"String 3 is not contained in the sequence of strings.");
	STAssertTrue(([string4 isContainedInStrings:string1, string2, string3, string4, nil]), @"String 4 is not contained in the sequence of strings.");
	STAssertTrue(([@"string1" isContainedInStrings:string1, string2, string3, string4, nil]), @"String 1 is not contained in the sequence of strings.");
	STAssertFalse(([@"string2" isContainedInStrings:string1, string2, string3, string4, nil]), @"String 2 is contained in the sequence of strings.");
	STAssertTrue(([@"string3" isContainedInStrings:string1, string2, string3, string4, nil]), @"String 3 is not contained in the sequence of strings.");
	STAssertTrue(([@"string4" isContainedInStrings:string1, string2, string3, string4, nil]), @"String 4 is not contained in the sequence of strings.");
	STAssertTrue(([string1 isContainedInStrings:@"string1", string2, string3, string4, nil]), @"String 1 is not contained in the sequence of strings.");
	STAssertTrue(([string2 isContainedInStrings:@"string1", string2, string3, string4, nil]), @"String 2 is not contained in the sequence of strings.");
	STAssertTrue(([string3 isContainedInStrings:string1, string2, @"string3", string4, nil]), @"String 3 is not contained in the sequence of strings.");
	STAssertTrue(([string4 isContainedInStrings:string1, string2, string3, @"string4", nil]), @"String 4 is not contained in the sequence of strings.");
	STAssertFalse(([@"string5" isContainedInStrings:string1, string2, string3, string4, nil]), @"String 5 is contained in the sequence of strings.");
}

@end