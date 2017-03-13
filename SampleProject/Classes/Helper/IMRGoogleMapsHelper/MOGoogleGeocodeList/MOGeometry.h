//
//  MOGeometry.h
//
//  Created by <#Project Developer#> on 10/12/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MOViewport, MOBounds, MOLocation;

@interface MOGeometry : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *locationType;
@property (nonatomic, strong) MOViewport *viewport;
@property (nonatomic, strong) MOBounds *bounds;
@property (nonatomic, strong) MOLocation *location;

+ (MOGeometry *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
