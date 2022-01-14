//
//  KKContext.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "KKMVPContext.h"

//#import "KKCommonTableviewProvider.h"
@implementation KKMVPContext

- (instancetype)init {
    self = [super init];
    if (self) {
        [self context_initializationSetup];
    }
    return self;
}

- (void)context_initializationSetup {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
}

- (void)context_viewDidLoad {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_viewDidLoad];
}

- (void)context_viewWillAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_viewWillAppear:animated];
}

- (void)context_viewDidAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_viewDidAppear:animated];
}

- (void)context_viewWillDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_viewDidDisappear:animated];
}

-  (void)context_viewDidDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_viewDidDisappear:animated];
}

- (void)context_attachDelegate:(id)delegate {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_attachDelegate:delegate];
}

- (void)context_unattachDelegate {
    if (DEBUG) {
        NSLog(@"%@ excute %s", self.class, __func__);
    }
    [self.presenter presenter_unattachDelegate];
}

- (void)dealloc {
    [self context_unattachDelegate];
    NSLog(@"%@ was dealloc", self.class);
}

- (KKNewPresenter *)presenter {
    if (!_presenter) {
        _presenter = [[KKNewPresenter alloc] init];
    }
    return _presenter;
}




@end
