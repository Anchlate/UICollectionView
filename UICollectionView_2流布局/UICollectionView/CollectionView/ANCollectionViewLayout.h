//
//  ANCollectionViewLayout.h
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>

 typedef CGFloat(^HeightBlock)(NSIndexPath *indexPath , CGFloat width);

@interface ANCollectionViewLayout : UICollectionViewFlowLayout

/** 列数 */
@property (nonatomic, assign) NSInteger lineNumber;

/** 行间距 */
@property (nonatomic, assign) CGFloat rowSpacing;

/** 列间距 */
@property (nonatomic, assign) CGFloat lineSpacing;

/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/**
 *  计算各个item高度方法 必须实现
 *
 *  @param block 设计计算item高度的block
 */
- (void)computeIndexCellHeightWithWidthBlock:(CGFloat(^)(NSIndexPath *indexPath , CGFloat width))block;

@end
