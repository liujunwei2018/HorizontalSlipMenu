//
//  ViewController.m
//  HorizontalSlipMenu
//
//  Created by Luo on 2018/11/16.
//  Copyright © 2018年 Luo. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalSlipMenuView.h"

@interface ViewController () <HorizontalSlipMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *dict1 = @{@"image": @"image", @"title": @"标题1"};
    NSDictionary *dict2 = @{@"image": @"image2", @"title": @"标题2"};
    NSDictionary *dict3 = @{@"image": @"image", @"title": @"标题3"};
    NSDictionary *dict4 = @{@"image": @"image2", @"title": @"标题4"};
    NSDictionary *dict5 = @{@"image": @"image", @"title": @"标题5"};
    NSDictionary *dict6 = @{@"image": @"image2", @"title": @"标题6"};
    NSArray *dataSource = @[dict1, dict2, dict3, dict4, dict5, dict6];
    
    HorizontalSlipMenuView *view = [[HorizontalSlipMenuView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100) dataSource:dataSource];
    view.delegate = self;
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [self.view addSubview:view];
}

- (void)horizontalSlipMenuView:(HorizontalSlipMenuView *)horizontalSlipMenuView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中%d",(int)indexPath.item);
}


@end
