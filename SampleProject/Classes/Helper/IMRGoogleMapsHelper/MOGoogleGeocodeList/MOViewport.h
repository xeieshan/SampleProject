//
//  MOViewport.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MONortheast, MOSouthwest;

@interface MOViewport : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MONortheast *northeast;
@property (nonatomic, strong) MOSouthwest *southwest;

+ (MOViewport *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
