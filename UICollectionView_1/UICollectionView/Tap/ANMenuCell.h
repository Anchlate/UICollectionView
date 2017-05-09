//
//  ANMenuCell.h
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+expanded.h"

//weakself
#define WEAKSELF(weakSelf) __weak __typeof(&*self)weakSelf = self

@interface ANMenuCell : UICollectionViewCell

@property (nonatomic, copy) NSString *title;

@end
