
//
//  ANShowVC.m
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ANShowVC.h"
#import "ANCollectionViewCell.h"
#import "UICollectionViewLeftAlignedLayout.h"

static NSString * const kIdentifierCell = @"ANCollectionViewCell";

@interface ANShowVC () <UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewLeftAlignedLayout *waterLayout;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ANShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
    
}

- (void)initData{
    self.dataArray = [NSMutableArray array];
    //添加照片名字
    for (int i = 1; i <= 34; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        [self.dataArray addObject:imageName];
    }
}

- (void)initUI{
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ANCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifierCell forIndexPath:indexPath];
    
    cell.title = [NSString stringWithFormat:@"%ld", indexPath.row * 12345];
    
    return cell;
}


#pragma mark -Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:self.waterLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"ANCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kIdentifierCell];
        
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
}
- (UICollectionViewLeftAlignedLayout *)waterLayout {
    
    if (!_waterLayout) {
        _waterLayout = [[UICollectionViewLeftAlignedLayout alloc]init];
    }
    return _waterLayout;
}

@end
