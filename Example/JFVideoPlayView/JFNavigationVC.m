//
//  JFNavigationVC.m
//  JFProject
//
//  Created by Liu-Mac on 2/6/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "JFNavigationVC.h"

@interface JFNavigationVC ()

@end

@implementation JFNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 隐藏导航栏, JFBaseVC中定制导航栏和item
    self.navigationBar.hidden = YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    // 让应用一般情况下通过这个导航控制器弹出的控制器都只支持竖屏
    // 如果某个特殊子控制器需要支持特定的屏幕方向, 可以自行设定
    return UIInterfaceOrientationMaskLandscape;
}

@end
