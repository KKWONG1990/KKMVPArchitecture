//
//  KKContext.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKMVPContextInterface.h"
#import "KKNewPresenter.h"
NS_ASSUME_NONNULL_BEGIN

/*
 MVP架构上下文，主要是控制器(视图)和Presenter沟通的中间件
 最初的构想是通过设置不同的context给来复用控制器，控制器只做显示的作用
 其他逻辑都在Presenter里面
 
 开发者继承KKContext来实例化子Context
 
 控制器强引用Context
 Context(上下文)强引用Presenter
 Presenter弱引用视图代理(如控制器作为代理)
 */

@interface KKMVPContext : NSObject<KKMVPContextInterface>
@property (nonatomic, strong) KKNewPresenter * presenter;
- (void)context_initializationSetup NS_REQUIRES_SUPER;
@end

NS_ASSUME_NONNULL_END
