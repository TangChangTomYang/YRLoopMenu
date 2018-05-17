//
//  YRLoopMenuMode.h
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YRLoopMenuMode : NSObject


@property (strong, nonatomic) NSString *iconName;


+(instancetype)modeWithName:(NSString *)name;

@end
