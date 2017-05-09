//
//  ANCollectionViewCell.h
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, copy) NSString *title;

@end
