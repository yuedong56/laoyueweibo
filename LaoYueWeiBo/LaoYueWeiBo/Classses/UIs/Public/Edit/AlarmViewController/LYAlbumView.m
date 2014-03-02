//
//  LYAlbumView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LYAlbumView.h"
#import "LYAlbumCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation LYAlbumView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = WhiteColor;
        self.albumItemsArray = [NSMutableArray arrayWithCapacity:0];
        self.selectItemsArray = [NSMutableArray arrayWithCapacity:0];
        
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
    self.mediaCollectionView.backgroundColor = WhiteColor;

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
- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.albumItemsArray.count;
}

- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    AlbumItem *albumItem = [self.albumItemsArray objectAtIndex:indexPath.row];
    
    UIImage *image = [[UIImage alloc] initWithCGImage:albumItem.albumAsset.thumbnail];
    [cell.photoImageButton setBackgroundImage:image forState:UIControlStateNormal];
    [cell.photoImageButton addTarget:self action:@selector(photoButtonPress:event:) forControlEvents:UIControlEventTouchUpInside];
    
    if (albumItem.isSelected) {
        cell.markImageView.image = ImageNamed(@"edt_alarm_selected.png");
    } else {
        cell.markImageView.image = nil;
    }
    
    return cell;
}

#pragma mark - Button Events
- (void)photoButtonPress:(UIButton *)button event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.mediaCollectionView];
    NSIndexPath *indexPath = [self.mediaCollectionView indexPathForItemAtPoint:currentTouchPosition];

    AlbumItem *albumItem = self.albumItemsArray[indexPath.row];

    if (self.selectItemsArray.count<MaxPhotoNum || albumItem.isSelected)
    {
        albumItem.isSelected = !albumItem.isSelected;
        if (albumItem.isSelected) {
            [self.selectItemsArray addObject:albumItem.albumAsset];
        } else {
            [self.selectItemsArray removeObject:albumItem.albumAsset];
        }
        
        [self.mediaCollectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    }
    else
    {
        NSString *msg = [NSString stringWithFormat:@"最多只能上传%d张图片！",MaxPhotoNum];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"通知" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (velocity.y > 0) {
        [self.delegate albumViewDidUpSwipe:self];
    }
}

@end



@implementation AlbumItem

- (id)initWithAsset:(ALAsset *)asset
{
    self = [super init];
    if (self) {
        self.albumAsset = asset;
    }
    return self;
}

@end
