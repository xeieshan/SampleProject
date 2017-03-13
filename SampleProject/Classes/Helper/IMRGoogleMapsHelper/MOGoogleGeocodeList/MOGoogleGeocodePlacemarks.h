//
//  MOGoogleGeocodePlacemarks.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MOGeometry;

@interface MOGoogleGeocodePlacemarks : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *formattedAddress;
@property (nonatomic, strong) NSArray *addressComponents;
@property (nonatomic, strong) MOGeometry *geometry;
@property (nonatomic, strong) NSString *placeId;
@property (nonatomic, strong) NSArray *types;

+ (MOGoogleGeocodePlacemarks *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
