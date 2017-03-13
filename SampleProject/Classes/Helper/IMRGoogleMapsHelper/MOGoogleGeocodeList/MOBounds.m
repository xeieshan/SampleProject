//
//  MOBounds.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOBounds.h"
#import "MONortheast.h"
#import "MOSouthwest.h"


NSString *const kMOBoundsNortheast = @"northeast";
NSString *const kMOBoundsSouthwest = @"southwest";


@interface MOBounds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOBounds

@synthesize northeast = _northeast;
@synthesize southwest = _southwest;


+ (MOBounds *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOBounds *instance = [[MOBounds alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.northeast = [MONortheast modelObjectWithDictionary:[dict objectForKey:kMOBoundsNortheast]];
            self.southwest = [MOSouthwest modelObjectWithDictionary:[dict objectForKey:kMOBoundsSouthwest]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.northeast dictionaryRepresentation] forKey:kMOBoundsNortheast];
    [mutableDict setValue:[self.southwest dictionaryRepresentation] forKey:kMOBoundsSouthwest];

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

    self.northeast = [aDecoder decodeObjectForKey:kMOBoundsNortheast];
    self.southwest = [aDecoder decodeObjectForKey:kMOBoundsSouthwest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_northeast forKey:kMOBoundsNortheast];
    [aCoder encodeObject:_southwest forKey:kMOBoundsSouthwest];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOBounds *copy = [[MOBounds alloc] init];
    
    if (copy) {

        copy.northeast = [self.northeast copyWithZone:zone];
        copy.southwest = [self.southwest copyWithZone:zone];
    }
    
    return copy;
}


@end
