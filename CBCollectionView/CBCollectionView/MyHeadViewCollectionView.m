//
//  MyHeadViewCollectionView.m
//  CBCollectionView
//
//  Created by Bing on 15/3/2.
//  Copyright (c) 2015年 Bing. All rights reserved.
//

#import "MyHeadViewCollectionView.h"

@interface MyHeadViewCollectionView ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation MyHeadViewCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.label];
    }
    return self;
}

- (void)setLabelText:(NSString *)text
{
    self.label.text = text;
    [self.label sizeToFit];
}

@end
