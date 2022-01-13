//
//  KKProvider.m
//  KKMVPArchitecture
//
//  Created by KKWONG on 2022/1/13.
//

#import "KKProviderDataHandler.h"

@implementation KKProviderDataHandler

+ (NSInteger)numberOfRowsInSection:(NSInteger)section datasource:(NSArray<NSDictionary<NSString *,NSArray *> *> *)datasource {
    NSDictionary * dictionary = [datasource objectAtIndex:section];
    if ([dictionary.allValues.firstObject isKindOfClass:NSArray.class]) {
        NSArray * array = (NSArray *)dictionary.allValues.firstObject;
        return array.count;
    }
    return 0;
}

+ (id)cellDataForRowAtIndexPath:(NSIndexPath *)indexPath datasource:(NSArray<NSDictionary<NSString *,NSArray *> *> *)datasource {
    NSDictionary * dictionary = [datasource objectAtIndex:indexPath.section];
    if ([dictionary.allValues.firstObject isKindOfClass:NSArray.class]) {
        NSArray * array = (NSArray *)dictionary.allValues.firstObject;
        return [array objectAtIndex:indexPath.row];
    }
    return nil;
}
@end
