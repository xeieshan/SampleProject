//
//  UITextField+Additions.h
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Additions)

- (void)setupTextIndentation:(CGFloat)indentation;
+ (void)setupTextIndentation:(CGFloat)indentation forViews:(NSArray *)views;
- (void)setupSearchView;

- (void)setupLeftViewWithImage:(UIImage *)image;

@end
