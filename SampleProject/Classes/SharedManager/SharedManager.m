//
//  SharedManager.m
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "SharedManager.h"

static SharedManager *sharedInstance = nil;

@implementation SharedManager

- (id) init
{
    self = [super init];
    if (self) {
    }
    return self;
}
+ (id)sharedManager
{
    static SharedManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

@end
