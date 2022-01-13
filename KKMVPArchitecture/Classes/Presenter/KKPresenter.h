//
//  KKPresenter.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <Foundation/Foundation.h>
#import "KKContract.h"
#import "KKCommonTableviewProvider.h"
#import "KKCommonCollectionViewProvider.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKPresenter : NSObject<KKContractPresentaion>

/// 服务请求
@property (nonatomic, strong) NSObject * service;

/// 跳转路由
@property (nonatomic, strong) NSObject * router;

/// 表格视图代理数据源
@property (nonatomic, strong) KKCommonTableviewProvider * tableViewProvider;

/// collectionView代理数据源
@property (nonatomic, strong) KKCommonCollectionViewProvider * collectionViewProvider;

@end

NS_ASSUME_NONNULL_END
