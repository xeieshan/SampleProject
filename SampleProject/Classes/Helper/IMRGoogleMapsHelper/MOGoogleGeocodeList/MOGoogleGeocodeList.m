//
//  MOGoogleGeocodeList.m
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOGoogleGeocodeList.h"
#import "MOGoogleGeocodePlacemarks.h"


NSString *const kMOGoogleGeocodeListResults = @"results";


@interface MOGoogleGeocodeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOGoogleGeocodeList

@synthesize results = _results;


+ (MOGoogleGeocodeList *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOGoogleGeocodeList *instance = [[MOGoogleGeocodeList alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedMOGoogleGeocodePlacemarks = [dict objectForKey:kMOGoogleGeocodeListResults];
    NSMutableArray *parsedMOGoogleGeocodePlacemarks = [NSMutableArray array];
    if ([receivedMOGoogleGeocodePlacemarks isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMOGoogleGeocodePlacemarks) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMOGoogleGeocodePlacemarks addObject:[MOGoogleGeocodePlacemarks modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMOGoogleGeocodePlacemarks isKindOfClass:[NSDictionary class]]) {
       [parsedMOGoogleGeocodePlacemarks addObject:[MOGoogleGeocodePlacemarks modelObjectWithDictionary:(NSDictionary *)receivedMOGoogleGeocodePlacemarks]];
    }

    self.results = [NSArray arrayWithArray:parsedMOGoogleGeocodePlacemarks];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:@"kMOGoogleGeocodeListResults"];

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

    self.results = [aDecoder decodeObjectForKey:kMOGoogleGeocodeListResults];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_results forKey:kMOGoogleGeocodeListResults];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOGoogleGeocodeList *copy = [[MOGoogleGeocodeList alloc] init];
    
    if (copy) {

        copy.results = [self.results copyWithZone:zone];
    }
    
    return copy;
}


@end
