//
//  YRLoopMunuLayout.h
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>





@protocol YRLoopMunuLayoutDelegate <NSObject>

-(void)collectioViewDidScrollToIndex:(NSInteger)index;

@end


@interface YRLoopMunuLayout : UICollectionViewFlowLayout


/** 3D缩放值，若为0，则为2D广告 */
@property (nonatomic,assign)CGFloat threeDimensionalScale;

/** 非当前广告的alpha值 */
@property (nonatomic,assign) CGFloat secondaryItemMinAlpha;


/** 循环起始点  */
@property (nonatomic,assign)NSInteger cycleIndex;

/**代理*/
@property (nonatomic,assign) id<YRLoopMunuLayoutDelegate>delegate;


@end
