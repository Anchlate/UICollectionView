//
//  ViewController.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "ANHomeProductViewController.h"

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
    
    ANHomeProductViewController *vc = [[ANHomeProductViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
