//
//  NSTimer+Extention.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/5/2.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "NSTimer+Extention.h"

@implementation NSTimer (Extention)
+(instancetype)timerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeat:(BOOL)repeat{
//    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(timeAction:) userInfo:block repeats:repeat];
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(timerAction:) userInfo:block repeats:repeat];
}

-(void)timerAction:(NSTimer *)timer{
    void (^block)(void) = [timer userInfo];
    if(block){
        block();
    }
}
@end
