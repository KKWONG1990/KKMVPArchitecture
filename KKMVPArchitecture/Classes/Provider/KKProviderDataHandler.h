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

/// 从datasource里获取分区的行数
/// @param section 分区
/// @param datasource 数据源
- (NSInteger)numberOfRowsInSection:(NSInteger)section datasource:(NSArray<NSDictionary<NSString *, NSArray *> *> *)datasource;

/// 从datasource里获取行的数据
/// @param indexPath NSIndexPath
/// @param datasource 数据源
- (id)cellDataForRowAtIndexPath:(NSIndexPath *)indexPath datasource:(NSArray<NSDictionary<NSString *, NSArray *> *> *)datasource;

@end

NS_ASSUME_NONNULL_END
