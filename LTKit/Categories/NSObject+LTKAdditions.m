//
//	NSObject+LTKAdditions.m
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

#import <objc/runtime.h>
#import <LTKit/LTKit.h>

#import "NSObject+LTKAdditions.h"

#pragma mark Internal Definitions

static NSString *const LTKAssociationKeyPointersAssociatedObjectKey = @"LTKAssociationKeyPointersAssociatedObjectKey";

#pragma mark - NSObject Internal Category

@interface NSObject (LTKAdditionsInternal)

- (NSMutableArray *)associationKeyPointers;
- (objc_AssociationPolicy)runtimeAssociationPolicyForLTKObjectAssociationPolicy:(LTKObjectAssociationPolicy)associationPolicy atomic:(BOOL)atomic;

@end

#pragma mark -

@implementation NSObject (LTKAdditionsInternal)

#pragma mark - NSObject (LTKAdditionsInternal) Methods

- (NSMutableArray *)associationKeyPointers
{
	NSMutableArray *associationKeyPointers = objc_getAssociatedObject(self, (__bridge void *)LTKAssociationKeyPointersAssociatedObjectKey);

	if (associationKeyPointers == nil)
	{
		@synchronized(self)
		{
			associationKeyPointers = [NSMutableArray array];

			objc_setAssociatedObject(self, (__bridge void *)LTKAssociationKeyPointersAssociatedObjectKey, associationKeyPointers, OBJC_ASSOCIATION_RETAIN);
		}
	}

	return associationKeyPointers;
}

- (objc_AssociationPolicy)runtimeAssociationPolicyForLTKObjectAssociationPolicy:(LTKObjectAssociationPolicy)associationPolicy atomic:(BOOL)atomic
{
	objc_AssociationPolicy runtimeAssociationPolicy = OBJC_ASSOCIATION_RETAIN;

	if (atomic)
	{
		if (associationPolicy == LTKObjectAssociationPolicyRetain)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_RETAIN;
		}
		else if (associationPolicy == LTKObjectAssociationPolicyAssign)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_ASSIGN;
		}
		else if (associationPolicy == LTKObjectAssociationPolicyCopy)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_COPY;
		}
	}
	else
	{
		if (associationPolicy == LTKObjectAssociationPolicyRetain)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_RETAIN_NONATOMIC;
		}
		else if (associationPolicy == LTKObjectAssociationPolicyAssign)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_ASSIGN;
		}
		else if (associationPolicy == LTKObjectAssociationPolicyCopy)
		{
			runtimeAssociationPolicy = OBJC_ASSOCIATION_COPY_NONATOMIC;
		}
	}

	return runtimeAssociationPolicy;
}

@end

#pragma mark -

@implementation NSObject (LTKAdditions)

#pragma mark - NSObject (LTKAdditions) Methods

+ (void)performBlockAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block
{
	[self performBlockAfterDelay:delay inQueue:dispatch_get_main_queue() block:block];
}

+ (void)performBlockAfterDelay:(NSTimeInterval)delay inQueue:(dispatch_queue_t)queue block:(void (^)(void))block
{
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));

	dispatch_after(popTime, queue, block);
}

- (id)associatedObjectForKey:(NSString *)key
{
	@synchronized(key)
	{
		NSMutableArray *associationKeyPointers = [self associationKeyPointers];

		NSUInteger keyPointerIndex = [associationKeyPointers indexOfObject:key];
		id associatedObject = nil;

		if (keyPointerIndex != NSNotFound)
		{
			id keyPointer = [associationKeyPointers objectAtIndex:keyPointerIndex];

			associatedObject = objc_getAssociatedObject(self, (__bridge void *)keyPointer);
		}

		return associatedObject;
	}
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key
{
	@synchronized(key)
	{
		[self setAssociatedObject:object forKey:key associationPolicy:LTKObjectAssociationPolicyRetain atomic:YES];
	}
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key associationPolicy:(LTKObjectAssociationPolicy)associationPolicy
{
	@synchronized(key)
	{
		[self setAssociatedObject:object forKey:key associationPolicy:associationPolicy atomic:YES];
	}
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key associationPolicy:(LTKObjectAssociationPolicy)associationPolicy atomic:(BOOL)atomic
{
	@synchronized(key)
	{
		NSMutableArray *associationKeyPointers = [self associationKeyPointers];

		NSUInteger keyPointerIndex = [associationKeyPointers indexOfObject:key];
		id keyPointer = nil;

		if (keyPointerIndex == NSNotFound)
		{
			keyPointer = key;
			[associationKeyPointers addObject:keyPointer];
		}
		else
		{
			keyPointer = [associationKeyPointers objectAtIndex:keyPointerIndex];
		}

		objc_AssociationPolicy runtimeAssociationPolicy = [self runtimeAssociationPolicyForLTKObjectAssociationPolicy:associationPolicy atomic:atomic];
		objc_setAssociatedObject(self, (__bridge void *)keyPointer, object, runtimeAssociationPolicy);
	}
}

- (void)removeAssociatedObjectForKey:(NSString *)key
{
	@synchronized(key)
	{
		NSMutableArray *associationKeyPointers = [self associationKeyPointers];

		NSUInteger keyPointerIndex = [associationKeyPointers indexOfObject:key];

		if (keyPointerIndex != NSNotFound)
		{
			id keyPointer = [associationKeyPointers objectAtIndex:keyPointerIndex];

			objc_setAssociatedObject(self, (__bridge void *)keyPointer, nil, OBJC_ASSOCIATION_ASSIGN);

			[associationKeyPointers removeObject:keyPointer];
		}
	}
}

- (void)removeAssociatedObjects
{
	@synchronized(self)
	{
		objc_removeAssociatedObjects(self);

		[[self associationKeyPointers] removeAllObjects];
	}
}

@end