//
//  MOLocation.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOLocation.h"


NSString *const kMOLocationLat = @"lat";
NSString *const kMOLocationLng = @"lng";


@interface MOLocation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOLocation

@synthesize lat = _lat;
@synthesize lng = _lng;


+ (MOLocation *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOLocation *instance = [[MOLocation alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.lat = [[self objectOrNilForKey:kMOLocationLat fromDictionary:dict] doubleValue];
            self.lng = [[self objectOrNilForKey:kMOLocationLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kMOLocationLat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kMOLocationLng];

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

    self.lat = [aDecoder decodeDoubleForKey:kMOLocationLat];
    self.lng = [aDecoder decodeDoubleForKey:kMOLocationLng];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lat forKey:kMOLocationLat];
    [aCoder encodeDouble:_lng forKey:kMOLocationLng];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOLocation *copy = [[MOLocation alloc] init];
    
    if (copy) {

        copy.lat = self.lat;
        copy.lng = self.lng;
    }
    
    return copy;
}


@end
