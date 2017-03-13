//
//  MOAddressComponents.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOAddressComponents : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *shortName;
@property (nonatomic, strong) NSString *longName;
@property (nonatomic, strong) NSArray *types;

+ (MOAddressComponents *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
