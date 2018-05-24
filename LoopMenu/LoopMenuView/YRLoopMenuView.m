//
//  YRLoopMunuView.m
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRLoopMenuView.h"
#import "YRLoopMenuMode.h"
#import "YRLoopMunuLayout.h"
#import "UIView+Extension.h"
#import "YRLoopMenuCell.h"




///轮播两侧准备的item倍数
#define LoopMenuPrepareItemTime 10


@interface YRLoopMenuView () <YRLoopMunuLayoutDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
{
    
    BOOL _isScrolling;
}
@property (strong, nonatomic) NSMutableArray<YRLoopMenuMode*> *modeArrM;
@property (strong, nonatomic) NSMutableArray<YRLoopMenuMode*> *displayModeArrM;
@property (nonatomic,strong)UICollectionView *collectionView;

@property (strong, nonatomic) YRLoopMunuLayout *loopLayout;



@end

@implementation YRLoopMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self modeArrM];
        [self displayModeArrM];
        [self loopLayout];
        [self collectionView];
        
        
        [self setOriginIconIndex:2];
        
    }
    return self;
}

-(void)setOriginIconIndex:(NSInteger)originIndex{
    NSInteger startIndex = LoopMenuPrepareItemTime * self.modeArrM.count + originIndex ;
    NSIndexPath *indexP = [NSIndexPath indexPathForRow:startIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexP atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}


-(NSMutableArray<YRLoopMenuMode*> *)modeArrM{
    
    if (!_modeArrM) {
        _modeArrM = [NSMutableArray array];
        
        [_modeArrM addObject: [YRLoopMenuMode modeWithName:@"family_roomicon0_on"]];
        [_modeArrM addObject: [YRLoopMenuMode modeWithName:@"family_roomicon1_on"]];
        [_modeArrM addObject: [YRLoopMenuMode modeWithName:@"family_roomicon2_on"]];
        [_modeArrM addObject: [YRLoopMenuMode modeWithName:@"family_roomicon3_on"]];
        [_modeArrM addObject: [YRLoopMenuMode modeWithName:@"family_roomicon4_on"]];
        
    }
    return _modeArrM;
    
}

-(NSMutableArray<YRLoopMenuMode*> *)displayModeArrM{
    if (!_displayModeArrM) {
        _displayModeArrM = [NSMutableArray array];
        
        
        for (int i=0;i<2*LoopMenuPrepareItemTime+1;i++) {
            [_displayModeArrM addObjectsFromArray:self.modeArrM];
//            _displayModeArrM = [_displayModeArrM arrayByAddingObjectsFromArray:self.modeArrM];
        }
    }
    return _displayModeArrM;
    
}



-(YRLoopMunuLayout *)loopLayout{
    if (!_loopLayout) {
        _loopLayout = [[YRLoopMunuLayout alloc]init];
        _loopLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
        
        
        CGFloat margin  = 10;
        CGFloat itemWidth =  (self.width - 6.0 * margin)/5.0 - 1;
        CGFloat itemHeight = (self.height- 2.0 * margin) -1 ;
        
        _loopLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
        
        _loopLayout.minimumLineSpacing = margin;
        _loopLayout.minimumInteritemSpacing = margin;
        
        _loopLayout.secondaryItemMinAlpha = 0;
        _loopLayout.threeDimensionalScale = 1.45;
        _loopLayout.delegate = self;
        /** 循环起始点  */
        _loopLayout.cycleIndex = self.modeArrM.count*LoopMenuPrepareItemTime ;
     
    }
    return _loopLayout;
    
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        // (CGRect){0,0,self.frame.size}
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.loopLayout];
        
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        UINib *nib = [UINib nibWithNibName:@"YRLoopMenuCell" bundle:nil];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:@"YRLoopMenuCell"];
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
    
}

#pragma mark- UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.displayModeArrM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YRLoopMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YRLoopMenuCell" forIndexPath:indexPath];
    
    cell.mode = self.displayModeArrM[indexPath.item];
    cell.indexP = indexPath;
    return cell;
}


-(NSIndexPath *)centerIndexPath{
    CGPoint collectionViewCenter = [self convertPoint:self.collectionView.center toView:self.collectionView];
    NSIndexPath *centerIndexPath = [self.collectionView indexPathForItemAtPoint:collectionViewCenter];
    return centerIndexPath;
}

// 点击item的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath *centerIndexPath = [self centerIndexPath];;
    
    
    if (indexPath.row == centerIndexPath.row) {
        //点击了中间的广告
        NSLog(@"点击了中间的广告");
    }
    else  {
        //点击了背后的广告，将会被移动上来
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _isScrolling = YES; 
}

#pragma mark- UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self secretlyChangeIndex];
    _isScrolling = NO;
    
}


-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self secretlyChangeIndex];
    _isScrolling = NO;
}

-(void)secretlyChangeIndex{
    
    // 获取中间的indexpath
    NSIndexPath *indexpath = [self centerIndexPath];;
    
    NSInteger itemCount = self.modeArrM.count;
    
    if (indexpath.row < itemCount *LoopMenuPrepareItemTime || indexpath.row >= itemCount*(LoopMenuPrepareItemTime +1)) {
        
        NSIndexPath *to_indexPath =[NSIndexPath indexPathForRow:indexpath.row % itemCount+itemCount*LoopMenuPrepareItemTime inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:to_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
}






#pragma mark- YRLoopMunuLayoutDelegate
-(void)collectioViewDidScrollToIndex:(NSInteger)index{
    

    
}



-(NSNumber *)selectedIconIndex{
    
    if (_isScrolling == YES) {
        return nil;
    }
  return   @([self centerIndexPath].row % self.modeArrM.count);
}

@end
