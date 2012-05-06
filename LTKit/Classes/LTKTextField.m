//
//	LTKTextField.m
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

#import "LTKTextField.h"

#pragma mark Class Extension -

@interface LTKTextField ()

- (CGRect)placeholderTextStringRectForBounds:(CGRect)bounds;

@end

@implementation LTKTextField

@synthesize placeholderFont;
@synthesize placeholderTextColor;
@synthesize placeholderShadowColor;
@synthesize placeholderShadowOffset;
@synthesize placeholderTextAlignment;
@synthesize placeholderLineBreakMode;
@synthesize placeholderBaselineAdjustment;
@synthesize textEdgeInsets;

#pragma mark - LTKTextField Methods (Private)

- (CGRect)placeholderTextStringRectForBounds:(CGRect)bounds
{
	CGRect placeholderTextStringRect = bounds;

	if (self.leftView != nil && ((self.leftViewMode == UITextFieldViewModeAlways) || (self.leftViewMode == UITextFieldViewModeWhileEditing && self.editing) ||
		(self.leftViewMode == UITextFieldViewModeUnlessEditing && !self.editing)))
	{
		placeholderTextStringRect.origin.x += self.leftView.frameWidth;
		placeholderTextStringRect.size.width -= self.leftView.frameWidth;
	}

	if (self.rightView != nil && ((self.rightViewMode == UITextFieldViewModeAlways) ||
		(self.rightViewMode == UITextFieldViewModeWhileEditing && self.editing) || (self.rightViewMode == UITextFieldViewModeUnlessEditing && !self.editing)))
	{

		placeholderTextStringRect.size.width -= self.rightView.frameWidth;
	}

	placeholderTextStringRect = UIEdgeInsetsInsetRect(placeholderTextStringRect, self.textEdgeInsets);

//	placeholderTextStringRect.size.width -= (self.textEdgeInsets.left + self.textEdgeInsets.right);
//	placeholderTextStringRect.size.height -= (self.textEdgeInsets.top + self.textEdgeInsets.bottom);
//	placeholderTextStringRect.origin.x += self.textEdgeInsets.left;
//	placeholderTextStringRect.origin.y += self.textEdgeInsets.top;

	return placeholderTextStringRect;
}

#pragma mark - UITextField Methods

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
	CGRect placeholderRectForBounds = CGRectZero;

	if ([NSString stringIsNotEmpty:self.placeholder])
	{
		UIFont *font = (self.placeholderFont != nil ? self.placeholderFont : self.font);

		placeholderRectForBounds = [self placeholderTextStringRectForBounds:bounds];
		placeholderRectForBounds.size = [self.placeholder sizeWithFont:font forWidth:placeholderRectForBounds.size.width
			lineBreakMode:self.placeholderLineBreakMode];

//		NSLog(@"Placeholder rect (%@) for bounds (%@).", NSStringFromCGRect(placeholderRectForBounds), NSStringFromCGRect(bounds));
	}
	else
	{
		placeholderRectForBounds = [super placeholderRectForBounds:bounds];
	}

	return placeholderRectForBounds;
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
//	NSLog(@"Drawing rect: %@", NSStringFromCGRect(rect));

	UIFont *font = (self.placeholderFont != nil ? self.placeholderFont : self.font);
	UIColor *textColor = (self.placeholderTextColor != nil ? self.placeholderTextColor : self.textColor);

	if ((self.placeholderShadowColor != nil) && !CGSizeEqualToSize(self.placeholderShadowOffset, CGSizeZero))
	{
		[self.placeholderShadowColor set];

		UIOffset shadowOffset = UIOffsetMake(self.placeholderShadowOffset.width, self.placeholderShadowOffset.height);

		[self.placeholder drawAtPoint:LTKPointApplyOffset(rect.origin, shadowOffset) forWidth:rect.size.width withFont:font fontSize:font.pointSize
			lineBreakMode:self.placeholderLineBreakMode baselineAdjustment:self.placeholderBaselineAdjustment];
	}

	[textColor set];



	[self.placeholder drawAtPoint:rect.origin forWidth:rect.size.width withFont:font fontSize:font.pointSize lineBreakMode:self.placeholderLineBreakMode
		baselineAdjustment:self.placeholderBaselineAdjustment];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], self.textEdgeInsets);
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
	return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], self.textEdgeInsets);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
	CGRect rect = [super leftViewRectForBounds:bounds];

//	NSLog(@"Left view rect: %@", NSStringFromCGRect(rect));

	return rect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
	CGRect rect = [super rightViewRectForBounds:bounds];

//	NSLog(@"Right view rect: %@", NSStringFromCGRect(rect));

	return rect;
}

@end