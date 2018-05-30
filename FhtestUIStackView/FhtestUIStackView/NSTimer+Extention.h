//
//  NSTimer+Extention.h
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/5/2.
//  Copyright © 2018年 znv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extention)
+(instancetype)timerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeat:(BOOL)repeat;
@end
