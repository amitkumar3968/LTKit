//
//	NSTimer+LTKAdditions.m
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

#import "NSTimer+LTKAdditions.h"

@interface NSTimer (LTKAdditionsInternal)

+ (void)timerDidFire:(NSTimer *)timer;

@end

@implementation NSTimer (LTKAdditionsInternal)

#pragma mark - NSTimer (LTKAdditionsInternal) Methods

+ (void)timerDidFire:(NSTimer *)timer
{
	void (^block)() = [timer userInfo];

	block();
}

@end

@implementation NSTimer (LTKAdditions)

#pragma mark - NSTimer (LTKAdditions) Methods

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(void))block
{
	return [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timerDidFire:) userInfo:[block copy] repeats:repeats];
}

+ (id)timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(void))block
{
	return [self timerWithTimeInterval:timeInterval target:self selector:@selector(timerDidFire:) userInfo:[block copy] repeats:repeats];
}

+ (id)timerWithFireDate:(NSDate *)fireDate timeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(void))block
{
	return [[self alloc] initWithFireDate:fireDate timeInterval:timeInterval repeats:repeats block:block];
}

- (id)initWithFireDate:(NSDate *)fireDate timeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(void))block
{
	return [self initWithFireDate:fireDate interval:timeInterval target:[self class] selector:@selector(timerDidFire:) userInfo:[block copy] repeats:repeats];
}

@end