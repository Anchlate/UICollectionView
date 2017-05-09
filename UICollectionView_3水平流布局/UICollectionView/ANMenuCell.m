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
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 5, 80, 10)];
        
        view.layer.cornerRadius = 10;
        view.layer.borderColor = [UIColor redColor].CGColor;
        view.layer.borderWidth = 2;
        
        view.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = view;
        
        self.backgroundColor = [UIColor blueColor];
        
        
        //
        NSLog(@"......:%@", NSStringFromCGRect(self.bounds));
        
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
    self.titleLabel.highlighted = selected;
}

#pragma mark -Setter
- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = title;
    
}


@end
