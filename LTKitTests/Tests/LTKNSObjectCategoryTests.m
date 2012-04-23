//
//	LTKNSObjectCategoryTests.m
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

#import "LTKNSObjectCategoryTests.h"

#pragma mark LTKNSObjectCategoryTestsObject Internal Class

@interface LTKNSObjectCategoryTestsObject : NSObject <NSCopying>

@property (readwrite, nonatomic, strong) NSObject *objectProperty;

@end

@implementation LTKNSObjectCategoryTestsObject

@synthesize objectProperty;

#pragma mark - Protocol Implementations

#pragma mark - NSCopying Methods

- (id)copyWithZone:(NSZone *)zone
{
	LTKNSObjectCategoryTestsObject *objectCopy = [LTKNSObjectCategoryTestsObject new];
	objectCopy.objectProperty = self.objectProperty;

	return objectCopy;
}

@end

#pragma mark - Class Extension -

@interface LTKNSObjectCategoryTests ()

@property (readwrite, nonatomic, strong) NSObject *testObject;
@property (readwrite, nonatomic, copy) NSString *testObjectAssociatedObject;
@property (readwrite, nonatomic, copy) NSString *testObjectAssociatedObjectKey;

@end

@implementation LTKNSObjectCategoryTests

@synthesize testObject;
@synthesize testObjectAssociatedObject;
@synthesize testObjectAssociatedObjectKey;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	self.testObject = [NSObject new];
	self.testObjectAssociatedObject = @"Test Object Associated Object";
	self.testObjectAssociatedObjectKey = @"LTKNSObjectCategoryTestsObjectAssociatedObjectKey";

	[self.testObject setAssociatedObject:self.testObjectAssociatedObject forKey:self.testObjectAssociatedObjectKey];
}

- (void)tearDown
{
	[super tearDown];

	[self.testObject removeAssociatedObjects];
}

#pragma mark - Unit Tests

- (void)testPerformBlockAfterDelayBlockMethod
{
	__block volatile BOOL blockFinished = NO;

	NSTimeInterval startTime = [[NSProcessInfo processInfo] systemUptime];
	__block NSTimeInterval stopTime = startTime;

	[NSObject performBlockAfterDelay:0.5 block:^
		{
			blockFinished = YES;
			stopTime = [[NSProcessInfo processInfo] systemUptime];
		}
	];

	STAssertTrue(LTKPerformBlockOnCurrentRunLoopWhileWaiting(3.0, ^BOOL { return (blockFinished && ((stopTime - startTime) >= 0.5)); }), @"Either the block "
		"took too long to execute or the difference between the time when the block started and the when it finished was not at least 0.5 seconds.");
}

- (void)testPerformBlockAfterDelayInQueueBlockMethod
{
	__block volatile BOOL blockFinished = NO;

	dispatch_queue_t testDispatchQueue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);

	NSTimeInterval startTime = [[NSProcessInfo processInfo] systemUptime];
	__block NSTimeInterval stopTime = startTime;

	[NSObject performBlockAfterDelay:0.5 inQueue:testDispatchQueue block:^
		{
			blockFinished = YES;
			stopTime = [[NSProcessInfo processInfo] systemUptime];

			STAssertEquals(dispatch_get_current_queue(), testDispatchQueue, @"The executing queue was not the same as the one the block was added to.");
		}
	];

	STAssertTrue(LTKPerformBlockOnCurrentRunLoopWhileWaiting(3.0, ^BOOL { return (blockFinished && ((stopTime - startTime) >= 0.5)); }), @"Either the block "
		"took too long to execute or the difference between the time when the block started and the when it finished was not at least 0.5 seconds.");
}

- (void)testAssociatedObjectForKeyMethod
{
	NSString *retrievedAssociatedObject = [self.testObject associatedObjectForKey:self.testObjectAssociatedObjectKey];

	STAssertNotNil(retrievedAssociatedObject,
		[NSString stringWithFormat:@"There was not an associated object for key %@.", self.testObjectAssociatedObjectKey]);
	STAssertTrue([retrievedAssociatedObject isEqualToString:self.testObjectAssociatedObject],
		@"The retrieved associated object did not equal the added associated object.");
}

- (void)testSetAssociatedObjectForKeyMethod
{
	NSString *associatedObject = @"Associated Object";
	NSString *associatedObjectKey = @"LTKNSObjectCategoryTestsAssociatedObjectKey";

	STAssertNil([self associatedObjectForKey:associatedObjectKey],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey]);

	[self.testObject setAssociatedObject:associatedObject forKey:associatedObjectKey];

	NSString *retrievedAssociatedObject = [self.testObject associatedObjectForKey:associatedObjectKey];

	STAssertNotNil(retrievedAssociatedObject, [NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey]);
	STAssertTrue([retrievedAssociatedObject isEqualToString:associatedObject], @"The retrieved associated object did not equal the added associated object.");
}

- (void)testSetAssociatedObjectForKeyAssociationPolicyMethod
{
	// NOTE: This method does relies slightly on implementation-level logic for memory management. However, as this unit test is specifically intended to test
	// the association policies of associated objects, it is a necessary step.

	// First subtest

	LTKNSObjectCategoryTestsObject *associatedObject = [LTKNSObjectCategoryTestsObject new];
	LTKNSObjectCategoryTestsObject *__weak weakAssociatedObject = associatedObject;
	NSString *associatedObjectKey = @"LTKNSObjectCategoryTestsAssociatedObjectKey";

	[self.testObject setAssociatedObject:associatedObject forKey:associatedObjectKey associationPolicy:LTKObjectAssociationPolicyAssign];

	// We create an autorelease pool to force pending memory management to occur immediately.

	@autoreleasepool
	{
		STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey],
			[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey]);
	}

	// If the associated object association policy is set to assign, then setting associatedObject to nil should deallocate the object in memory. Attempting to
	// actually query the associated object will result in a EXEC_BAD_ACCESS error, so we rely on the weak reference created above also being nil.

	associatedObject = nil;

	STAssertNil(weakAssociatedObject, @"The weak associated object pointer was not nil.");

	[self.testObject removeAssociatedObjectForKey:associatedObjectKey];

	// Second subtest

	associatedObject = [LTKNSObjectCategoryTestsObject new];

	@autoreleasepool
	{
		weakAssociatedObject = associatedObject;
	}

	[self.testObject setAssociatedObject:associatedObject forKey:associatedObjectKey associationPolicy:LTKObjectAssociationPolicyRetain];

	// We create an autorelease pool to force pending memory management to occur immediately.

	@autoreleasepool
	{
		STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey],
			[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey]);
	}

	// Setting associatedObject to nil should not also nil weakAssociatedObject since it is still being retained by the object association.

	associatedObject = nil;

	STAssertNotNil(weakAssociatedObject, @"The weak associated object pointer was nil.");

	// Once the associated object is removed, however, weakAssociatedObject should become nil.

	[self.testObject removeAssociatedObjectForKey:associatedObjectKey];

	STAssertNil(weakAssociatedObject, @"The weak associated object pointer was not nil.");

	// Third subtest

	associatedObject = [LTKNSObjectCategoryTestsObject new];

	@autoreleasepool
	{
		weakAssociatedObject = associatedObject;
	}

	[self.testObject setAssociatedObject:associatedObject forKey:associatedObjectKey associationPolicy:LTKObjectAssociationPolicyCopy];

	// We create an autorelease pool to force pending memory management to occur immediately.

	@autoreleasepool
	{
		STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey],
			[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey]);
		STAssertTrue([self.testObject associatedObjectForKey:associatedObjectKey] != associatedObject,
			@"The associated object has the same memory address as the original object.");
	}

	// Setting associatedObject to nil should deallocate the object from memory. However, the associated object should still remain as a copy of the original
	// object.

	associatedObject = nil;

	STAssertNil(weakAssociatedObject, @"The weak associated object pointer was not nil.");
	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey], @"The associated object is nil.");
}

- (void)testSetAssociatedObjectForKeyAssociationPolicyAtomicMethod
{
	// Not sure how to test atomicity...
}

- (void)testRemoveAssociatedObjectForKeyMethod
{
	NSObject *associatedObject1 = [NSObject new];
	NSObject *associatedObject2 = [NSObject new];
	NSString *associatedObjectKey1 = @"LTKNSObjectCategoryTestsAssociatedObjectKey1";
	NSString *associatedObjectKey2 = @"LTKNSObjectCategoryTestsAssociatedObjectKey2";

	[self.testObject setAssociatedObject:associatedObject1 forKey:associatedObjectKey1];
	[self.testObject setAssociatedObject:associatedObject2 forKey:associatedObjectKey2];

	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey1],
		[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey1]);
	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey2],
		[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey2]);

	[self.testObject removeAssociatedObjectForKey:associatedObjectKey1];

	STAssertNil([self.testObject associatedObjectForKey:associatedObjectKey1],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey1]);
	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey2],
		[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey2]);

	[self.testObject removeAssociatedObjectForKey:associatedObjectKey2];

	STAssertNil([self.testObject associatedObjectForKey:associatedObjectKey1],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey1]);
	STAssertNil([self.testObject associatedObjectForKey:associatedObjectKey2],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey2]);
}

- (void)testRemoveAssociatedObjectsMethod
{
	NSObject *associatedObject1 = [NSObject new];
	NSObject *associatedObject2 = [NSObject new];
	NSString *associatedObjectKey1 = @"LTKNSObjectCategoryTestsAssociatedObjectKey1";
	NSString *associatedObjectKey2 = @"LTKNSObjectCategoryTestsAssociatedObjectKey2";

	[self.testObject setAssociatedObject:associatedObject1 forKey:associatedObjectKey1];
	[self.testObject setAssociatedObject:associatedObject2 forKey:associatedObjectKey2];

	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey1],
		[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey1]);
	STAssertNotNil([self.testObject associatedObjectForKey:associatedObjectKey2],
		[NSString stringWithFormat:@"There was not an associated object for key %@.", associatedObjectKey2]);

	[self.testObject removeAssociatedObjects];

	STAssertNil([self.testObject associatedObjectForKey:associatedObjectKey1],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey1]);
	STAssertNil([self.testObject associatedObjectForKey:associatedObjectKey2],
		[NSString stringWithFormat:@"There was an associated object for key %@.", associatedObjectKey2]);
}

@end