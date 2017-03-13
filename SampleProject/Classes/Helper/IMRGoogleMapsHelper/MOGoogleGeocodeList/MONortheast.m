//
//  MONortheast.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MONortheast.h"


NSString *const kMONortheastLat = @"lat";
NSString *const kMONortheastLng = @"lng";


@interface MONortheast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MONortheast

@synthesize lat = _lat;
@synthesize lng = _lng;


+ (MONortheast *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MONortheast *instance = [[MONortheast alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.lat = [[self objectOrNilForKey:kMONortheastLat fromDictionary:dict] doubleValue];
            self.lng = [[self objectOrNilForKey:kMONortheastLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kMONortheastLat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kMONortheastLng];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.lat = [aDecoder decodeDoubleForKey:kMONortheastLat];
    self.lng = [aDecoder decodeDoubleForKey:kMONortheastLng];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lat forKey:kMONortheastLat];
    [aCoder encodeDouble:_lng forKey:kMONortheastLng];
}

- (id)copyWithZone:(NSZone *)zone
{
    MONortheast *copy = [[MONortheast alloc] init];
    
    if (copy) {

        copy.lat = self.lat;
        copy.lng = self.lng;
    }
    
    return copy;
}


@end
