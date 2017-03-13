//
//  UIAlertController+Helpers.m
//  SampleProject
//
//  Created by <#Project Developer#> on 11/08/2016.
//  Copyright © 2016 <#Project Developer#>. All rights reserved.
//

#import "UIAlertController+Helpers.h"
#import <objc/runtime.h>
@implementation UIAlertController (Helpers)
+ (void)tintFix {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method  = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method swizzle = class_getInstanceMethod(self, @selector(swizzledViewWillAppear:));
        method_exchangeImplementations(method, swizzle);});
}

- (void)swizzledViewWillAppear:(BOOL)animated {
    [self swizzledViewWillAppear:animated];
    for (UIView *view in self.view.subviews) {
        if (view.tintColor == self.view.tintColor) {
            //only do those that match the main view, so we don't strip the red-tint from destructive buttons.
            self.view.tintColor = MainNavBackColor;
            [view setNeedsDisplay];
        }
    }
}

@end
