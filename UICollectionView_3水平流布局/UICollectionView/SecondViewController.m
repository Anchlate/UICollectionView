//
//  SecondViewController.m
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "SecondViewController.h"
#import "ANMenuView.h"
#import "Masonry.h"

@interface SecondViewController ()

@property (nonatomic, strong) ANMenuView *menuView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.menuView];
    
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ANMenuView *)menuView {
    
    if (!_menuView) {
        _menuView = [ANMenuView new];
    }
    return _menuView;
}

@end
