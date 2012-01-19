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

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSUInteger const LTKViewAutoresizingFlexibleMargins;
UIKIT_EXTERN NSUInteger const LTKViewAutoresizingFlexibleSize;

CG_INLINE CGPoint LTKPointApplyOffset(CGPoint point, UIOffset offset)
{
	point.x += offset.horizontal;
	point.y += offset.vertical;

	return point;
}

CG_INLINE UIEdgeInsets LTKUniformEdgeInsetsMake(CGFloat inset)
{
	return UIEdgeInsetsMake(inset, inset, inset, inset);
}

CG_INLINE CGFloat LTKSizeGetArea(CGSize size)
{
	return (size.width * size.height);
}

CG_INLINE CGFloat LTKRectsGetMaxHeight(const CGRect rects[], size_t count) 
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

CG_INLINE CGFloat LTKRectsGetMaxWidth(const CGRect rects[], size_t count) 
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

// LTKRectsGetMinX
// LTKRectsGetMaxX
// LTKRectsGetMinY
// LTKRectsGetMaxY

// LTKRectUnionOfRects
// LTKRectIntersectionOfRects

// LTKEdgeOutsetsMake, etc.