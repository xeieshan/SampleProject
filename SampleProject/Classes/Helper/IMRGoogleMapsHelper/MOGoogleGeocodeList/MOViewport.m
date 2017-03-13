//
//  MOViewport.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOViewport.h"
#import "MONortheast.h"
#import "MOSouthwest.h"


NSString *const kMOViewportNortheast = @"northeast";
NSString *const kMOViewportSouthwest = @"southwest";


@interface MOViewport ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOViewport

@synthesize northeast = _northeast;
@synthesize southwest = _southwest;


+ (MOViewport *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOViewport *instance = [[MOViewport alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.northeast = [MONortheast modelObjectWithDictionary:[dict objectForKey:kMOViewportNortheast]];
            self.southwest = [MOSouthwest modelObjectWithDictionary:[dict objectForKey:kMOViewportSouthwest]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.northeast dictionaryRepresentation] forKey:kMOViewportNortheast];
    [mutableDict setValue:[self.southwest dictionaryRepresentation] forKey:kMOViewportSouthwest];

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

    self.northeast = [aDecoder decodeObjectForKey:kMOViewportNortheast];
    self.southwest = [aDecoder decodeObjectForKey:kMOViewportSouthwest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_northeast forKey:kMOViewportNortheast];
    [aCoder encodeObject:_southwest forKey:kMOViewportSouthwest];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOViewport *copy = [[MOViewport alloc] init];
    
    if (copy) {

        copy.northeast = [self.northeast copyWithZone:zone];
        copy.southwest = [self.southwest copyWithZone:zone];
    }
    
    return copy;
}


@end
