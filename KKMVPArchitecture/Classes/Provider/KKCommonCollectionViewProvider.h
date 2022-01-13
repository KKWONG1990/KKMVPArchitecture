//
//  KKCommonCollectionViewProvider.h
//  EasyCare
//
//  Created by BYMac on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKProviderDataHandler.h"
@class KKCommonCollectionViewProvider;
NS_ASSUME_NONNULL_BEGIN

/*
继承该类实现子类化自定义表格视图数据源
如果数据源时约定字典数组
可以不需要重写numberOfSectionsInTableView和numberOfRowsInSection
*/

@interface KKCommonCollectionViewProvider : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>
/// 初始化表格视图数据者
/// @param collectionView UICollectionView
/// @param layout UICollectionViewFlowLayout
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout;

/// CollectionViewProvider已经初始化 - 子类重写
/// @param collectionView UICollectionView
/// @param layout UICollectionViewFlowLayout
- (void)didInitCollectionViewProvider:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout NS_REQUIRES_SUPER;

/// UICollectionView
@property (nonatomic, strong) UICollectionView * collectionView;

/// UICollectionViewFlowLayout
@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

/// 数据源
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray *> *> * datasource;

@end

NS_ASSUME_NONNULL_END
