//
//  UIControl+Helpers.h
//  SampleProject
//
//  Created by <#Project Developer#> on 27/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import <objc/runtime.h>


@interface UIControl (Helpers)

typedef void (^ ControlBlock)(__weak id weakself, __weak UIControl *sender);

- (void)addBlock:(ControlBlock)block forControlEvents:(UIControlEvents)eventType selfRef:(id)sender;

- (void)addBlock:(ControlBlock)block withID:(int)ID forControlEvents:(UIControlEvents)eventType selfRef:(id)sender;

- (void)removeBlocksForControlEvents:(UIControlEvents)eventType;

- (void)removeBlockWithID:(int)ID;

@end
