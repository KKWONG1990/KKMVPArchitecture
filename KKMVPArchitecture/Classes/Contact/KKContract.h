//
//  KKContract.h
//  KKMVPArchitecture
//
//  Created by BYMac on 2022/1/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KKContract <NSObject>

@end

@protocol KKContractInterface <NSObject>

//- (void)mvp_setupUI;
//
//
- (void)mvp_reloadData;

@end

@protocol KKContractPresentaion <NSObject>


- (void)attachDelegate:(id<KKContractInterface>)delegate;
- (void)unattachDelegate;



- (void)doRequest;

@end

NS_ASSUME_NONNULL_END
