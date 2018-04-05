//
//  STBottomView.h
//  ScrollAndTableConnectDemo
//
//  Created by wangqi.kaisa on 2018/4/5.
//  Copyright © 2018年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * 内部嵌套一个TableView
 */

@class STBottomView;

@protocol STBottomTableViewDataSource <NSObject>

- (UIView *)bottomTableHeaderView;

@end

@interface STBottomView : UIView

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, assign, readonly) CGFloat fullContentHeight;

@property (nonatomic, weak) id<STBottomTableViewDataSource>dataSource;

- (void)setHeaderViewIfNeeded;

@end
