//
//  MOMatchedSubstrings.m
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOMatchedSubstrings.h"


NSString *const kMOMatchedSubstringsOffset = @"offset";
NSString *const kMOMatchedSubstringsLength = @"length";


@interface MOMatchedSubstrings ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOMatchedSubstrings

@synthesize offset = _offset;
@synthesize length = _length;


+ (MOMatchedSubstrings *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOMatchedSubstrings *instance = [[MOMatchedSubstrings alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.offset = [[self objectOrNilForKey:kMOMatchedSubstringsOffset fromDictionary:dict] doubleValue];
            self.length = [[self objectOrNilForKey:kMOMatchedSubstringsLength fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.offset] forKey:kMOMatchedSubstringsOffset];
    [mutableDict setValue:[NSNumber numberWithDouble:self.length] forKey:kMOMatchedSubstringsLength];

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

    self.offset = [aDecoder decodeDoubleForKey:kMOMatchedSubstringsOffset];
    self.length = [aDecoder decodeDoubleForKey:kMOMatchedSubstringsLength];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_offset forKey:kMOMatchedSubstringsOffset];
    [aCoder encodeDouble:_length forKey:kMOMatchedSubstringsLength];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOMatchedSubstrings *copy = [[MOMatchedSubstrings alloc] init];
    
    if (copy) {

        copy.offset = self.offset;
        copy.length = self.length;
    }
    
    return copy;
}


@end
