//
//  LYAlbumView.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"
#import "LYAlbumBottomView.h"

@protocol LYAlbumViewDelegate;
@interface LYAlbumView : UIView<PSTCollectionViewDataSource,PSTCollectionViewDelegate>

@property (nonatomic, strong) PSTCollectionView *mediaCollectionView;
@property (nonatomic, strong) LYAlbumBottomView *bottomView;
@property (nonatomic, strong) NSMutableArray *mediaArray;

@property (nonatomic, weak) id <LYAlbumViewDelegate>delegate;

- (void)reloadData;

@end



@protocol LYAlbumViewDelegate <NSObject>

- (void)albumView:(LYAlbumView *)albumView didUpSwipe:(UISwipeGestureRecognizer *)gesture;

@end