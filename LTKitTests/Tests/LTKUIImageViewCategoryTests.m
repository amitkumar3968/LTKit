//
//	LTKUIImageViewCategoryTests.m
//	LTKitTests
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

#import "LTKUIImageViewCategoryTests.h"

#pragma mark Internal Definitions

static NSString *const LTKSampleImageName = @"LTKUIImageViewCategoryTestsSample";
static NSString *const LTKSampleHighlightedImageName = @"LTKUIImageViewCategoryTestsSampleHighlighted";
static CGSize const LTKSampleImageSize = {75.0f, 110.0f};
static CGSize const LTKSampleHighlightedImageSize = {75.0f, 110.0f};

#pragma mark - UIImage Internal Category

// Unit tests execute is a specialized bundle that is not the same as the .octest bundle. Therefore, resources added to the .octest bundle cannot be accessed
// using +[NSBundle mainBundle]. Since +[UIImage imageNamed:] implicitly relies on this, +[NSBundle mainBundle] is overridden to return the resource bundle
// associated with the LTKUIImageViewCategoryTests class, which is the .octest bundle.

@interface NSBundle (LTKUIImageViewCategoryTests)

+ (NSBundle *)mainBundle;

@end

@implementation NSBundle (LTKUIImageViewCategoryTests)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (NSBundle *)mainBundle
{
	return [NSBundle bundleForClass:[LTKUIImageViewCategoryTests class]];
}

#pragma clang diagnostic pop

@end

#pragma mark - Class Extension -

@interface LTKUIImageViewCategoryTests ()

@property (readwrite, nonatomic, strong) UIImageView *referenceImageView;

@end

@implementation LTKUIImageViewCategoryTests

@synthesize referenceImageView;

#pragma mark - SenTestCase Methods

- (void)setUp
{
	[super setUp];

	UIImage *image = [UIImage imageNamed:LTKSampleImageName];
	UIImage *highlightedImage = [UIImage imageNamed:LTKSampleHighlightedImageName];

	self.referenceImageView = [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}

#pragma mark - Unit Tests

- (void)testImageViewWithImageMethod
{
	UIImage *sampleImage = [UIImage imageNamed:LTKSampleImageName];
	UIImageView *imageView = [UIImageView imageViewWithImage:sampleImage];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNil(imageView.highlightedImage, @"Image view's highlighted image is not nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
	STAssertEqualObjects(sampleImage, imageView.image, @"Image view's image does not equal the original input image.");
}

- (void)testImageViewImageHighlightedImageMethod
{
	UIImage *sampleImage = [UIImage imageNamed:LTKSampleImageName];
	UIImage *sampleHighlightedImage = [UIImage imageNamed:LTKSampleHighlightedImageName];
	UIImageView *imageView = [UIImageView imageViewWithImage:sampleImage highlightedImage:sampleHighlightedImage];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNotNil(imageView.highlightedImage, @"Image view's highlighted image is nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.highlightedImage.size, LTKSampleHighlightedImageSize),
		@"Image view's highlighted image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
	STAssertEqualObjects(sampleImage, imageView.image, @"Image view's image does not equal the original input image.");
	STAssertEqualObjects(self.referenceImageView.highlightedImage, imageView.highlightedImage,
		@"Image view's highlighted image does not equal the reference image view's highlighted image.");
	STAssertEqualObjects(sampleHighlightedImage, imageView.highlightedImage, @"Image view's highlighted image does not equal the original input image.");
}

- (void)testImageViewWithImageNamedMethod
{
	UIImageView *imageView = [UIImageView imageViewWithImageNamed:LTKSampleImageName];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNil(imageView.highlightedImage, @"Image view's highlighted image is not nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
}

- (void)testImageViewWithImageNamedHighlightedImageNamedMethod
{
	UIImageView *imageView = [UIImageView imageViewWithImageNamed:LTKSampleImageName highlightedImageNamed:LTKSampleHighlightedImageName];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNotNil(imageView.highlightedImage, @"Image view's highlighted image is nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.highlightedImage.size, LTKSampleHighlightedImageSize),
		@"Image view's highlighted image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
	STAssertEqualObjects(self.referenceImageView.highlightedImage, imageView.highlightedImage,
		@"Image view's highlighted image does not equal the reference image view's highlighted image.");
}

- (void)testInitWithImageNamedMethod
{
	UIImageView *imageView = [[UIImageView alloc] initWithImageNamed:LTKSampleImageName];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNil(imageView.highlightedImage, @"Image view's highlighted image is not nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
}

- (void)testInitWithImageNamedHighlightedImageNamedMethod
{
	UIImageView *imageView = [[UIImageView alloc] initWithImageNamed:LTKSampleImageName highlightedImageNamed:LTKSampleHighlightedImageName];

	STAssertNotNil(imageView, @"Image view is nil.");
	STAssertNotNil(imageView.image, @"Image view's image is nil.");
	STAssertNotNil(imageView.highlightedImage, @"Image view's highlighted image is nil.");
	STAssertTrue(CGSizeEqualToSize(imageView.frame.size, LTKSampleImageSize), @"Image view's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.image.size, LTKSampleImageSize), @"Image view's image's size is not equal to {75.0f, 110.0f}.");
	STAssertTrue(CGSizeEqualToSize(imageView.highlightedImage.size, LTKSampleHighlightedImageSize),
		@"Image view's highlighted image's size is not equal to {75.0f, 110.0f}.");
	STAssertEqualObjects(self.referenceImageView.image, imageView.image, @"Image view's image does not equal the reference image view's image.");
	STAssertEqualObjects(self.referenceImageView.highlightedImage, imageView.highlightedImage,
		@"Image view's highlighted image does not equal the reference image view's highlighted image.");
}

@end