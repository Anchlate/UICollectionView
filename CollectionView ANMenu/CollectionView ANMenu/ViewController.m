//
//  ViewController.m
//  CollectionView ANMenu
//
//  Created by Qianrun on 17/2/8.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import "ViewController.h"

#import "ANMenuView.h"

@interface ViewController ()

@property (nonatomic, strong) ANMenuView *tapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tapView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
