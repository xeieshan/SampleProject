//
//  UITableView+Helper.h
//  SampleProject
//
//  Created by <#Project Developer#> on 12/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
// typedef returnType (^typedefName)(parameters);
typedef UITableViewCell* (^CreateTableCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^SelectTableCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
static char RowsKey, CreateCellKey, SelectCellKey;

@interface UITableView (Helper)
- (void)registerClasses:(NSArray *)classes;
- (void)registerCellsWithClasses:(NSArray *)classes;
- (void)removeCellSeparatorOffset;
- (void)removeSeperateIndicatorsForEmptyCells;

/*
 [self.tableView setNumberOfRowsInSections:@[@(1),@(1),@(1)]];
 
 [self.tableView handleCellCreationWithBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
 return nil;
 }];
 [self.tableView handleCellSelectionWithBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
 NSLog(@"did");
 }];
 */

- (void)setNumberOfRows:(NSInteger)rows;
- (void)setNumberOfRowsInSections:(NSArray *)rows;
- (void)handleCellCreationWithBlock:(CreateTableCellBlock)block;
- (void)handleCellSelectionWithBlock:(SelectTableCellBlock)block;
@end
