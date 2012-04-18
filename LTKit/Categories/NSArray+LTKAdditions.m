//
//	NSArray+LTKAdditions.m
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

#import <LTKit/LTKit.h>

#import "NSArray+LTKAdditions.h"
#import "NSMutableArray+LTKAdditions.h"

@implementation NSArray (LTKAdditions)

#pragma mark - NSArray (LTKAdditions)

- (BOOL)isNotEmpty
{
	return ([self count] > 0);
}

- (BOOL)isEmpty
{
	return ![self isNotEmpty];
}

- (id)firstObject
{
	return ([self isNotEmpty] ? [self objectAtIndex:0] : nil);
}

- (id)objectAtBoundedIndex:(NSUInteger)boundedIndex
{
	return [self objectAtIndex:LTK_CLAMP(boundedIndex, 0u, ([self count] - 1))];
}

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate andSortedUsingDescriptor:(NSSortDescriptor *)sortDescriptor
{
	return [self filteredArrayUsingPredicate:predicate andSortedUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate andSortedUsingDescriptors:(NSArray *)sortDescriptors
{
	return [[self filteredArrayUsingPredicate:predicate] sortedArrayUsingDescriptors:sortDescriptors];
}

- (NSArray *)sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor
{
	return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (NSArray *)sortedArray
{
	return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)reversedArray
{
	NSMutableArray *mutableCopy = [self mutableCopy];
	[mutableCopy reverse];

	return [mutableCopy copy];
}

@end