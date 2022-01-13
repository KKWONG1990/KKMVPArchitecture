//
//  KKContextInterface.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KKContextInterface <NSObject>
@optional
/// 初始化设置
- (void)context_initializationSetup;

/// 视图加载完毕
- (void)context_viewDidLoad;

/// 视图即将显示
/// @param animated animated
- (void)context_viewWillAppear:(BOOL)animated;

/// 视图已经显示
/// @param animated animated
- (void)context_viewDidAppear:(BOOL)animated;

/// 视图即将消失
/// @param animated animated
- (void)context_viewWillDisappear:(BOOL)animated;

/// 视图已经显示
/// @param animated animated
- (void)context_viewDidDisappear:(BOOL)animated;

/// 绑定代理
/// @param delegate 代理
- (void)context_attachDelegate:(id)delegate;

/// 解绑代理
- (void)context_unattachDelegate;
@end

NS_ASSUME_NONNULL_END
