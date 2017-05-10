//
//  SFJCustomBadView.m
//  SFJCustomXibView
//
//  Created by 沙缚柩 on 2017/5/10.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJCustomBadView.h"

@interface SFJCustomBadView ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SFJCustomBadView

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
    UIView *view = [self view];
    view.frame = self.bounds;
    [self addSubview:view];
    
    _label.text = @"砂缚柩";
}

- (UIView *)view{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

/** 注意这里的owner传的self 是class 官方要求是 The object to assign as the nib’s File's Owner object.
    需要的是实例对象而不是class对象。
+ (UIView *)view{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}
*/

@end
