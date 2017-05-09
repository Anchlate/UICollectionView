
//
//  ANShowVC.m
//  UICollectionView
//
//  Created by Qianrun on 16/12/29.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ANShowVC.h"
#import "ANCollectionViewCell.h"
#import "ANCollectionViewLayout.h"

static NSString * const kIdentifierCell = @"ANCollectionViewCell";

@interface ANShowVC () <UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ANCollectionViewLayout *waterLayout;
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
    
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ANCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifierCell forIndexPath:indexPath];
    
    cell.imageName = self.dataArray[indexPath.row];
    
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
- (ANCollectionViewLayout *)waterLayout {
    
    if (!_waterLayout) {
        
        //layout内部有设置默认属性
        _waterLayout = [[ANCollectionViewLayout alloc] init];
        _waterLayout.lineNumber = 4;
        _waterLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //计算每个item高度方法，必须实现（也可以设计为代理实现）
        __weak typeof(self) weakSelf = self;
        
        [_waterLayout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
            NSString *imageName = weakSelf.dataArray[indexPath.row];
            UIImage *image = [UIImage imageNamed:imageName];
            CGFloat itemH = image.size.height / image.size.width * width;
            return itemH;
        }];
        
        //内间距
        _waterLayout.sectionInset = UIEdgeInsetsMake(20, 10, 10, 10);
    }
    return _waterLayout;
}

@end
