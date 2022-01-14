//
//  KKCommonTableviewProvider.h
//  EasyCare
//
//  Created by BYMac on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKProviderDataHandler.h"
@class KKCommonTableViewProvider;
NS_ASSUME_NONNULL_BEGIN

/*
 继承该类实现子类化自定义表格视图数据源
 如果数据源时约定字典数组
 可以不需要重写numberOfSectionsInTableView和numberOfRowsInSection
 */

@protocol KKCommonTableViewProviderDelegate <NSObject>
@optional

/// CellForRowAtIndexPath方法内部执行的代理方法 - 提供给外部设置数据
/// @param provider KKCommonTableViewProvider
/// @param cell UITableViewCell
/// @param indexPath NSIndexPath
- (void)tableViewProvider:(KKCommonTableViewProvider *)provider cell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

/// 选中UITableViewCell代理方法 - 提高给外部做业务处理
/// @param provider KKCommonTableViewProvider
/// @param indexPath NSIndexPath
- (void)tableViewProvider:(KKCommonTableViewProvider *)provider didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/// 设置行高
/// @param provider KKCommonTableViewProvider
/// @param indexPath NSIndexPath
- (CGFloat)tableViewProvider:(KKCommonTableViewProvider *)provider heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface KKCommonTableViewProvider : NSObject<UITableViewDelegate, UITableViewDataSource>

/// 初始化表格视图数据者并指定一个表格视图和代理
/// @param tableView UITableView
- (instancetype)initWithTableView:(UITableView *)tableView;

/// TableViewProvider已经初始化 - 子类重写
/// @param tableView UITableView
- (void)provider_didInitTableViewProvider:(UITableView *)tableView NS_REQUIRES_SUPER;

/// 表格视图
@property (nonatomic, strong, readonly) UITableView * tableView;

/// 数组字典数据源
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSArray *> *> * datasource;

/// 代理
@property (nonatomic, weak) id<KKCommonTableViewProviderDelegate> delegate;

/// 指定一个cellClass - 内部会执行cell注册
@property (nonatomic, strong) Class cellClass;

@property (nonatomic, strong, readonly) KKProviderDataHandler * handler;
@end


NS_ASSUME_NONNULL_END
