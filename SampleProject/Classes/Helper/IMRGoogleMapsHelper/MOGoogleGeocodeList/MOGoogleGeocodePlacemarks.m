//
//  MOGoogleGeocodePlacemarks.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOGoogleGeocodePlacemarks.h"
#import "MOAddressComponents.h"
#import "MOGeometry.h"


NSString *const kMOGoogleGeocodePlacemarksFormattedAddress = @"formatted_address";
NSString *const kMOGoogleGeocodePlacemarksAddressComponents = @"address_components";
NSString *const kMOGoogleGeocodePlacemarksGeometry = @"geometry";
NSString *const kMOGoogleGeocodePlacemarksPlaceId = @"place_id";
NSString *const kMOGoogleGeocodePlacemarksTypes = @"types";


@interface MOGoogleGeocodePlacemarks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOGoogleGeocodePlacemarks

@synthesize formattedAddress = _formattedAddress;
@synthesize addressComponents = _addressComponents;
@synthesize geometry = _geometry;
@synthesize placeId = _placeId;
@synthesize types = _types;


+ (MOGoogleGeocodePlacemarks *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOGoogleGeocodePlacemarks *instance = [[MOGoogleGeocodePlacemarks alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.formattedAddress = [self objectOrNilForKey:kMOGoogleGeocodePlacemarksFormattedAddress fromDictionary:dict];
    NSObject *receivedMOAddressComponents = [dict objectForKey:kMOGoogleGeocodePlacemarksAddressComponents];
    NSMutableArray *parsedMOAddressComponents = [NSMutableArray array];
    if ([receivedMOAddressComponents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMOAddressComponents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMOAddressComponents addObject:[MOAddressComponents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMOAddressComponents isKindOfClass:[NSDictionary class]]) {
       [parsedMOAddressComponents addObject:[MOAddressComponents modelObjectWithDictionary:(NSDictionary *)receivedMOAddressComponents]];
    }

    self.addressComponents = [NSArray arrayWithArray:parsedMOAddressComponents];
            self.geometry = [MOGeometry modelObjectWithDictionary:[dict objectForKey:kMOGoogleGeocodePlacemarksGeometry]];
            self.placeId = [self objectOrNilForKey:kMOGoogleGeocodePlacemarksPlaceId fromDictionary:dict];
            self.types = [self objectOrNilForKey:kMOGoogleGeocodePlacemarksTypes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.formattedAddress forKey:kMOGoogleGeocodePlacemarksFormattedAddress];
NSMutableArray *tempArrayForAddressComponents = [NSMutableArray array];
    for (NSObject *subArrayObject in self.addressComponents) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAddressComponents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAddressComponents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAddressComponents] forKey:@"kMOGoogleGeocodePlacemarksAddressComponents"];
    [mutableDict setValue:[self.geometry dictionaryRepresentation] forKey:kMOGoogleGeocodePlacemarksGeometry];
    [mutableDict setValue:self.placeId forKey:kMOGoogleGeocodePlacemarksPlaceId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:@"kMOGoogleGeocodePlacemarksTypes"];

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

    self.formattedAddress = [aDecoder decodeObjectForKey:kMOGoogleGeocodePlacemarksFormattedAddress];
    self.addressComponents = [aDecoder decodeObjectForKey:kMOGoogleGeocodePlacemarksAddressComponents];
    self.geometry = [aDecoder decodeObjectForKey:kMOGoogleGeocodePlacemarksGeometry];
    self.placeId = [aDecoder decodeObjectForKey:kMOGoogleGeocodePlacemarksPlaceId];
    self.types = [aDecoder decodeObjectForKey:kMOGoogleGeocodePlacemarksTypes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_formattedAddress forKey:kMOGoogleGeocodePlacemarksFormattedAddress];
    [aCoder encodeObject:_addressComponents forKey:kMOGoogleGeocodePlacemarksAddressComponents];
    [aCoder encodeObject:_geometry forKey:kMOGoogleGeocodePlacemarksGeometry];
    [aCoder encodeObject:_placeId forKey:kMOGoogleGeocodePlacemarksPlaceId];
    [aCoder encodeObject:_types forKey:kMOGoogleGeocodePlacemarksTypes];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOGoogleGeocodePlacemarks *copy = [[MOGoogleGeocodePlacemarks alloc] init];
    
    if (copy) {

        copy.formattedAddress = [self.formattedAddress copyWithZone:zone];
        copy.addressComponents = [self.addressComponents copyWithZone:zone];
        copy.geometry = [self.geometry copyWithZone:zone];
        copy.placeId = [self.placeId copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
    }
    
    return copy;
}


@end
