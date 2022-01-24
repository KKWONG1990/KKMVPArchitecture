//
//  KKPresenter.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <Foundation/Foundation.h>
#import "KKMVPPresentation.h"
#import "KKCommonTableViewProvider.h"
#import "KKCommonCollectionViewProvider.h"
NS_ASSUME_NONNULL_BEGIN

/*
 由开发者继承该类实现子类化去做相关业务逻辑
 */

@interface KKMVPPresenter : NSObject<KKMVPPresentation>

/// presenter已经初始化，重写调用super，可在此做一些初始化操作
- (void)presenter_didInitialization NS_REQUIRES_SUPER;

/// 服务请求
@property (nonatomic, strong) NSObject * service;

/// 跳转路由
@property (nonatomic, strong) NSObject * router;

/// 表格视图代理数据源
@property (nonatomic, strong) KKCommonTableViewProvider * tableProvider;

/// collectionView代理数据源
@property (nonatomic, strong) KKCommonCollectionViewProvider * collectionProvider;

@end

NS_ASSUME_NONNULL_END
