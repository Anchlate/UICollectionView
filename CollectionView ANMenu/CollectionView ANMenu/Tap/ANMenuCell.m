//
//  ANMenuCell.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ANMenuCell.h"


@interface ANMenuCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation ANMenuCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 5, 80, 10)];
//        
//        view.layer.cornerRadius = 10;
////        view.layer.borderColor = [UIColor redColor].CGColor;
//        view.layer.borderWidth = 2;
//        
//        view.backgroundColor = [UIColor colorWithHexString:@"efefef"];
//        self.selectedBackgroundView = view;
//        self.backgroundColor = [UIColor blueColor];
        
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"efefef"];
        self.contentView.layer.cornerRadius = 4;
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

#pragma mark -Overide
- (void)setSelected:(BOOL)selected {
    
    [super setSelected:selected];
//    self.titleLabel.highlighted = selected;
}

#pragma mark -Setter
- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = title;
    
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"efefef"];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    if ([_title isEqualToString:@"添加标签"]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"2681c9"];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
}


@end
