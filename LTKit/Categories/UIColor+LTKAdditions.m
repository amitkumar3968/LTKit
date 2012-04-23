//
//	UIColor+LTKAdditions.m
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

#import "UIColor+LTKAdditions.h"

@implementation UIColor (LTKAdditions)

#pragma mark - UIColor (LTKAdditions) Methods

+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness
{
	return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0f];
}

+ (UIColor *)colorWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness
{
	return [UIColor colorWithDecimalHue:decimalHue saturation:decimalSaturation brightness:decimalBrightness alpha:1.0f];
}

+ (UIColor *)colorWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness alpha:(CGFloat)alpha
{
	return [[UIColor alloc] initWithDecimalHue:decimalHue saturation:decimalSaturation brightness:decimalBrightness alpha:alpha];
}

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)colorWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue
{
	return [UIColor colorWithDecimalRed:decimalRed green:decimalGreen blue:decimalBlue alpha:1.0f];
}

+ (UIColor *)colorWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue alpha:(CGFloat)alpha
{
	return [[UIColor alloc] initWithDecimalRed:decimalRed green:decimalGreen blue:decimalBlue alpha:alpha];
}

- (UIColor *)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness
{
	return [self initWithHue:hue saturation:saturation brightness:brightness alpha:1.0f];
}

- (UIColor *)initWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness
{
	return [self initWithDecimalHue:decimalHue saturation:decimalSaturation brightness:decimalBrightness alpha:1.0f];
}

- (UIColor *)initWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness alpha:(CGFloat)alpha
{
	CGFloat percentageHue = (decimalHue / 359.0f);
	CGFloat percentageSaturation = (decimalSaturation / 100.0f);
	CGFloat percentageBrightness = (decimalBrightness / 100.0f);

	return [self initWithHue:percentageHue saturation:percentageSaturation brightness:percentageBrightness alpha:alpha];
}

- (UIColor *)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
	return [self initWithRed:red green:green blue:blue alpha:1.0f];
}

- (UIColor *)initWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue
{
	return [self initWithDecimalRed:decimalRed green:decimalGreen blue:decimalBlue alpha:1.0f];
}

- (UIColor *)initWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue alpha:(CGFloat)alpha
{
	CGFloat percentageRed = (decimalRed / 255.0f);
	CGFloat percentageGreen = (decimalGreen / 255.0f);
	CGFloat percentageBlue = (decimalBlue / 255.0f);

	return [self initWithRed:percentageRed green:percentageGreen blue:percentageBlue alpha:alpha];
}

+ (UIColor *)randomColor
{
	CGFloat randomPercentageRed = ((CGFloat)arc4random_uniform(UINT32_MAX));
	CGFloat randomPercentageGreen = ((CGFloat)arc4random_uniform(UINT32_MAX));
	CGFloat randomPercentageBlue = ((CGFloat)arc4random_uniform(UINT32_MAX));

	return [UIColor colorWithRed:randomPercentageRed green:randomPercentageGreen blue:randomPercentageBlue];
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness
{
	return [self getHue:hue saturation:saturation brightness:brightness alpha:NULL];
}

- (BOOL)getDecimalHue:(CGFloat *)decimalHue saturation:(CGFloat *)decimalSaturation brightness:(CGFloat *)decimalBrightness
{
	return [self getDecimalHue:decimalHue saturation:decimalSaturation brightness:decimalBrightness alpha:NULL];
}

- (BOOL)getDecimalHue:(CGFloat *)decimalHue saturation:(CGFloat *)decimalSaturation brightness:(CGFloat *)decimalBrightness alpha:(CGFloat *)alpha
{
	CGFloat percentageHue = 0.0f;
	CGFloat percentageSaturation = 0.0f;
	CGFloat percentageBrightness = 0.0f;

	BOOL didGetColorComponents = [self getHue:&percentageHue saturation:&percentageSaturation brightness:&percentageBrightness alpha:alpha];

	if (didGetColorComponents)
	{
		*decimalHue = (percentageHue * 359.0f);
		*decimalSaturation = (percentageSaturation * 100.0f);
		*decimalBrightness = (percentageBrightness * 100.0f);
	}

	return didGetColorComponents;
}

- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue
{
	return [self getRed:red green:green blue:blue alpha:NULL];
}

- (BOOL)getDecimalRed:(CGFloat *)decimalRed green:(CGFloat *)decimalGreen blue:(CGFloat *)decimalBlue
{
	return [self getDecimalRed:decimalRed green:decimalGreen blue:decimalBlue alpha:NULL];
}

- (BOOL)getDecimalRed:(CGFloat *)decimalRed green:(CGFloat *)decimalGreen blue:(CGFloat *)decimalBlue alpha:(CGFloat *)alpha
{
	CGFloat percentageRed = 0.0f;
	CGFloat percentageGreen = 0.0f;
	CGFloat percentageBlue = 0.0f;

	BOOL didGetColorComponents = [self getRed:&percentageRed green:&percentageGreen blue:&percentageBlue alpha:alpha];

	if (didGetColorComponents)
	{
		*decimalRed = (percentageRed * 255.0f);
		*decimalGreen = (percentageGreen * 255.0f);
		*decimalBlue = (percentageBlue * 255.0f);
	}

	return didGetColorComponents;
}

@end