//
//  UINavigationController+CustomCategory.m
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (Helper) <UIGestureRecognizerDelegate>

-(void)showDropMenu:(UIView *)menu animated:(BOOL)animated;

-(void)hideDroppedMenuAnimated:(BOOL)animated;

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;


- (void)pushViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)inTransition;
- (void)popViewControllerWithTransition:(UIViewAnimationTransition)inTransition;
@end
