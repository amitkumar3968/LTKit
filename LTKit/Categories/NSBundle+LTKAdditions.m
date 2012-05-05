//
//	NSBundle+LTKAdditions.m
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
#import <objc/runtime.h>

#import "NSBundle+LTKAdditions.h"

#pragma mark Internal Definitions

static NSString *const SCBundleClassStringsAssociatedObjectKey = @"SCBundleClassStringsAssociatedObjectKey";

#pragma mark - Category Implementation

@implementation NSBundle (LTKAdditions)

#pragma mark - NSBundle (LTKAdditions) Methods

- (NSArray *)classStrings
{
	NSArray *classStrings = [self associatedObjectForKey:SCBundleClassStringsAssociatedObjectKey];

	// If the class strings have not yet been create, we do so now.

	if (classStrings == nil)
	{
		NSMutableArray *mutableClassStrings = [NSMutableArray array];

		unsigned int numberOfClasses = 0;

		Class *classes = objc_copyClassList(&numberOfClasses);

		if (numberOfClasses > 0)
		{
			// We iterate through each Class value returned by objc_copyClassList and check that the bundle for that class is equal to self, the current bundle.

			for (NSUInteger index = 0; index < numberOfClasses; index++)
			{
				Class class = classes[index];

				if ([NSBundle bundleForClass:class] == self)
				{
					[mutableClassStrings addObject:NSStringFromClass(class)];
				}
			}

			// The class strings are saved per bundle for subsequent lookup speed.

			[self setAssociatedObject:mutableClassStrings forKey:SCBundleClassStringsAssociatedObjectKey associationPolicy:LTKObjectAssociationPolicyCopy];

			classStrings = [mutableClassStrings copy];
		}

		free(classes);
	}

	return classStrings;
}

- (NSArray *)classStringsMatchingRegularExpression:(NSRegularExpression *)regularExpression
{
	NSArray *classStrings = [self classStrings];
	NSMutableArray *mutableClassStringsMatchingPattern = [NSMutableArray array];

	for (NSString *classString in classStrings)
	{
		NSRange rangeOfFirstMatch = [regularExpression rangeOfFirstMatchInString:classString options:0 range:NSMakeRange(0, [classString length])];

		if (rangeOfFirstMatch.location != NSNotFound)
		{
			[mutableClassStringsMatchingPattern addObject:classString];
		}
	}

	return [mutableClassStringsMatchingPattern copy];
}

- (NSArray *)classStringsConformingToProtocol:(Protocol *)protocol
{
	NSArray *classStrings = [self classStrings];
	NSMutableArray *mutableClassStringsConformingToProtocol = [NSMutableArray array];

	for (NSString *classString in classStrings)
	{
		Class class = NSClassFromString(classString);

		if ([class conformsToProtocol:protocol])
		{
			[mutableClassStringsConformingToProtocol addObject:classString];
		}
	}

	return [mutableClassStringsConformingToProtocol copy];
}

- (NSArray *)classStringsExtendingClass:(Class)superclass
{
	return [self classStringsExtendingClass:superclass excludeSuperclass:NO];
}

- (NSArray *)classStringsExtendingClass:(Class)superclass excludeSuperclass:(BOOL)excludeSuperclass
{
	NSArray *classStrings = [self classStrings];
	NSMutableArray *mutableClassStringsExtendingClass = [NSMutableArray array];

	for (NSString *classString in classStrings)
	{
		Class class = NSClassFromString(classString);

		if ([class isSubclassOfClass:superclass])
		{
			if (class == superclass && !excludeSuperclass)
			{
				[mutableClassStringsExtendingClass addObject:classString];
			}
		}
	}

	return [mutableClassStringsExtendingClass copy];
}

@end