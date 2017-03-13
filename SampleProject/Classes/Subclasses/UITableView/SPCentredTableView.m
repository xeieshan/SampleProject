//
//  SPCentredTableView.m
//  SampleProject
//
//  Created by <#Project Developer#> on 03/12/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import "SPCentredTableView.h"

@implementation SPCentredTableView
- (void)reloadData {
    [super reloadData];
    [self centerTableViewContentsIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self centerTableViewContentsIfNeeded];
}

- (void)centerTableViewContentsIfNeeded {
    CGFloat totalHeight = CGRectGetHeight(self.bounds);
    CGFloat contentHeight = self.contentSize.height;
    //If we have less content than our table frame then we can center
    BOOL contentCanBeCentered = contentHeight < totalHeight;
    if (contentCanBeCentered) {
        self.contentInset = UIEdgeInsetsMake(ceil(totalHeight/2.f - contentHeight/2.f), 0, 0, 0);
    } else {
        self.contentInset = UIEdgeInsetsZero;
    }
}
@end
