//
//  ViewController.m
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import "ViewController.h"
#import "NewViewController.h"
#import "UIViewController+KKMVP.h"
#import "KKContext.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NewViewController * vc = [[NewViewController alloc] initWithContext:[KKContext new]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
