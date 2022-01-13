//
//  UIViewController+KKMVP.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <UIKit/UIKit.h>
#import "KKContext.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (KKMVP)

/// MVP架构视图控制器初始化方法
/// @param context 上下文
- (instancetype)initWithContext:(__kindof KKContext *)context;

/// 视图控制器后初始化设置 - 重写需要调用super
/// @param context KKContext
- (void)mvp_didInitialization:(__kindof KKContext *)context NS_REQUIRES_SUPER;

- (void)mvp_setupUI;

/// 上下文
@property (nonatomic, strong) KKContext * context;

@end

NS_ASSUME_NONNULL_END
