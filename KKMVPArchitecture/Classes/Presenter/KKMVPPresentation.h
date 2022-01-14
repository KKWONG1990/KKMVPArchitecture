//
//  KKMVPPresentation.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KKMVPPresentation <NSObject>
@optional

/// 视图加载完毕
- (void)presenter_viewDidLoad;

/// 视图即将显示
/// @param animated animated
- (void)presenter_viewWillAppear:(BOOL)animated;

/// 视图已经显示
/// @param animated animated
- (void)presenter_viewDidAppear:(BOOL)animated;

/// 视图即将消失
/// @param animated animated
- (void)presenter_viewWillDisappear:(BOOL)animated;

/// 视图已经显示
/// @param animated animated
- (void)presenter_viewDidDisappear:(BOOL)animated;

/// 绑定代理
/// @param delegate 代理
- (void)presenter_attachDelegate:(id)delegate;

/// 解绑代理
- (void)presenter_unattachDelegate;
@end

NS_ASSUME_NONNULL_END
