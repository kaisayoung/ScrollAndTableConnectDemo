//
//  STMiddleView.m
//  ScrollAndTableConnectDemo
//
//  Created by wangqi.kaisa on 2018/4/5.
//  Copyright © 2018年 God Is A Girl. All rights reserved.
//

#import "STMiddleView.h"
#import "UIView+STFrameKit.h"

@implementation STMiddleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.bounds.size.width - 40, 120)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:26];
    label.text = [NSString stringWithFormat:@"I am a label in middle view"];
    [self addSubview:label];
    self.height = 160;
}

@end
