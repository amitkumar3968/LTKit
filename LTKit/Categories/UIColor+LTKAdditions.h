//
//	UIColor+LTKAdditions.h
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

#import <UIKit/UIKit.h>

@interface UIColor (LTKAdditions)

+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness;
+ (UIColor *)colorWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness;
+ (UIColor *)colorWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue;
+ (UIColor *)colorWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue alpha:(CGFloat)alpha;
- (UIColor *)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness;
- (UIColor *)initWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness;
- (UIColor *)initWithDecimalHue:(CGFloat)decimalHue saturation:(CGFloat)decimalSaturation brightness:(CGFloat)decimalBrightness alpha:(CGFloat)alpha;
- (UIColor *)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (UIColor *)initWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue;
- (UIColor *)initWithDecimalRed:(CGFloat)decimalRed green:(CGFloat)decimalGreen blue:(CGFloat)decimalBlue alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness;
- (BOOL)getDecimalHue:(CGFloat *)decimalHue saturation:(CGFloat *)decimalSaturation brightness:(CGFloat *)decimalBrightness;
- (BOOL)getDecimalHue:(CGFloat *)decimalHue saturation:(CGFloat *)decimalSaturation brightness:(CGFloat *)decimalBrightness alpha:(CGFloat *)alpha;
- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue;
- (BOOL)getDecimalRed:(CGFloat *)decimalRed green:(CGFloat *)decimalGreen blue:(CGFloat *)decimalBlue;
- (BOOL)getDecimalRed:(CGFloat *)decimalRed green:(CGFloat *)decimalGreen blue:(CGFloat *)decimalBlue alpha:(CGFloat *)alpha;

@end