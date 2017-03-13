//
//  MOGoogleAutoCompleteList.m
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOGoogleAutoCompleteList.h"
#import "MOPredictions.h"


NSString *const kMOGoogleAutoCompleteListStatus = @"status";
NSString *const kMOGoogleAutoCompleteListPredictions = @"predictions";


@interface MOGoogleAutoCompleteList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOGoogleAutoCompleteList

@synthesize status = _status;
@synthesize predictions = _predictions;


+ (MOGoogleAutoCompleteList *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOGoogleAutoCompleteList *instance = [[MOGoogleAutoCompleteList alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kMOGoogleAutoCompleteListStatus fromDictionary:dict];
    NSObject *receivedMOPredictions = [dict objectForKey:kMOGoogleAutoCompleteListPredictions];
    NSMutableArray *parsedMOPredictions = [NSMutableArray array];
    if ([receivedMOPredictions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMOPredictions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMOPredictions addObject:[MOPredictions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMOPredictions isKindOfClass:[NSDictionary class]]) {
       [parsedMOPredictions addObject:[MOPredictions modelObjectWithDictionary:(NSDictionary *)receivedMOPredictions]];
    }

    self.predictions = [NSArray arrayWithArray:parsedMOPredictions];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kMOGoogleAutoCompleteListStatus];
NSMutableArray *tempArrayForPredictions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.predictions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPredictions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPredictions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPredictions] forKey:@"kMOGoogleAutoCompleteListPredictions"];

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

    self.status = [aDecoder decodeObjectForKey:kMOGoogleAutoCompleteListStatus];
    self.predictions = [aDecoder decodeObjectForKey:kMOGoogleAutoCompleteListPredictions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kMOGoogleAutoCompleteListStatus];
    [aCoder encodeObject:_predictions forKey:kMOGoogleAutoCompleteListPredictions];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOGoogleAutoCompleteList *copy = [[MOGoogleAutoCompleteList alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.predictions = [self.predictions copyWithZone:zone];
    }
    
    return copy;
}


@end
