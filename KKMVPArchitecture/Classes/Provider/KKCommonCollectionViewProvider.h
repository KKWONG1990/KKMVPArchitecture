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

@protocol KKCommonCollectionViewProviderDelegate <NSObject>
@optional

/// CellForRowAtIndexPath方法内部执行的代理方法 - 提供给外部设置数据
/// @param provider KKCommonCollectionViewProvider
/// @param cell UITableViewCell
/// @param indexPath NSIndexPath
- (void)collectionViewProvider:(KKCommonCollectionViewProvider *)provider cell:(UICollectionViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

/// 选中UITableViewCell代理方法 - 提高给外部做业务处理
/// @param provider KKCommonCollectionViewProvider
/// @param indexPath NSIndexPath
- (void)collectionViewProvider:(KKCommonCollectionViewProvider *)provider didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/// 设置item size
/// @param provider KKCommonTableViewProvider
/// @param indexPath NSIndexPath
- (CGSize)collectionViewProvider:(KKCommonCollectionViewProvider *)provider sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface KKCommonCollectionViewProvider : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>
/// 初始化表格视图数据者
/// @param collectionView UICollectionView
/// @param layout UICollectionViewFlowLayout
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout;

/// CollectionViewProvider已经初始化 - 子类重写
/// @param collectionView UICollectionView
/// @param layout UICollectionViewFlowLayout
- (void)provider_didInitCollectionViewProvider:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout NS_REQUIRES_SUPER;

/// UICollectionView
@property (nonatomic, strong) UICollectionView * collectionView;

/// UICollectionViewFlowLayout
@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

/// 数据源
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray *> *> * datasource;

/// 代理
@property (nonatomic, weak) id<KKCommonCollectionViewProviderDelegate> delegate;

/// 指定一个cellClass  - 内部会执行cell注册
@property (nonatomic, strong) Class cellClass;

@property (nonatomic, strong, readonly) KKProviderDataHandler * handler;
@end

NS_ASSUME_NONNULL_END
