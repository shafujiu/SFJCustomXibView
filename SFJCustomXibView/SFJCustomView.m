//
//  SFJCustomView.m
//  SFJCustomXibView
//
//  Created by 沙缚柩 on 2017/5/10.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJCustomView.h"

@interface SFJCustomView ()

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SFJCustomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_setup];
    }
    return self;
}

- (void)p_setup{
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]; // 调用此方法，加载self.view
    self.view.frame = self.bounds;
    [self addSubview:self.view];
}


@end
