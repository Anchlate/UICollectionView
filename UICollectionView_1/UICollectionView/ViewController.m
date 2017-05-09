//
//  ViewController.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"

#import "ANMenuView.h"

@interface ViewController ()
@property (nonatomic, strong) ANMenuView *tapView;
- (IBAction)click:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)click:(id)sender {
    
    
}


- (ANMenuView *)tapView {
    
    if (!_tapView) {
        _tapView = [[ANMenuView alloc]initWithFrame:CGRectMake(0, 60, 300, 500)];
        
        _tapView.vc = self;
        _tapView.backgroundColor = [UIColor redColor];
    }
    return _tapView;
}

@end
