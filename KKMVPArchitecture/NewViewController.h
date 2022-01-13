//
//  NewViewController.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <UIKit/UIKit.h>
#import "KKContract.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewViewController : UIViewController<KKContractInterface>

@property (nonatomic, strong) UITableView * tableView;

@end

NS_ASSUME_NONNULL_END
