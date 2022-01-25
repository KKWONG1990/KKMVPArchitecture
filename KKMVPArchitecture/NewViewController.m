//
//  NewViewController.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "NewViewController.h"
#import "UIViewController+KKMVP.h"
#import "KKCommonTableViewProvider.h"
@interface NewViewController ()
@end

@implementation NewViewController
- (void)mvp_didInitialization:(id<KKMVPContextInterface>)context {
    [super mvp_didInitialization:context];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.cyanColor];
}

- (void)mvp_setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    KKCommonTableViewProvider * provider = [[KKCommonTableViewProvider alloc] initWithTableView:self.tableView];
//    provider.cellClass = UITableViewCell.class;
    [self.view addSubview:self.tableView];
    self.context.presenter.tableProvider = provider;
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)mvp_reloadData {
    NSLog(@"刷新数据aaa");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

@end
