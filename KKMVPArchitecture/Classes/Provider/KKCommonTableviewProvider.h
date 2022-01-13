//
//  KKCommonTableviewProvider.h
//  EasyCare
//
//  Created by BYMac on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKProviderDataHandler.h"
@class KKCommonTableviewProvider;
NS_ASSUME_NONNULL_BEGIN

/*
 继承该类实现子类化自定义表格视图数据源
 如果数据源时约定字典数组
 可以不需要重写numberOfSectionsInTableView和numberOfRowsInSection
 */

@interface KKCommonTableviewProvider : NSObject<UITableViewDelegate, UITableViewDataSource>

/// 初始化表格视图数据者并指定一个表格视图和代理
/// @param tableView UITableView
- (instancetype)initWithTableView:(UITableView *)tableView;

/// TableViewProvider已经初始化 - 子类重写
/// @param tableView UITableView
- (void)didInitTableViewProvider:(UITableView *)tableView NS_REQUIRES_SUPER;

/// 表格视图
@property (nonatomic, strong, readonly) UITableView * tableView;

/// 数组字典数据源
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray *> *> * datasource;

@end


NS_ASSUME_NONNULL_END
