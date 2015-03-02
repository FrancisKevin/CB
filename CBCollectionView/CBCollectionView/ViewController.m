//
//  ViewController.m
//  CBCollectionView
//
//  Created by Bing on 15/3/2.
//  Copyright (c) 2015年 Bing. All rights reserved.
//

#import "ViewController.h"

#import "MyHeadViewCollectionView.h"

#define kCellIdentifier @"myCollectionCell"
#define kReuseIdentifier @"myCellHeader"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (strong, nonatomic) NSMutableArray *myArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI
{
    // UICollectionViewLayout决定了UICollectionView如何显示在界面上。Flow Layout是一个Cells的线性布局方案，并具有页面和页脚
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 20, 250, 350) collectionViewLayout:flowLayout];
    self.myCollectionView.backgroundColor = [UIColor grayColor];
    [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    [self.view addSubview:self.myCollectionView];
    
    // 补充视图。页眉页脚
    [self.myCollectionView registerClass:[MyHeadViewCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReuseIdentifier];
    [self.myCollectionView registerClass:[MyHeadViewCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kReuseIdentifier];
}

#pragma mark - UICollectionViewDataSource
// collection view里区(section)的个数,默认为1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

/*
 UICollectionViewCell结构上相对比较简单，由下至上：
 
 首先是cell本身作为容器view
 然后是一个大小自动适应整个cell的backgroundView，用作cell平时的背景
 再其次是selectedBackgroundView，是cell被选中时的背景
 最后是一个contentView，自定义内容应被加在这个view上
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    else if (indexPath.section == 1)
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

// 添加页眉和页脚以前需要注册类和标识
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyHeadViewCollectionView *headView;
    
    if([kind isEqual:UICollectionElementKindSectionHeader])
    {
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
        [headView setLabelText:[NSString stringWithFormat:@"section %ld's header", (long)indexPath.section]];
    }
    else if([kind isEqual:UICollectionElementKindSectionFooter])
    {
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
        [headView setLabelText:[NSString stringWithFormat:@"section %ld's footer", (long)indexPath.section]];
    }
    return headView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1)
    {
        return CGSizeMake(50, 50);
    }
    else
    {
        return CGSizeMake(75, 30);
    }
}

// minimumLineSpacing属性。设定指定区内Cell的最小行距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0)
    {
        return 10.0;
    }
    else
    {
        return 20.0;
    }
}

// minimumInteritemSpacing属性。设定指定区内Cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 0)
    {
        return 10.0;
    }
    else
    {
        return 20.0;
    }
}

// sectionInset属性。设定指定区的内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0)
    {
        return UIEdgeInsetsMake(35, 25, 15, 25);
    }
    else
    {
        return UIEdgeInsetsMake(15, 15, 15, 15);
    }
}

// 设定页眉的尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = {240,25};
    return size;
}

// 设定页脚的尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size = {240,25};
    return size;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.myArray removeObjectAtIndex:indexPath.row];
    
    [collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
}



@end
