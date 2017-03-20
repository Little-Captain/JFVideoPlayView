//
//  JFViewController.m
//  JFVideoPlayView
//
//  Created by Little-Captain on 03/20/2017.
//  Copyright (c) 2017 Little-Captain. All rights reserved.
//

#import "JFViewController.h"
#import "JFVideoPlayView.h"
#import "Masonry.h"

@interface JFViewController () <JFVideoPlayViewDelegate>

@property (nonatomic, weak) JFVideoPlayView *playView;

@end

@implementation JFViewController

- (void)viewDidLoad {
    
    self.navigationController.navigationBar.hidden = YES;
    
    [super viewDidLoad];
    
    [self setUpVideoPlayView];
    
    // 这里使用多线程让界面都准备好了再启动播放
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.playView launchPlayer];
    });
}


- (void)setUpVideoPlayView {
    
    JFVideoPlayView *playView = [JFVideoPlayView videoPlayView];
    [self.view addSubview:playView];
    self.playView = playView;
    playView.delegate = self;
    playView.containerViewController = self;
    [playView setUrlString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
    
    // 自动布局
    [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(self.view.mas_width).multipliedBy(9.0 / 16.0);
    }];
}

@end
