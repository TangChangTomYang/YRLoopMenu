//
//  YRLoopMenuCell.h
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YRLoopMenuMode;

@interface YRLoopMenuCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *lb;



@property (strong, nonatomic) YRLoopMenuMode *mode;
@property (strong, nonatomic) NSIndexPath *indexP;
@end
