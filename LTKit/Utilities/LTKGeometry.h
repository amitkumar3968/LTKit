//
//	LTKGeometry.h
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

LTK_EXTERN NSUInteger const LTKViewAutoresizingFlexibleMargins;
LTK_EXTERN NSUInteger const LTKViewAutoresizingFlexibleSize;

LTK_STATIC_INLINE CGPoint LTKPointApplyOffset(CGPoint point, UIOffset offset)
{
	point.x += offset.horizontal;
	point.y += offset.vertical;

	return point;
}

LTK_STATIC_INLINE UIEdgeInsets LTKUniformEdgeInsetsMake(CGFloat inset)
{
	return UIEdgeInsetsMake(inset, inset, inset, inset);
}

LTK_STATIC_INLINE UIEdgeInsets LTKEdgeOutsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
	return UIEdgeInsetsMake(-top, -left, -bottom, -right);
}

LTK_STATIC_INLINE UIEdgeInsets LTKUniformEdgeOutsetsMake(CGFloat outset)
{
	return UIEdgeInsetsMake(-outset, -outset, -outset, -outset);
}

LTK_STATIC_INLINE CGFloat LTKSizeGetArea(CGSize size)
{
	return (size.width * size.height);
}

LTK_STATIC_INLINE CGRect LTKRectScale(CGRect rect, CGFloat sx, CGFloat sy)
{
	return CGRectMake(rect.origin.x, rect.origin.y, (rect.size.width + sx), (rect.size.height + sy));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMaxHeight(const CGRect rects[], size_t count)
{
	CGFloat maxHeight = 0.0f;

	for (NSUInteger i = 0; i < count; i++)
	{
		if (rects[i].size.height > maxHeight)
		{
			maxHeight = rects[i].size.height;
		}
	}

	return maxHeight;
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMaxWidth(const CGRect rects[], size_t count)
{
	CGFloat maxWidth = 0.0f;

	for (NSUInteger i = 0; i < count; i++)
	{
		if (rects[i].size.width > maxWidth)
		{
			maxWidth = rects[i].size.width;
		}
	}

	return maxWidth;
}

LTK_STATIC_INLINE CGRect LTKRectsUnion(const CGRect rects[], size_t count)
{
	CGRect rectsUnion = CGRectNull;

	for (NSUInteger i = 0; i < count; i++)
	{
		rectsUnion = CGRectUnion(rectsUnion, rects[i]);
	}

	return rectsUnion;
}

LTK_STATIC_INLINE CGRect LTKRectsIntersection(const CGRect rects[], size_t count)
{
	CGRect rectsIntersection = CGRectNull;

	for (NSUInteger i = 0; i < count; i++)
	{
		rectsIntersection = CGRectIntersection(rectsIntersection, rects[i]);
	}

	return rectsIntersection;
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMinX(const CGRect rects[], size_t count)
{
	return CGRectGetMinX(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMidX(const CGRect rects[], size_t count)
{
	return CGRectGetMidX(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMaxX(const CGRect rects[], size_t count)
{
	return CGRectGetMaxX(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMinY(const CGRect rects[], size_t count)
{
	return CGRectGetMinY(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMidY(const CGRect rects[], size_t count)
{
	return CGRectGetMidY(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetMaxY(const CGRect rects[], size_t count)
{
	return CGRectGetMaxY(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetWidth(const CGRect rects[], size_t count)
{
	return CGRectGetWidth(LTKRectsUnion(rects, count));
}

LTK_STATIC_INLINE CGFloat LTKRectsGetHeight(const CGRect rects[], size_t count)
{
	return CGRectGetHeight(LTKRectsUnion(rects, count));
}