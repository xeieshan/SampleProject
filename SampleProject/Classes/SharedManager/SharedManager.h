//
//  SharedManager.h
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface SharedManager : NSObject
{
    SharedManager *singleton;
}

+ (id)sharedManager;

@property (nonatomic,assign) NSInteger highlightedButtonIndex;
@property (nonatomic,assign) NSInteger pointSystemEvery3rdLevel;
@property (nonatomic,assign) NSInteger pointSystemEvery3rdLevelTime;

@property (nonatomic,assign) NSInteger currentCashCount;
@property (nonatomic,assign) NSInteger currentGiftCount;
//@property (nonatomic,assign) NSInteger currentCouponCount;


@end
