//
//  KKCommonTableviewProvider.m
//  EasyCare
//
//  Created by BYMac on 2021/12/14.
//

#import "KKCommonTableViewProvider.h"
@interface KKCommonTableViewProvider ()
@property (nonatomic, strong) KKProviderDataHandler * handler;
@end
@implementation KKCommonTableViewProvider
- (instancetype)initWithTableView:(UITableView *)tableView {
    [self provider_didInitTableViewProvider:tableView];
    return [self init];
}

- (void)provider_didInitTableViewProvider:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _handler = [[KKProviderDataHandler alloc] init];
    self.cellClass = UITableViewCell.class;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.handler numberOfRowsInSection:section datasource:self.datasource];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.cellClass)];
    if (!cell) {
        cell = [[self.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.cellClass)];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewProvider:cell:forRowAtIndexPath:)]) {
        [self.delegate tableViewProvider:self cell:cell forRowAtIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewProvider:didSelectRowAtIndexPath:)]) {
        [self.delegate tableViewProvider:self didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewProvider:heightForRowAtIndexPath:)]) {
        return [self.delegate tableViewProvider:self heightForRowAtIndexPath:indexPath];
    }
    return tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([tableView.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        UIView *view = [tableView.delegate tableView:tableView viewForHeaderInSection:section];
        if (view) {
            CGFloat height = [view sizeThatFits:CGSizeMake(CGRectGetWidth(tableView.bounds), CGFLOAT_MAX)].height;
            return height;
        }
    }
    return tableView.style == UITableViewStylePlain ? 0 : 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([tableView.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        UIView *view = [tableView.delegate tableView:tableView viewForFooterInSection:section];
        if (view) {
            CGFloat height = [view sizeThatFits:CGSizeMake(CGRectGetWidth(tableView.bounds), CGFLOAT_MAX)].height;
            return height;
        }
    }
    // 分别测试过 iOS 11 前后的系统版本，最终总结，对于 Plain 类型的 tableView 而言，要去掉 header / footer 请使用 0，对于 Grouped 类型的 tableView 而言，要去掉 header / footer 请使用 CGFLOAT_MIN
    return tableView.style == UITableViewStylePlain ? 0 : 0;
}

- (void)setCellClass:(Class)cellClass {
    _cellClass = cellClass;
    if (self.tableView) {
        [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

@end
