//
//  HorizontalSlipMenuView.h
//  HorizontalSlipMenu
//
//  Created by Luo on 2018/11/16.
//  Copyright © 2018年 Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HorizontalSlipMenuView;
@protocol HorizontalSlipMenuViewDelegate <NSObject>

/**
 选中item事件
 */
- (void)horizontalSlipMenuView:(HorizontalSlipMenuView *)horizontalSlipMenuView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface HorizontalSlipMenuView : UIView

@property (nonatomic, weak) id <HorizontalSlipMenuViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource;
@end
