//
//  MOAddressComponents.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOAddressComponents.h"


NSString *const kMOAddressComponentsShortName = @"short_name";
NSString *const kMOAddressComponentsLongName = @"long_name";
NSString *const kMOAddressComponentsTypes = @"types";


@interface MOAddressComponents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOAddressComponents

@synthesize shortName = _shortName;
@synthesize longName = _longName;
@synthesize types = _types;


+ (MOAddressComponents *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOAddressComponents *instance = [[MOAddressComponents alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.shortName = [self objectOrNilForKey:kMOAddressComponentsShortName fromDictionary:dict];
            self.longName = [self objectOrNilForKey:kMOAddressComponentsLongName fromDictionary:dict];
            self.types = [self objectOrNilForKey:kMOAddressComponentsTypes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.shortName forKey:kMOAddressComponentsShortName];
    [mutableDict setValue:self.longName forKey:kMOAddressComponentsLongName];
NSMutableArray *tempArrayForTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.types) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:@"kMOAddressComponentsTypes"];

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

    self.shortName = [aDecoder decodeObjectForKey:kMOAddressComponentsShortName];
    self.longName = [aDecoder decodeObjectForKey:kMOAddressComponentsLongName];
    self.types = [aDecoder decodeObjectForKey:kMOAddressComponentsTypes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_shortName forKey:kMOAddressComponentsShortName];
    [aCoder encodeObject:_longName forKey:kMOAddressComponentsLongName];
    [aCoder encodeObject:_types forKey:kMOAddressComponentsTypes];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOAddressComponents *copy = [[MOAddressComponents alloc] init];
    
    if (copy) {

        copy.shortName = [self.shortName copyWithZone:zone];
        copy.longName = [self.longName copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
    }
    
    return copy;
}


@end
