//
//  ViewController.m
//  ScrollAndTableConnectDemo
//
//  Created by wangqi.kaisa on 2018/4/5.
//  Copyright © 2018年 God Is A Girl. All rights reserved.
//

#import "ViewController.h"
#import "STTopView.h"
#import "STMiddleView.h"
#import "STBottomView.h"
#import "UIView+STFrameKit.h"

@interface ViewController ()<UIScrollViewDelegate,STBottomTableViewDataSource>

@property (nonatomic, strong) UIScrollView *containerScrollView;

@property (nonatomic, strong) STTopView *topView;
@property (nonatomic, strong) STMiddleView *middleView;
@property (nonatomic, strong) STBottomView *bottomView;

@end

@implementation ViewController

- (void)dealloc {
    self.containerScrollView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContainerScrollView];
    self.title = @"ScrollAndTableConnectDemo";
}

- (void)initContainerScrollView {
    [self.view addSubview:self.containerScrollView];
    [self.containerScrollView addSubview:self.topView];
    [self.containerScrollView addSubview:self.bottomView];
    [self.bottomView setHeaderViewIfNeeded];
    self.topView.scrollView.scrollsToTop = NO;
    self.topView.scrollView.scrollEnabled = NO;
    self.bottomView.scrollView.scrollsToTop = NO;
    self.bottomView.scrollView.scrollEnabled = NO;
    // 如果view高度会变化，应用KVO观察然后重新设置即可
    self.bottomView.top = self.topView.fullContentHeight;
    self.containerScrollView.contentSize = CGSizeMake(self.containerScrollView.bounds.size.width, self.topView.fullContentHeight + self.bottomView.fullContentHeight);
}

- (void)refreshHeaderAndFooterFrame {
    CGFloat containerOffsetY = self.containerScrollView.contentOffset.y;
    CGFloat maxTopOffsetY = MAX(self.topView.fullContentHeight - self.topView.height, 0);
    CGFloat realTopOffsetY = MIN(MAX(containerOffsetY, 0), maxTopOffsetY);
    if (realTopOffsetY != self.topView.top) {
        self.topView.top = realTopOffsetY;
    }
    if (realTopOffsetY != self.topView.scrollView.contentOffset.y) {
        [self scrollView:self.topView.scrollView setContentOffset:CGPointMake(0, realTopOffsetY)];
    }
 
    CGFloat maxbottomY = MAX(self.topView.fullContentHeight, containerOffsetY);
    CGFloat realBottomOffsetY = MAX(0, containerOffsetY - self.topView.fullContentHeight);
    if (maxbottomY != self.bottomView.top) {
        self.bottomView.top = maxbottomY;
    }
    if (realBottomOffsetY != self.bottomView.scrollView.contentOffset.y) {
        [self scrollView:self.bottomView.scrollView setContentOffset:CGPointMake(0, realBottomOffsetY)];
    }
}

- (void)scrollView:(UIScrollView *)scrollView setContentOffset:(CGPoint)offset {
    scrollView.contentOffset = offset;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.containerScrollView) {
        [self refreshHeaderAndFooterFrame];
    }
}

#pragma mark - STBottomTableViewDataSource

- (UIView *)bottomTableHeaderView {
    return self.middleView;
}

#pragma mark - Get

- (UIScrollView *)containerScrollView {
    if (!_containerScrollView) {
        _containerScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _containerScrollView.delegate = self;
    }
    return _containerScrollView;
}

- (STTopView *)topView {
    if (!_topView) {
        _topView = [[STTopView alloc] initWithFrame:self.view.bounds];
        _topView.backgroundColor = [UIColor redColor];
    }
    return _topView;
}

- (STMiddleView *)middleView {
    if (!_middleView) {
        _middleView = [[STMiddleView alloc] initWithFrame:self.view.bounds];
        _middleView.backgroundColor = [UIColor yellowColor];
    }
    return _middleView;
}

- (STBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[STBottomView alloc] initWithFrame:self.view.bounds];
        _bottomView.dataSource = self;
        _bottomView.backgroundColor = [UIColor greenColor];
    }
    return _bottomView;
}

@end
