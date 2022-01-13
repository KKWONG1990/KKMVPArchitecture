//
//  NewViewController.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "NewViewController.h"
#import "UIViewController+KKMVP.h"
#import "KKCommonTableviewProvider.h"
@interface NewViewController ()
@end

@implementation NewViewController
- (void)mvp_didInitialization:(__kindof KKContext *)context {
    [super mvp_didInitialization:context];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.cyanColor];
}

- (void)mvp_setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    KKCommonTableviewProvider * provider = [[KKCommonTableviewProvider alloc] initWithTableView:self.tableView];
    [self.view addSubview:self.tableView];
    self.context.presenter.tableViewProvider = provider;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)mvp_reloadData {
    NSLog(@"刷新数据");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

@end
