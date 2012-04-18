//
//	LTKAVCaptureSessionCategoryTests.m
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

#import <AVFoundation/AVFoundation.h>
#import <LTKit/LTKit.h>

#import "LTKAVCaptureSessionCategoryTests.h"



@implementation LTKAVCaptureSessionCategoryTests

#pragma mark - Unit Tests

- (void)testAddInputIfPossibleMethod
{
	// First subtest

	AVCaptureSession *captureSession = [AVCaptureSession new];

	AVCaptureDevice *videoCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	AVCaptureDeviceInput *videoCaptureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:videoCaptureDevice error:nil];

	BOOL validVideoCaptureDeviceInput = [captureSession addInputIfPossible:videoCaptureDeviceInput];

	STAssertTrue(validVideoCaptureDeviceInput, @"The default video capture device input could not be added to the capture session.");

	// Second subtest

	captureSession = [AVCaptureSession new];

	AVCaptureDevice *audioCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
	AVCaptureDeviceInput *audioCaptureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:audioCaptureDevice error:nil];

	BOOL validAudioCaptureDeviceInput = [captureSession addInputIfPossible:audioCaptureDeviceInput];

	// Third subtest

	captureSession = [AVCaptureSession new];

	STAssertFalse(validAudioCaptureDeviceInput, @"The default audio capture device input was added to the capture session.");

	BOOL validNilCaptureDeviceInput = [captureSession addInputIfPossible:nil];

	STAssertFalse(validNilCaptureDeviceInput, @"A nil capture device input was added to the capture session.");
}

- (void)testAddOutputIfPossibleMethod
{
	// First subtest

	AVCaptureSession *captureSession = [AVCaptureSession new];

	AVCaptureVideoDataOutput *captureVideoDataOutput = [AVCaptureVideoDataOutput new];
	captureVideoDataOutput.videoSettings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA]
		forKey:(id)kCVPixelBufferPixelFormatTypeKey];

	BOOL validCaptureVideoDataOutput = [captureSession addOutputIfPossible:captureVideoDataOutput];

	STAssertTrue(validCaptureVideoDataOutput, @"A video data output could not be added to the capture session.");

	// Second subtest

	captureSession = [AVCaptureSession new];

	AVCaptureStillImageOutput *captureStillImageOutput = [AVCaptureStillImageOutput new];

	BOOL validCaptureStillImageOutput = [captureSession addOutputIfPossible:captureStillImageOutput];

	STAssertTrue(validCaptureStillImageOutput, @"A still image output could not be added to the capture session.");

	// Third subtest

	captureSession = [AVCaptureSession new];

	BOOL validNilCaptureVideoDataOutput = [captureSession addOutputIfPossible:nil];

	STAssertFalse(validNilCaptureVideoDataOutput, @"A nil video data output was added to the capture session.");
}

- (void)testSetSessionPresetIfPossibleMethod
{
	AVCaptureSession *captureSession = [AVCaptureSession new];

	BOOL validCaptureSessionPresetPhoto = [captureSession setSessionPresetIfPossible:AVCaptureSessionPresetPhoto];

	STAssertTrue(validCaptureSessionPresetPhoto, @"The capture session's preset could not be set to AVCaptureSessionPresetPhoto.");

	BOOL validCaptureSessionPresetHigh = [captureSession setSessionPresetIfPossible:AVCaptureSessionPresetHigh];

	STAssertTrue(validCaptureSessionPresetHigh, @"The capture session's preset could not be set to AVCaptureSessionPresetHigh.");

	BOOL validCaptureSessionPresetNil = [captureSession setSessionPresetIfPossible:nil];

	STAssertFalse(validCaptureSessionPresetNil, @"The capture session's preset was set to nil.");
}

- (void)testIsNotRunningMethod
{
	AVCaptureSession *captureSession = [AVCaptureSession new];

	STAssertTrue([captureSession isNotRunning], @"The capture session is running.");

	[captureSession startRunning];

	STAssertFalse([captureSession isNotRunning], @"The capture session is not running.");

	[captureSession stopRunning];

	STAssertTrue([captureSession isNotRunning], @"The capture session is running.");
}

@end