//
//  MOSouthwest.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOSouthwest : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;

+ (MOSouthwest *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
