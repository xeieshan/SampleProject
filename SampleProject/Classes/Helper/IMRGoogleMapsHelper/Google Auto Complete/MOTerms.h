//
//  MOTerms.h
//
//  Created by <#Project Developer#> on 9/13/15
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOTerms : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *value;
@property (nonatomic, assign) double offset;

+ (MOTerms *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
