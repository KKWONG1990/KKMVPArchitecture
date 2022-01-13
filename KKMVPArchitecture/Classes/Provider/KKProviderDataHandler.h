//
//  KKProvider.h
//  KKMVPArchitecture
//
//  Created by KKWONG on 2022/1/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KKProviderDataHandler : NSObject

+ (NSInteger)numberOfRowsInSection:(NSInteger)section datasource:(NSArray<NSDictionary<NSString *, NSArray *> *> *)datasource;

+ (id)cellDataForRowAtIndexPath:(NSIndexPath *)indexPath datasource:(NSArray<NSDictionary<NSString *, NSArray *> *> *)datasource;

@end

NS_ASSUME_NONNULL_END
