//
//  UIButton+Helpers.h
//  SampleProject
//
//  Created by <#Project Developer#> on 11/11/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Helpers)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
