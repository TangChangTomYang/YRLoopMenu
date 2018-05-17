//
//  YRLoopMenuMode.m
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRLoopMenuMode.h"

@implementation YRLoopMenuMode
+(instancetype)modeWithName:(NSString *)name{
    
   YRLoopMenuMode *mode = [[self alloc] init];
    mode.iconName = name;
    return mode;
}
@end
