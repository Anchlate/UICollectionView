//
//  ANCollectionViewFlowLayout.h
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Just a convenience protocol to keep things consistent.
 *  Someone could find it confusing for a delegate object to conform to UICollectionViewDelegateFlowLayout
 *  while using UICollectionViewLeftAlignedLayout.
 */
@protocol UICollectionViewDelegateLeftAlignedLayout <UICollectionViewDelegateFlowLayout>

@end

@interface ANCollectionViewFlowLayout : UICollectionViewFlowLayout

@end
