//
//  UIViewController+KKMVP.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "UIViewController+KKMVP.h"
#import <objc/runtime.h>
@implementation UIViewController (KKMVP)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzledMethondWithOriginSel:@selector(viewDidLoad) swizzledSel:@selector(mvp_viewDidLoad)];
        [self swizzledMethondWithOriginSel:@selector(viewWillAppear:) swizzledSel:@selector(mvp_viewWillAppear:)];
        [self swizzledMethondWithOriginSel:@selector(viewDidAppear:) swizzledSel:@selector(mvp_viewDidAppear:)];
        [self swizzledMethondWithOriginSel:@selector(viewWillDisappear:) swizzledSel:@selector(mvp_viewWillDisappear:)];
        [self swizzledMethondWithOriginSel:@selector(viewDidDisappear:) swizzledSel:@selector(mvp_viewDidDisappear:)];
    });
}

+ (void)swizzledMethondWithOriginSel:(SEL)originSel swizzledSel:(SEL)swizzledSel {
    Method originMethond = class_getInstanceMethod(self, originSel);
    Method swizzledMethond = class_getInstanceMethod(self, swizzledSel);
    BOOL didAddMethod = class_addMethod(self, originSel, method_getImplementation(swizzledMethond), method_getTypeEncoding(swizzledMethond));
    if (didAddMethod) {
        class_replaceMethod(self, swizzledSel, method_getImplementation(originMethond), method_getTypeEncoding(originMethond));
    } else {
        method_exchangeImplementations(originMethond, swizzledMethond);
    }
}

- (instancetype)initWithContext:(id<KKMVPContextInterface>)context {
    self = [self init];
    if (self) {
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        [self mvp_didInitialization:context];
    }
    return self;
}

- (void)mvp_didInitialization:(id<KKMVPContextInterface>)context {
    if (context) {
        [self setContext:context];
        //当上下文存在时，自动调用设置方法，解放开发者双手
        [self.context context_attachDelegate:self];
    }
}

- (void)mvp_viewDidLoad {
    //当上下文存在时，自动调用设置方法，解放开发者双手
    if (self.context) {
        [self.context context_viewDidLoad];
    }
    [self mvp_setupUI];
    [self mvp_viewDidLoad];
}

- (void)mvp_viewWillAppear:(BOOL)animated {
    //当上下文存在时，自动调用设置方法，解放开发者双手
    if (self.context) {
        [self.context context_viewWillAppear:animated];
    }
    [self mvp_viewWillAppear:animated];
}

- (void)mvp_viewDidAppear:(BOOL)animated {
    //当上下文存在时，自动调用设置方法，解放开发者双手
    if (self.context) {
        [self.context context_viewDidAppear:animated];
    }
    [self mvp_viewDidAppear:animated];
}

- (void)mvp_viewWillDisappear:(BOOL)animated {
    //当上下文存在时，自动调用设置方法，解放开发者双手
    if (self.context) {
        [self.context context_viewWillDisappear:animated];
    }
    [self mvp_viewWillDisappear:animated];
}

- (void)mvp_viewDidDisappear:(BOOL)animated {
    //当上下文存在时，自动调用设置方法，解放开发者双手
    if (self.context) {
        [self.context context_viewDidDisappear:animated];
    }
    [self mvp_viewDidDisappear:animated];
}

- (void)dealloc {
    NSLog(@"%@ was dealloc", self.class);
}

- (void)mvp_setupUI {
    
}

- (void)setContext:(KKMVPContext *)context {
    objc_setAssociatedObject(self, "context", context, OBJC_ASSOCIATION_RETAIN);
}

- (KKMVPContext *)context {
    return objc_getAssociatedObject(self, "context");
}

@end
