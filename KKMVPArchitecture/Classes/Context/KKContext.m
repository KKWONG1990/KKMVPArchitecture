//
//  KKContext.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "KKContext.h"

//#import "KKCommonTableviewProvider.h"
@implementation KKContext

- (void)context_initializationSetup {
    
}

- (void)context_viewDidLoad {
    
}

- (void)context_viewWillAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"viewWillAppear");
    }
}

- (void)context_viewDidAppear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"viewDidAppear");
    }
}

- (void)context_viewWillDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"viewWillDisappear");
    }
}

-  (void)context_viewDidDisappear:(BOOL)animated {
    if (DEBUG) {
        NSLog(@"viewDidDisappear");
    }
}

- (void)context_attachDelegate:(id)delegate {
    if (self.presenter) {
        [self.presenter attachDelegate:delegate];
    }
}

- (void)context_unattachDelegate {
    if (self.presenter) {
        [self.presenter unattachDelegate];
    }
}

- (void)dealloc {
    [self context_unattachDelegate];
    NSLog(@"%@ was dealloc", self.class);
}

- (KKPresenter *)presenter {
    if (_presenter) {
        _presenter = [[KKPresenter alloc] init];
    }
    return _presenter;
}




@end
