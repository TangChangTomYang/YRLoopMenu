//
//  YRLoopMunuView.h
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRLoopMenuView : UIView


//@property (assign, nonatomic)int iconIndex;

-(void)setOriginIconIndex:(NSInteger)originIndex;

@property (assign, nonatomic,readonly)BOOL isScrolling;
-(NSNumber *)selectedIconIndex;
@end
