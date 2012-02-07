//
//	UIImage+LTKAdditions.h
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

#import <Accelerate/Accelerate.h>
#import <UIKit/UIKit.h>

typedef enum LTKHighSpeedConvolutionType
{
	LTKHighSpeedConvolutionTypeBox,
	LTKHighSpeedConvolutionTypeTent
}
LTKHighSpeedConvolutionType;

typedef enum LTKGuassianBlurKernelType
{
	LTKGuassianBlurKernelType3x3,
	LTKGuassianBlurKernelType7x7,
	LTKGuassianBlurKernelType9x9,
	LTKGuassianBlurKernelType13x11,
	LTKGuassianBlurKernelType17x17,
	LTKGuassianBlurKernelType19x19
}
LTKGuassianBlurKernelType;

@interface UIImage (LTKAdditions)

- (UIImage *)croppedImageWithRect:(CGRect)rect;

- (UIImage *)imageByApplyingHighSpeedConvolution:(LTKHighSpeedConvolutionType)convolutionType kernelSize:(CGSize)kernelSize;
- (UIImage *)imageByApplyingHighSpeedConvolution:(LTKHighSpeedConvolutionType)convolutionType kernelSize:(CGSize)kernelSize flags:(vImage_Flags)flags;
- (UIImage *)imageByApplyingGaussianBlurWithBias:(NSInteger)bias;														// Empty implementation for now
- (UIImage *)imageByApplyingGaussianBlurWithBias:(NSInteger)bias numberOfBlurRepetitions:(NSUInteger)blurRepetitions; 	// Empty implementation for now

@end