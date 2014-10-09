//
//  CBProgressBar.m
//  CBProgressBar
//
//  Created by xychen on 14-2-24.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBProgressBar.h"

@implementation CBProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (void)showProgressAddedTo:(UIView *)view text:(NSString *)text
{
    CBProgressBar *bar = [[self alloc] initWithView:view];
    [view addSubview:bar];
    
    // 背景View
    UIView *viewBg = [[UIView alloc] init];
    viewBg.backgroundColor = [UIColor colorWithRed:(0.0f / 255.0f) green:(0.0f / 255.0f) blue:(0.0f / 255.0f) alpha:0.4];
    viewBg.layer.cornerRadius = 15;
//    [bar insertSubview:viewBg belowSubview:animationImageView];
    [bar addSubview:viewBg];
    
    // 进度条图片
    NSArray *imagesArray = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"cbProgress1.png"],
                            [UIImage imageNamed:@"cbProgress2.png"],
                            [UIImage imageNamed:@"cbProgress3.png"],
                            [UIImage imageNamed:@"cbProgress4.png"],
                            [UIImage imageNamed:@"cbProgress5.png"],
                            [UIImage imageNamed:@"cbProgress6.png"],
                            [UIImage imageNamed:@"cbProgress7.png"],
                            [UIImage imageNamed:@"cbProgress8.png"],
                            [UIImage imageNamed:@"cbProgress9.png"],
                            [UIImage imageNamed:@"cbProgress10.png"], nil];
    UIImageView *animationImageView = [[UIImageView alloc] init];
    animationImageView.animationImages = imagesArray;//将序列帧数组赋给UIImageView的animationImages属性
    animationImageView.animationDuration = 0.9;//设置动画时间
    animationImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
    [animationImageView startAnimating];//开始播放动画
    [viewBg addSubview:animationImageView];
    
    // 文本
    UILabel *lbl;
    if (text && text.length>0)
    {
        lbl = [[UILabel alloc] init];
        lbl.text = text;
        lbl.textAlignment = UITextAlignmentCenter;
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:12];
        [viewBg addSubview:lbl];
    }
    else
    {
        
    }
    
    // 初始化Frame
    if (lbl)
    {
        lbl.numberOfLines = 0;
        CGSize size = [text sizeWithFont:lbl.font constrainedToSize:CGSizeMake(1000, CGRectGetHeight(lbl.frame)) lineBreakMode:NSLineBreakByCharWrapping];
        CGRect rect = lbl.frame;
        rect.size.width = size.width;
        rect.size.height = 16;
        lbl.frame = rect;
        
        // 调整圆角背景长度
        if (CGRectGetWidth(lbl.frame) < 50)
        {
            // 圆角背景
            viewBg.frame = CGRectMake(0, 0, 100, 100);
            viewBg.center = bar.center;
        }
        else
        {
            // 圆角背景
            viewBg.frame = CGRectMake(0, 0, CGRectGetWidth(lbl.frame)+20, 100);
            viewBg.center = bar.center;
        }
        
        // 动画
        animationImageView.frame = CGRectMake(0, 0, 50, 50);
        animationImageView.center = CGPointMake(CGRectGetWidth(viewBg.frame)/2, CGRectGetHeight(viewBg.frame)/2-10);
        
        // 文字
        rect.origin.y = CGRectGetMaxY(animationImageView.frame)+5;
        lbl.frame = rect;
        lbl.center = CGPointMake(CGRectGetWidth(viewBg.frame)/2, lbl.center.y);
    }
    else
    {
        viewBg.frame = CGRectMake(0, 0, 100, 100);
        viewBg.center = bar.center;
        
        animationImageView.frame = CGRectMake(0, 0, 50, 50);
        animationImageView.center = CGPointMake(CGRectGetWidth(viewBg.frame)/2, CGRectGetHeight(viewBg.frame)/2);
    }
}

+ (void)showProgressAddedTo:(UIView *)view
{
    [self showProgressAddedTo:view text:nil];
}

+ (void)hideProgressForView:(UIView *)view
{
    for (UIView *subview in [view subviews])
    {
        if ([subview isKindOfClass:self])
        {
            [subview removeFromSuperview];
        }
    }
}

- (id)initWithView:(UIView *)view
{
	return [self initWithFrame:view.bounds];
}

@end
