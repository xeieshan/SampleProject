//
//  MOTerms.m
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOTerms.h"


NSString *const kMOTermsValue = @"value";
NSString *const kMOTermsOffset = @"offset";


@interface MOTerms ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOTerms

@synthesize value = _value;
@synthesize offset = _offset;


+ (MOTerms *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOTerms *instance = [[MOTerms alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.value = [self objectOrNilForKey:kMOTermsValue fromDictionary:dict];
            self.offset = [[self objectOrNilForKey:kMOTermsOffset fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.value forKey:kMOTermsValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.offset] forKey:kMOTermsOffset];

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

    self.value = [aDecoder decodeObjectForKey:kMOTermsValue];
    self.offset = [aDecoder decodeDoubleForKey:kMOTermsOffset];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value forKey:kMOTermsValue];
    [aCoder encodeDouble:_offset forKey:kMOTermsOffset];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOTerms *copy = [[MOTerms alloc] init];
    
    if (copy) {

        copy.value = [self.value copyWithZone:zone];
        copy.offset = self.offset;
    }
    
    return copy;
}


@end
