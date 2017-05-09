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

#define CellIdentifier @"CellIdentifier"
//#define Header @"Header"
//#define Footer @"Footer"


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
        
        _verSpace = 1;
        _moveLeadingSpace = 20;
        [self addSubview:self.collectionView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
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


//该方法用于设置 collectionView 的 header 和 footer
/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    //设置头部或尾部 view
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Header forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor orangeColor];
        return headerView;
    }
    else{
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Footer forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor yellowColor];
        return footerView;
    }
}
*/

//点击 cell 时调用响应的方法
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor blueColor];
//    
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"didselected = %lu, width:%f",indexPath.row, collectionView.contentSize.width);
//    CGFloat itemX = (_itemWidth + _horSpace) * indexPath.row;
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

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ANMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    
//    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    return CGSizeMake(100, collectionView.bounds.size.height);
//
//}

#pragma mark Collection view layout things
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 5.0;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 0.0;
//}
//
//// Layout: Set Edges
//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
//    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
//}


#pragma mark -Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        
        //创建 layout(此处创建的是流水布局)
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //行距
//        flowLayout.minimumLineSpacing = 2;
        
        //列距
        flowLayout.minimumInteritemSpacing = _verSpace;
        
        //设置每个 item 的大小
//        flowLayout.itemSize = CGSizeMake(100, 0);
        flowLayout.estimatedItemSize = CGSizeMake(1, 1);
        
        //设置 item 的上左下右的边距大小
//        flowLayout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        
        //设置 UICollectionView 的滑动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        //注册 item
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ANMenuCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
        
//        _collectionView [registerNib(UINib(nibName: "PersonalizedSettingsMovieCell", bundle: nil), forCellWithReuseIdentifier: "PersonalizedSettingsMovieCell")];
        
        //注册头部区域
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Header];
        
        //注册尾部区域
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Footer];
        
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