//
//  MOPredictions.h
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOPredictions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *reference;
@property (nonatomic, strong) NSString *predictionsIdentifier;
@property (nonatomic, strong) NSArray *types;
@property (nonatomic, strong) NSArray *matchedSubstrings;
@property (nonatomic, strong) NSString *placeId;
@property (nonatomic, strong) NSString *predictionsDescription;
@property (nonatomic, strong) NSArray *terms;
@property (nonatomic,retain) NSString *latitude;
@property (nonatomic,retain) NSString *longitude;

+ (MOPredictions *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
