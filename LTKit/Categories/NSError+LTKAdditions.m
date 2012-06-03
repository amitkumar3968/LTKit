//
//  NSError+LTKAdditions.m
//  LTKit
//
//  Created by Michael Shannon Potter on 6/2/12.
//  Copyright (c) 2012 LucasTizma. All rights reserved.
//

#import "NSError+LTKAdditions.h"

#pragma mark Category Implementation

@implementation NSError (LTKAdditions)

#pragma mark - NSError (LTKAdditions) Methods

- (void)logDetailedErrorString
{
	NSMutableString *detailedErrorString = nil;

	if (([self userInfo] != nil) && ([[self userInfo] count] > 0))
	{
		detailedErrorString = [NSMutableString stringWithString:@"\n---- Detailed Error ----"];

		[[self userInfo] enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop)
			{
				[detailedErrorString appendFormat:@"\n\t-- %@ --\n\n\t\t%@\n", key, object];
			}
		];

		[detailedErrorString appendString:@"\n"];
	}

	if (detailedErrorString != nil)
	{
		NSLog(@"%@", detailedErrorString);
	}
}

@end