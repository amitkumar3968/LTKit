//
//	UIView+LTKAdditions.h
//	LTKit
//
//	Copyright (c) 2011 Michael Potter
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

@interface UIView (LTKAdditions)

@property (readwrite, nonatomic, assign) CGPoint frameOrigin;
@property (readwrite, nonatomic, assign) CGSize frameSize;
@property (readwrite, nonatomic, assign) CGFloat frameX;
@property (readwrite, nonatomic, assign) CGFloat frameY;
@property (readwrite, nonatomic, assign) CGFloat frameWidth;
@property (readwrite, nonatomic, assign) CGFloat frameHeight;
@property (readwrite, nonatomic, assign) CGFloat frameMinX;
@property (readwrite, nonatomic, assign) CGFloat frameMidX;
@property (readwrite, nonatomic, assign) CGFloat frameMaxX;
@property (readwrite, nonatomic, assign) CGFloat frameMinY;
@property (readwrite, nonatomic, assign) CGFloat frameMidY;
@property (readwrite, nonatomic, assign) CGFloat frameMaxY;
@property (readwrite, nonatomic, assign) CGPoint frameTopLeftPoint;
@property (readwrite, nonatomic, assign) CGPoint frameTopMiddlePoint;
@property (readwrite, nonatomic, assign) CGPoint frameTopRightPoint;
@property (readwrite, nonatomic, assign) CGPoint frameMiddleRightPoint;
@property (readwrite, nonatomic, assign) CGPoint frameBottomRightPoint;
@property (readwrite, nonatomic, assign) CGPoint frameBottomMiddlePoint;
@property (readwrite, nonatomic, assign) CGPoint frameBottomLeftPoint;
@property (readwrite, nonatomic, assign) CGPoint frameMiddleLeftPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsOrigin;
@property (readwrite, nonatomic, assign) CGSize boundsSize;
@property (readwrite, nonatomic, assign) CGFloat boundsX;
@property (readwrite, nonatomic, assign) CGFloat boundsY;
@property (readwrite, nonatomic, assign) CGFloat boundsWidth;
@property (readwrite, nonatomic, assign) CGFloat boundsHeight;
@property (readwrite, nonatomic, assign) CGFloat boundsMinX;
@property (readwrite, nonatomic, assign) CGFloat boundsMidX;
@property (readwrite, nonatomic, assign) CGFloat boundsMaxX;
@property (readwrite, nonatomic, assign) CGFloat boundsMinY;
@property (readwrite, nonatomic, assign) CGFloat boundsMidY;
@property (readwrite, nonatomic, assign) CGFloat boundsMaxY;
@property (readwrite, nonatomic, assign) CGPoint boundsTopLeftPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsTopMiddlePoint;
@property (readwrite, nonatomic, assign) CGPoint boundsTopRightPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsMiddleRightPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsBottomRightPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsBottomMiddlePoint;
@property (readwrite, nonatomic, assign) CGPoint boundsBottomLeftPoint;
@property (readwrite, nonatomic, assign) CGPoint boundsMiddleLeftPoint;

@end