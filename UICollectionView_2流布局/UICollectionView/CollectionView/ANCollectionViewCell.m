
//
//  ANCollectionViewCell.m
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ANCollectionViewCell.h"

@interface ANCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ANCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageName:(NSString *)imageName {
    
    if (_imageName != imageName) {
        _imageName = [imageName copy];
        _imgView.image = [UIImage imageNamed:_imageName];
    }
}

@end
