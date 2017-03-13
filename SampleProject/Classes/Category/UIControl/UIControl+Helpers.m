//
//  UIControl+Helpers.m
//  SampleProject
//
//  Created by <#Project Developer#> on 27/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import "UIControl+Helpers.h"

@implementation UIControl (Helpers)

static const int kControlBlockDefaultID = 199299;

- (void)addBlock:(ControlBlock)block forControlEvents:(UIControlEvents)eventType selfRef:(id)sender
{
    [self addBlock:block withID:kControlBlockDefaultID forControlEvents:eventType selfRef:sender];
}

- (void)addBlock:(ControlBlock)block withID:(int)ID forControlEvents:(UIControlEvents)eventType selfRef:(id)sender
{
    NSString *eventKey;
    
    if (eventType == UIControlEventTouchDown) {
        eventKey = @"UIControlEventTouchDown";
        [self addTarget:self action:@selector(triggerTouchDownBlocks:) forControlEvents:eventType];
    } else if (eventType == UIControlEventTouchUpInside) {
        eventKey = @"UIControlEventTouchUpInside";
        [self addTarget:self action:@selector(triggerTouchUpInsideBlocks:) forControlEvents:eventType];
    } else if (eventType == UIControlEventTouchUpOutside) {
        eventKey = @"UIControlEventTouchUpOutside";
        [self addTarget:self action:@selector(triggerTouchUpOutsideBlocks:) forControlEvents:eventType];
    } else if (eventType == UIControlEventTouchCancel) {
        eventKey = @"UIControlEventTouchCancel";
        [self addTarget:self action:@selector(triggerTouchCancelBlocks:) forControlEvents:eventType];
    } else {
        NSLog(@"UIControl+Helpers ERROR! : Blocks not supported for touch event type: %@", @(eventType));
    }
    
    NSArray *selectors = objc_getAssociatedObject(self, (__bridge const void *)(eventKey));
    if (selectors == nil) {
        selectors = [NSArray array];
    }
    
    selectors = [selectors arrayByAddingObject:block];
    
    objc_setAssociatedObject(self, (__bridge const void *)(eventKey), selectors, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, (__bridge const void *)(block), sender, OBJC_ASSOCIATION_ASSIGN);
}

- (void)triggerTouchDownBlocks:(UIControl *)sender
{
    [self fireBlocksForEventKey:@"UIControlEventTouchDown" withSender:sender];
}

- (void)triggerTouchUpInsideBlocks:(UIControl *)sender
{
    [self fireBlocksForEventKey:@"UIControlEventTouchUpInside" withSender:sender];
}

- (void)triggerTouchUpOutsideBlocks:(UIControl *)sender
{
    [self fireBlocksForEventKey:@"UIControlEventTouchUpOutside" withSender:sender];
}

- (void)triggerTouchCancelBlocks:(UIControl *)sender
{
    [self fireBlocksForEventKey:@"UIControlEventTouchCancel" withSender:sender];
}

- (void)fireBlocksForEventKey:(NSString *)eventKey withSender:(UIControl *)sender
{
    NSArray *blocks = objc_getAssociatedObject(self, (__bridge const void *)(eventKey));
    
    for (ControlBlock block in blocks) {
        __weak id weaksenderself = objc_getAssociatedObject(self, (__bridge const void *)(block));
        block(weaksenderself, sender);
    }
}

- (void)removeBlocksForControlEvents:(UIControlEvents)eventType
{
    for (NSString *selectorName in [self actionsForTarget:self forControlEvent:eventType]) {
        if ([selectorName rangeOfString:@"Blocks"].length > 0) {
            NSLog(@"UIControl+blocks: Removing %@", selectorName);
            [self removeTarget:self action:NSSelectorFromString(selectorName) forControlEvents:eventType];
        }
    }
}

- (void)removeBlockWithID:(int)ID
{
    NSArray *actions = [self actionsForTarget:self forControlEvent:UIControlEventAllTouchEvents];
    
    if (actions.count > 0) {
        
        for (NSString *selectorName in actions) {
            if ([selectorName rangeOfString:[NSString stringWithFormat:@"%iblockMethod", ID]].length > 0) {
                NSLog(@"UIControl+blocks: Removing %@", selectorName);
                [self removeTarget:self action:NSSelectorFromString(selectorName) forControlEvents:UIControlEventAllTouchEvents];
            }
        }
    }
}

@end
