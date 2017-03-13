//
//  MOGeometry.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOGeometry.h"
#import "MOViewport.h"
#import "MOBounds.h"
#import "MOLocation.h"


NSString *const kMOGeometryLocationType = @"location_type";
NSString *const kMOGeometryViewport = @"viewport";
NSString *const kMOGeometryBounds = @"bounds";
NSString *const kMOGeometryLocation = @"location";


@interface MOGeometry ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOGeometry

@synthesize locationType = _locationType;
@synthesize viewport = _viewport;
@synthesize bounds = _bounds;
@synthesize location = _location;


+ (MOGeometry *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOGeometry *instance = [[MOGeometry alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.locationType = [self objectOrNilForKey:kMOGeometryLocationType fromDictionary:dict];
            self.viewport = [MOViewport modelObjectWithDictionary:[dict objectForKey:kMOGeometryViewport]];
            self.bounds = [MOBounds modelObjectWithDictionary:[dict objectForKey:kMOGeometryBounds]];
            self.location = [MOLocation modelObjectWithDictionary:[dict objectForKey:kMOGeometryLocation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.locationType forKey:kMOGeometryLocationType];
    [mutableDict setValue:[self.viewport dictionaryRepresentation] forKey:kMOGeometryViewport];
    [mutableDict setValue:[self.bounds dictionaryRepresentation] forKey:kMOGeometryBounds];
    [mutableDict setValue:[self.location dictionaryRepresentation] forKey:kMOGeometryLocation];

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

    self.locationType = [aDecoder decodeObjectForKey:kMOGeometryLocationType];
    self.viewport = [aDecoder decodeObjectForKey:kMOGeometryViewport];
    self.bounds = [aDecoder decodeObjectForKey:kMOGeometryBounds];
    self.location = [aDecoder decodeObjectForKey:kMOGeometryLocation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_locationType forKey:kMOGeometryLocationType];
    [aCoder encodeObject:_viewport forKey:kMOGeometryViewport];
    [aCoder encodeObject:_bounds forKey:kMOGeometryBounds];
    [aCoder encodeObject:_location forKey:kMOGeometryLocation];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOGeometry *copy = [[MOGeometry alloc] init];
    
    if (copy) {

        copy.locationType = [self.locationType copyWithZone:zone];
        copy.viewport = [self.viewport copyWithZone:zone];
        copy.bounds = [self.bounds copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
    }
    
    return copy;
}


@end
