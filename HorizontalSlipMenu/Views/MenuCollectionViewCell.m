//
//  MenuCollectionViewCell.m
//  HorizontalSlipMenu
//
//  Created by Luo on 2018/11/16.
//  Copyright © 2018年 Luo. All rights reserved.
//

#import "MenuCollectionViewCell.h"

#define kWidth self.bounds.size.width
#define kHeigth self.bounds.size.height
static CGFloat const kMargin = 10.0f;
static CGFloat const kTitleHeight = 20.0f;

@implementation MenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
}

#pragma mark - getter setter

- (UIImageView *)imageView {
    if (!_imageView) {
        CGFloat kImageWidth = kWidth - kTitleHeight - kMargin;
        CGFloat kImageHeight = kImageWidth;
        CGFloat kImageX = (kWidth - kImageWidth) / 2;
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
        _imageView.frame = CGRectMake(kImageX, kMargin / 2, kImageWidth, kImageHeight);
        _imageView.layer.cornerRadius = (kWidth - kTitleHeight - kMargin) / 2;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        CGFloat kTitleY = kHeigth - kTitleHeight;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kTitleY, kWidth, kTitleHeight)];
        _titleLabel.text = @"标题";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


@end
