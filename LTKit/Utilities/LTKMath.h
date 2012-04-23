//
//	LTKMath.h
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

#define LTK_CLAMP(VALUE, MIN, MAX)			({																							\
												__typeof__(VALUE) LTK__value = (VALUE);													\
												__typeof__(MIN) LTK__min = (MIN);														\
												__typeof__(MAX) LTK__max = (MAX);														\
												NSCAssert((LTK__min < LTK__max), @"LTK_CLAMP: MIN must be less than MAX.");				\
												(LTK__min > LTK__value ? LTK__min : (LTK__value < LTK__max ? LTK__value : LTK__max));	\
											})

#define LTK_VALUE_IS_POSITIVE(VALUE)		((VALUE) > 0)

#define LTK_VALUE_IS_NEGATIVE(VALUE)		((VALUE) < 0)

#define LTK_VALUE_IS_NONNEGATIVE(VALUE)		((VALUE) >= 0)

#define LTK_VALUE_IS_NONPOSITIVE(VALUE)		((VALUE) <= 0)

#define LTK_VALUE_IS_EVEN(VALUE) 			((VALUE) % 2 == 0)

#define LTK_VALUE_IS_ODD(VALUE) 			((VALUE) % 2 == 1)

LTK_STATIC_INLINE CGFloat LTKMathDegreesToRadians(CGFloat degrees)
{
	return ((degrees * (CGFloat)M_PI) / 180.0f);
}

LTK_STATIC_INLINE CGFloat LTKMathRadiansToDegrees(CGFloat radians)
{
	return ((radians * 180.0f) / (CGFloat)M_PI);
}