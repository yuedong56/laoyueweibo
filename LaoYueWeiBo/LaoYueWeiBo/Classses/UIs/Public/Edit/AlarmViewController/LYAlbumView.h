//
//  LYAlbumView.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#define MaxPhotoNum 9 //最多上传照片数量

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"
#import "LYAlbumBottomView.h"

@protocol LYAlbumViewDelegate;
@interface LYAlbumView : UIView<PSTCollectionViewDataSource,PSTCollectionViewDelegate>

@property (nonatomic, strong) PSTCollectionView *mediaCollectionView;
@property (nonatomic, strong) LYAlbumBottomView *bottomView;
@property (nonatomic, strong) NSMutableArray *albumItemsArray;
@property (nonatomic, strong) NSMutableArray *selectItemsArray;

@property (nonatomic, weak) id <LYAlbumViewDelegate>delegate;

- (void)reloadData;

@end



@interface AlbumItem : NSObject

@property (nonatomic, strong) ALAsset *albumAsset;
@property (nonatomic, assign) BOOL isSelected;

- (id)initWithAsset:(ALAsset *)asset;

@end



@protocol LYAlbumViewDelegate <NSObject>

- (void)albumViewDidUpSwipe:(LYAlbumView *)albumView;

@end
