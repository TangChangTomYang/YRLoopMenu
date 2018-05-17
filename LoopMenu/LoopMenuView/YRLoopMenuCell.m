//
//  YRLoopMenuCell.m
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRLoopMenuCell.h"
#import "YRLoopMenuMode.h"


@implementation YRLoopMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)setMode:(YRLoopMenuMode *)mode{
    _mode = mode;
    
    self.imgV.image = [UIImage imageNamed:mode.iconName];
//    self.lb.text = mode.iconName;
    
}


-(void)setIndexP:(NSIndexPath *)indexP{
    _indexP = indexP;
    self.lb.text = [@(indexP.row) stringValue];
    
}
@end
