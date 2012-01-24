//
//  UIImage+LTKAdditions.m
//  LTKit
//
//  Created by Michael Potter on 1/24/12.
//  Copyright (c) 2012 LucasTizma. All rights reserved.
//

#import "UIImage+LTKAdditions.h"

@implementation UIImage (LTKAdditions)

#pragma mark - UIImage (LTKAdditions) Methods

- (UIImage *)croppedImageWithRect:(CGRect)rect
{
	UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);

	[self drawInRect:rect];
	UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();

	UIGraphicsEndImageContext();

    return croppedImage;
}

@end