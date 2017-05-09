//
//  ANMenuView.m
//  UICollectionView
//
//  Created by Qianrun on 16/7/20.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ANMenuView.h"
#import "Masonry.h"
#import "ANMenuCell.h"
#import "ANCollectionViewFlowLayout.h"

#define CellIdentifier @"CellIdentifier"

@interface ANMenuView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    CGFloat _verSpace;
    CGFloat _moveLeadingSpace;
}
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ANMenuView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
        _verSpace = 5;
        _moveLeadingSpace = 20;
        [self addSubview:self.collectionView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _verSpace = 5;
        _moveLeadingSpace = 20;
        
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
        
    }];
}

#pragma mark -Delegate
#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemX = CGRectGetMinX([collectionView cellForItemAtIndexPath:indexPath].frame);
    
    // 向前挪
    if (itemX > collectionView.contentOffset.x) {
        
        //当 scrollview 未到尽头时
        if (itemX - _moveLeadingSpace + CGRectGetWidth(collectionView.bounds) < collectionView.contentSize.width)
        {
            
            [collectionView setContentOffset:CGPointMake(itemX - _moveLeadingSpace, 0) animated:YES];
            
        } else { //当 scrollview 到尽头时
            
            [collectionView setContentOffset:CGPointMake(collectionView.contentSize.width - CGRectGetWidth(collectionView.bounds), 0) animated:YES];
        }
        
    } else { // 向后挪
        
        if (itemX > 0) {
            
            [collectionView setContentOffset:CGPointMake(itemX - _moveLeadingSpace, 0) animated:YES];
        }
        else
        {
            [collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ANMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"%ld", indexPath.row * 123456];
    
    return cell;
}

#pragma mark -Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        
        //创建 layout(此处创建的是流水布局)
        ANCollectionViewFlowLayout *flowLayout = [[ANCollectionViewFlowLayout alloc] init];
        
        //列距
        flowLayout.minimumInteritemSpacing = _verSpace;
        
        //预设每个 item 的大小，（自动布局）
        flowLayout.estimatedItemSize = CGSizeMake(1, 1);
        
        //设置 UICollectionView 的滑动方向
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ANMenuCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor darkGrayColor];
        
        [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
    }
    return _collectionView;
}

@end
