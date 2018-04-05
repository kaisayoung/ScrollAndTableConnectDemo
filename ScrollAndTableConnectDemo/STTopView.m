//
//  STTopView.m
//  ScrollAndTableConnectDemo
//
//  Created by wangqi.kaisa on 2018/4/5.
//  Copyright © 2018年 God Is A Girl. All rights reserved.
//

#import "STTopView.h"
#import "UIView+STFrameKit.h"

@interface STTopView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation STTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initScrollView];
    }
    return self;
}

- (void)initScrollView {
    [self addSubview:self.scrollView];
    NSInteger count = 10;
    CGFloat top = 0;
    for (NSInteger i = 0; i < count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, top + 10, self.bounds.size.width - 40, 100 - 20)];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:20];
        label.text = [NSString stringWithFormat:@"I am a label in scrollview number is : %ld",i];
        [self.scrollView addSubview:label];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, top + 99, self.bounds.size.width, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.scrollView addSubview:lineView];
        top += 100;
    }
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.bounds.size.width, 10*100)];
}

- (CGFloat)fullContentHeight {
    return self.scrollView.contentSize.height;
}

#pragma mark - Get

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    }
    return _scrollView;
}

@end
