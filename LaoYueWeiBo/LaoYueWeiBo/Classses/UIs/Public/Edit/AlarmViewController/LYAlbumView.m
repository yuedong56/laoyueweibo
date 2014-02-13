//
//  LYAlbumView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LYAlbumView.h"
#import "LYAlbumCell.h"

@implementation LYAlbumView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = WhiteColor;
        self.mediaArray = [NSMutableArray arrayWithCapacity:0];
        
        [self initMediaCollectView];
        [self initAlbumBottomView];
    }
    return self;
}

- (void)initMediaCollectView
{
    PSTCollectionViewFlowLayout *flowLayout = [[PSTCollectionViewFlowLayout alloc] init];
    //设置每个cell显示数据的宽和高必须
    [flowLayout setItemSize:CGSizeMake(AlbumCell_Width,AlbumCell_Width)];
    [flowLayout setScrollDirection:PSTCollectionViewScrollDirectionVertical]; //控制滑动分页用
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    //创建一屏的视图大小
    self.mediaCollectionView = [[PSTCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];

    //对Cell注册(必须否则程序会挂掉)
    [self.mediaCollectionView registerClass:[LYAlbumCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.mediaCollectionView setUserInteractionEnabled:YES];
    
    [self.mediaCollectionView setDelegate:self]; //代理－视图
    [self.mediaCollectionView setDataSource:self]; //代理－数据
    
    [self addSubview:self.mediaCollectionView];
}

- (void)initAlbumBottomView
{
    self.bottomView = [[LYAlbumBottomView alloc] initWithFrame:CGRectMake(0, ScreenHeight-BottomView_Height, ScreenWidth, BottomView_Height)];
    [self addSubview:self.bottomView];
}

- (void)reloadData
{
    [self.mediaCollectionView reloadData];
}

#pragma mark - PSTCollection DataSource
//集合代理-每一部分数据项
- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mediaArray.count;
}

//Cell
- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImage *image = [self.mediaArray objectAtIndex:indexPath.row];
    [cell.photoImageButton setBackgroundImage:image forState:UIControlStateNormal];
    
    return cell;
}

//代理－选择行的触发事件
- (void)collectionView:(PSTCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //点击
    NSLog(@"(%d,%d)",indexPath.section,indexPath.row);
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (velocity.y > 0) {
        [self.delegate albumViewDidUpSwipe:self];
    }
}

@end
