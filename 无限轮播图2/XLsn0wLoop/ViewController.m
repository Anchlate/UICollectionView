//
//  ViewController.m
//  XLsn0wLoop
//
//  Created by XLsn0w on 2017/1/12.
//  Copyright © 2017年 XLsn0w. All rights reserved.
//

#import "ViewController.h"

#import "XLsn0wLoop.h"

@interface ViewController () <XLsn0wLoopDelegate>

@property (nonatomic, strong) XLsn0wLoop *loop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLoop];
}
    
- (void)addLoop {
    self.loop = [[XLsn0wLoop alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:self.loop];
    self.loop.xlsn0wDelegate = self;
    self.loop.time = 2;
    [self.loop setPageColor:[UIColor clearColor] andCurrentPageColor:[UIColor clearColor]];
    //支持gif动态图
    self.loop.imageArray = @[@"http://i3.hoopchina.com.cn/u/1212/19/386/16355386/2d4f91db_530x.gif",
                             @"http://pic2015.5442.com/2015/1118/8/18.jpg%21960.jpg",
                             @"http://tpic.home.news.cn/xhCloudNewsPic/xhpic1501/M07/1B/9C/wKhTlVeRvImESafHAAAAAGHVmt8775.gif",
                             @"http://www.pp3.cn/uploads/201606/2016060401.jpg"];
}

#pragma mark XRCarouselViewDelegate
- (void)loopView:(XLsn0wLoop *)loopView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
