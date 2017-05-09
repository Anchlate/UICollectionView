//
//  ANMenuView.h
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANMenuView : UIView

@property (nonatomic, copy) NSMutableArray *tags;
@property (nonatomic, strong) UIViewController *vc;

- (CGFloat)heightForMenuView;

@end
