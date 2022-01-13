//
//  KKPresenter.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "KKPresenter.h"
//#import "KKCommonTableviewProvider.h"
@interface KKPresenter()
@property (nonatomic, weak) id<KKContractInterface>delegate;
@end
@implementation KKPresenter


- (void)doRequest {
    NSLog(@"do request");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableViewProvider.tableView reloadData];
    });
    
}

- (void)attachDelegate:(id<KKContractInterface>)delegate {
    self.delegate = delegate;
}

- (void)unattachDelegate {
    if (self.delegate) {
        self.delegate = nil;
    }
}

@end
