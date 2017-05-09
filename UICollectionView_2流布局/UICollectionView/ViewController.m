//
//  ViewController.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "ANShowVC.h"

@interface ViewController ()

- (IBAction)click:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)click:(id)sender {
    
    ANShowVC *vc = [ANShowVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
