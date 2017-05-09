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

@interface ANMenuView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>
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
        
        [self.tags addObject:@"添加标签"];
        
        [self addSubview:self.collectionView];
        
    }
    
    return self;
    
}

- (id)init {
    
    if (self = [super init]) {
        
//        [self.collectionView reloadData];
        
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.tags.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ANMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *title = self.tags[indexPath.row];
    
    cell.title = title;
    
    NSLog(@"......collectionview cell row: %ld ", indexPath.row);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row != self.tags.count - 1) return;
    
    [self addTagWithIndexPath:indexPath];
}

#pragma mark -UITextViewDelegate
//评论键盘中右下角完成按钮无效，收起键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark -UITextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (string.length == 0) return YES;
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    if (existedLength - selectedLength + replaceLength > 8) {
        return NO;
    }
    
    return YES;
}

#pragma mark -Private
- (CGFloat)heightForMenuView {
    
    return self.collectionView.contentSize.height;
}

- (void)addTagWithIndexPath:(NSIndexPath *)indexPath {
    
    WEAKSELF(weakSelf);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加标签" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.font = [UIFont systemFontOfSize:17];
        textField.returnKeyType = UIReturnKeyDone;
        textField.delegate = self;
        textField.tintColor = [UIColor blueColor];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *comfirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([alert.textFields firstObject].text.length > 0) {
            
            if ([[alert.textFields firstObject].text isEqualToString:@"添加标签"]) {
                
                
                //[MBProgressHUD showError:@"无效标签"];
//                kMaim(^{
//                      
//                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakSelf animated:YES];
//                        hud.mode = MBProgressHUDModeText;
//                        hud.animationType = MBProgressHUDAnimationFade;
//                        hud.labelText = @"无效标签";
//                        hud.removeFromSuperViewOnHide = YES;
//                        [hud hide:YES afterDelay:1];
//                      
//                      });
                
            } else {
                
                
                [weakSelf.tags insertObject:[alert.textFields firstObject].text atIndex:self.tags.count - 1];
                
                
                dispatch_async(dispatch_get_main_queue(),^{
                    
                    
                    [weakSelf.collectionView reloadData];
                    
                });
                dispatch_async(dispatch_get_main_queue(),^{
                    
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"didEndDisplayingCell" object:@(weakSelf.collectionView.collectionViewLayout.collectionViewContentSize.height)];
                    
                });
                
                
                
//                dispatch_block_t updates = ^{
//                    
//                    [weakSelf.collectionView insertItemsAtIndexPaths:@[indexPath]];
//                };
//                
//                [weakSelf.collectionView performBatchUpdates:updates completion:^(BOOL finished) {
//                    
//                    if (finished) {
//                        
//                        kMaim(^{
//                            NSLog(@"......sizeHeight:%f", self.collectionView.collectionViewLayout.collectionViewContentSize.height);
//                            [[NSNotificationCenter defaultCenter]postNotificationName:@"didEndDisplayingCell" object:@(weakSelf.collectionView.collectionViewLayout.collectionViewContentSize.height)];
//                            
//                        });
//                    }
//                    
//                }];
                
                
            }
        }
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:comfirmAction];
    
    [self.vc presentViewController:alert animated:YES completion:nil];
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
        
        flowLayout.sectionInset = UIEdgeInsetsMake(12, 15, 12, 15);
        
        // 设置 UICollectionView 的滑动方向
        // flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        [_collectionView setCollectionViewLayout:flowLayout animated:NO];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"ANMenuCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
//        [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
    }
    return _collectionView;
}

- (NSMutableArray *)tags {
    
    if (!_tags) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}

@end
