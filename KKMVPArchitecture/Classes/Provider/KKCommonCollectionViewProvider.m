//
//  KKCommonCollectionViewProvider.m
//  EasyCare
//
//  Created by BYMac on 2021/12/14.
//

#import "KKCommonCollectionViewProvider.h"
@interface KKCommonCollectionViewProvider ()
@property (nonatomic, strong) KKProviderDataHandler * handler;
@end

@implementation KKCommonCollectionViewProvider
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout {
    [self provider_didInitCollectionViewProvider:collectionView layout:layout];
    
    return [self init];
}

- (void)provider_didInitCollectionViewProvider:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout {
    _layout = layout;
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _handler = [[KKProviderDataHandler alloc] init];
    self.cellClass = UICollectionView.class;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.datasource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.handler numberOfRowsInSection:section datasource:self.datasource];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.cellClass) forIndexPath:indexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionViewProvider:cell:forRowAtIndexPath:)]) {
        [self.delegate collectionViewProvider:self cell:cell forRowAtIndexPath:indexPath];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionViewProvider:didSelectItemAtIndexPath:)]) {
        [self.delegate collectionViewProvider:self didSelectItemAtIndexPath:indexPath];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionViewProvider:sizeForItemAtIndexPath:)]) {
        return [self.delegate collectionViewProvider:self sizeForItemAtIndexPath:indexPath];
    }
    return self.layout.itemSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.layout.sectionInset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.layout.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.layout.minimumInteritemSpacing;
}

- (void)setCellClass:(Class)cellClass {
    _cellClass = cellClass;
    if (self.collectionView) {
        [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
}


@end
