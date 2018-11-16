//
//  HorizontalSlipMenuView.m
//  HorizontalSlipMenu
//
//  Created by Luo on 2018/11/16.
//  Copyright © 2018年 Luo. All rights reserved.
//

#import "HorizontalSlipMenuView.h"
#import "MenuCollectionViewCell.h"

static NSString *const kHorizontalSlipMenuViewCellID = @"kHorizontalSlipMenuViewCellID";
#define kItemWith self.bounds.size.height - 10.f
#define kItemHeigth kItemWith


@interface HorizontalSlipMenuView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation HorizontalSlipMenuView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource{
    if (self = [super initWithFrame:frame]) {
        self.dataSource = dataSource;
        [self setupUI];
       
    }
    return self;
}

#pragma mark - setup

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.dataSource) {
        return self.dataSource.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //数据字典
    NSDictionary *dict = self.dataSource[indexPath.item];
    
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHorizontalSlipMenuViewCellID forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
    cell.titleLabel.text = dict[@"title"];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 代理传递点击事件
    if ([self.delegate respondsToSelector:@selector(horizontalSlipMenuView:didSelectItemAtIndexPath:)]) {
        [self.delegate horizontalSlipMenuView:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 设置水平滑动
        flowLayout.itemSize = CGSizeMake(kItemWith, kItemHeigth);
        flowLayout.minimumLineSpacing = 10.0f;

        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout: flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置clearColor,背景颜色由 self.backgroundColor 决定
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:kHorizontalSlipMenuViewCellID];
    }
    return _collectionView;
}

@end
