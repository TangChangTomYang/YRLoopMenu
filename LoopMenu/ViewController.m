//
//  ViewController.m
//  LoopMenu
//
//  Created by yangrui on 2018/5/17.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "YRLoopMenuView.h"

@interface ViewController ()

@property (strong, nonatomic) YRLoopMenuView *loopMenu ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   YRLoopMenuView *loopMenu = [[YRLoopMenuView alloc ] initWithFrame:CGRectMake(0, 100, self.view.width, 200)];
    loopMenu.backgroundColor = [UIColor brownColor];
    [self.view addSubview:loopMenu];
    self.loopMenu = loopMenu;
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self.loopMenu isScrolling]) {
        NSLog(@"还在转----------");
    }
    else{
       
        NSLog(@"选中了---------%@-", [self.loopMenu selectedIconIndex]);
    }
}


@end
