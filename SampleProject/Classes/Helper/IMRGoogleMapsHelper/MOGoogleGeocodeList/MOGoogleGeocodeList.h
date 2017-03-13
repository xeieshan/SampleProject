//
//  MOGoogleGeocodeList.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOGoogleGeocodeList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *results;

+ (MOGoogleGeocodeList *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
