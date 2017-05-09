//
//  ViewController.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "ANShowVC.h"
#import "SecondViewController.h"

@interface ViewController ()

- (IBAction)click:(id)sender;

- (IBAction)secondAciton:(id)sender;

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

- (IBAction)secondAciton:(id)sender {
    
    SecondViewController *vc = [SecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
