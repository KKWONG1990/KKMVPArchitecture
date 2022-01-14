//
//  KKPresenter.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "KKMVPPresenter.h"
@implementation KKMVPPresenter

- (instancetype)init {
    self = [super init];
    if (self) {
        [self presenter_didInitialization];
    }
    return self;
}

- (void)presenter_didInitialization {
    
}

- (void)presenter_viewDidLoad {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}

- (void)presenter_viewWillAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}

- (void)presenter_viewDidAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}

- (void)presenter_viewWillDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}

- (void)presenter_viewDidDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}

- (void)presenter_attachDelegate:(id)delegate {
    if (DEBUG) {
        NSLog(@"%@ Extute %s and delegate is %@",self.class, __func__, delegate);
    }
}

- (void)presenter_unattachDelegate {
    if (DEBUG) {
        NSLog(@"%@ Extute %s",self.class, __func__);
    }
}
@end
