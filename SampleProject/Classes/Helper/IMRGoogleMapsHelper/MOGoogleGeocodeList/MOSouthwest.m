//
//  MOSouthwest.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOSouthwest.h"


NSString *const kMOSouthwestLat = @"lat";
NSString *const kMOSouthwestLng = @"lng";


@interface MOSouthwest ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOSouthwest

@synthesize lat = _lat;
@synthesize lng = _lng;


+ (MOSouthwest *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOSouthwest *instance = [[MOSouthwest alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.lat = [[self objectOrNilForKey:kMOSouthwestLat fromDictionary:dict] doubleValue];
            self.lng = [[self objectOrNilForKey:kMOSouthwestLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kMOSouthwestLat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kMOSouthwestLng];

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

    self.lat = [aDecoder decodeDoubleForKey:kMOSouthwestLat];
    self.lng = [aDecoder decodeDoubleForKey:kMOSouthwestLng];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lat forKey:kMOSouthwestLat];
    [aCoder encodeDouble:_lng forKey:kMOSouthwestLng];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOSouthwest *copy = [[MOSouthwest alloc] init];
    
    if (copy) {

        copy.lat = self.lat;
        copy.lng = self.lng;
    }
    
    return copy;
}


@end
