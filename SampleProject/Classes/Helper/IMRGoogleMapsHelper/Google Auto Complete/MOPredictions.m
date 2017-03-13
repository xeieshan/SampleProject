//
//  MOPredictions.m
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOPredictions.h"
#import "MOMatchedSubstrings.h"
#import "MOTerms.h"


NSString *const kMOPredictionsReference = @"reference";
NSString *const kMOPredictionsId = @"id";
NSString *const kMOPredictionsTypes = @"types";
NSString *const kMOPredictionsMatchedSubstrings = @"matched_substrings";
NSString *const kMOPredictionsPlaceId = @"place_id";
NSString *const kMOPredictionsDescription = @"description";
NSString *const kMOPredictionsTerms = @"terms";


@interface MOPredictions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOPredictions

@synthesize reference = _reference;
@synthesize predictionsIdentifier = _predictionsIdentifier;
@synthesize types = _types;
@synthesize matchedSubstrings = _matchedSubstrings;
@synthesize placeId = _placeId;
@synthesize predictionsDescription = _predictionsDescription;
@synthesize terms = _terms;


+ (MOPredictions *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOPredictions *instance = [[MOPredictions alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.reference = [self objectOrNilForKey:kMOPredictionsReference fromDictionary:dict];
            self.predictionsIdentifier = [self objectOrNilForKey:kMOPredictionsId fromDictionary:dict];
            self.types = [self objectOrNilForKey:kMOPredictionsTypes fromDictionary:dict];
    NSObject *receivedMOMatchedSubstrings = [dict objectForKey:kMOPredictionsMatchedSubstrings];
    NSMutableArray *parsedMOMatchedSubstrings = [NSMutableArray array];
    if ([receivedMOMatchedSubstrings isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMOMatchedSubstrings) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMOMatchedSubstrings addObject:[MOMatchedSubstrings modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMOMatchedSubstrings isKindOfClass:[NSDictionary class]]) {
       [parsedMOMatchedSubstrings addObject:[MOMatchedSubstrings modelObjectWithDictionary:(NSDictionary *)receivedMOMatchedSubstrings]];
    }

    self.matchedSubstrings = [NSArray arrayWithArray:parsedMOMatchedSubstrings];
            self.placeId = [self objectOrNilForKey:kMOPredictionsPlaceId fromDictionary:dict];
            self.predictionsDescription = [self objectOrNilForKey:kMOPredictionsDescription fromDictionary:dict];
    NSObject *receivedMOTerms = [dict objectForKey:kMOPredictionsTerms];
    NSMutableArray *parsedMOTerms = [NSMutableArray array];
    if ([receivedMOTerms isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMOTerms) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMOTerms addObject:[MOTerms modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMOTerms isKindOfClass:[NSDictionary class]]) {
       [parsedMOTerms addObject:[MOTerms modelObjectWithDictionary:(NSDictionary *)receivedMOTerms]];
    }

    self.terms = [NSArray arrayWithArray:parsedMOTerms];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reference forKey:kMOPredictionsReference];
    [mutableDict setValue:self.predictionsIdentifier forKey:kMOPredictionsId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:@"kMOPredictionsTypes"];
NSMutableArray *tempArrayForMatchedSubstrings = [NSMutableArray array];
    for (NSObject *subArrayObject in self.matchedSubstrings) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMatchedSubstrings addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMatchedSubstrings addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMatchedSubstrings] forKey:@"kMOPredictionsMatchedSubstrings"];
    [mutableDict setValue:self.placeId forKey:kMOPredictionsPlaceId];
    [mutableDict setValue:self.predictionsDescription forKey:kMOPredictionsDescription];
NSMutableArray *tempArrayForTerms = [NSMutableArray array];
    for (NSObject *subArrayObject in self.terms) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTerms addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTerms addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTerms] forKey:@"kMOPredictionsTerms"];

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

    self.reference = [aDecoder decodeObjectForKey:kMOPredictionsReference];
    self.predictionsIdentifier = [aDecoder decodeObjectForKey:kMOPredictionsId];
    self.types = [aDecoder decodeObjectForKey:kMOPredictionsTypes];
    self.matchedSubstrings = [aDecoder decodeObjectForKey:kMOPredictionsMatchedSubstrings];
    self.placeId = [aDecoder decodeObjectForKey:kMOPredictionsPlaceId];
    self.predictionsDescription = [aDecoder decodeObjectForKey:kMOPredictionsDescription];
    self.terms = [aDecoder decodeObjectForKey:kMOPredictionsTerms];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reference forKey:kMOPredictionsReference];
    [aCoder encodeObject:_predictionsIdentifier forKey:kMOPredictionsId];
    [aCoder encodeObject:_types forKey:kMOPredictionsTypes];
    [aCoder encodeObject:_matchedSubstrings forKey:kMOPredictionsMatchedSubstrings];
    [aCoder encodeObject:_placeId forKey:kMOPredictionsPlaceId];
    [aCoder encodeObject:_predictionsDescription forKey:kMOPredictionsDescription];
    [aCoder encodeObject:_terms forKey:kMOPredictionsTerms];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOPredictions *copy = [[MOPredictions alloc] init];
    
    if (copy) {

        copy.reference = [self.reference copyWithZone:zone];
        copy.predictionsIdentifier = [self.predictionsIdentifier copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
        copy.matchedSubstrings = [self.matchedSubstrings copyWithZone:zone];
        copy.placeId = [self.placeId copyWithZone:zone];
        copy.predictionsDescription = [self.predictionsDescription copyWithZone:zone];
        copy.terms = [self.terms copyWithZone:zone];
    }
    
    return copy;
}


@end
