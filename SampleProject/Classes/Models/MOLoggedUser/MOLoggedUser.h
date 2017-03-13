//
//  MOLoggedUser.h
//
//  Created by <#Project Developer#> on 18/11/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MOLoggedUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * guid;
@property (nonatomic, assign) BOOL emailVerified;
@property (nonatomic, strong) NSString *cellNumber;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, assign) BOOL cellVerified;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString * iDProperty;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString * address;
@property (nonatomic, assign) BOOL gender;
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString * approvalStatus;

+ (MOLoggedUser *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
