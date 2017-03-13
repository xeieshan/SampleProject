//
//  MOMatchedSubstrings.h
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOMatchedSubstrings : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double offset;
@property (nonatomic, assign) double length;

+ (MOMatchedSubstrings *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
