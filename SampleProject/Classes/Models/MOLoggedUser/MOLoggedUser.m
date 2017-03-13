//
//  MOLoggedUser.m
//
//  Created by <#Project Developer#> on 18/11/2015
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "MOLoggedUser.h"


NSString *const kMOLoggedUserGuid = @"Guid";
NSString *const kMOLoggedUserEmailVerified = @"EmailVerified";
NSString *const kMOLoggedUserCellNumber = @"CellNumber";
NSString *const kMOLoggedUserCity = @"City";
NSString *const kMOLoggedUserCellVerified = @"CellVerified";
NSString *const kMOLoggedUserEmailAddress = @"EmailAddress";
NSString *const kMOLoggedUserID = @"ID";
NSString *const kMOLoggedUserFirstName = @"FirstName";
NSString *const kMOLoggedUserAddress = @"Address";
NSString *const kMOLoggedUserGender = @"Gender";
NSString *const kMOLoggedUserIsActive = @"IsActive";
NSString *const kMOLoggedUserLastName = @"LastName";
NSString *const kMOLoggedUserApprovalStatus = @"ApprovalStatus";


@interface MOLoggedUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MOLoggedUser

@synthesize guid = _guid;
@synthesize emailVerified = _emailVerified;
@synthesize cellNumber = _cellNumber;
@synthesize city = _city;
@synthesize cellVerified = _cellVerified;
@synthesize emailAddress = _emailAddress;
@synthesize iDProperty = _iDProperty;
@synthesize firstName = _firstName;
@synthesize address = _address;
@synthesize gender = _gender;
@synthesize isActive = _isActive;
@synthesize lastName = _lastName;
@synthesize approvalStatus = _approvalStatus;


+ (MOLoggedUser *)modelObjectWithDictionary:(NSDictionary *)dict
{
    MOLoggedUser *instance = [[MOLoggedUser alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.guid = [self objectOrNilForKey:kMOLoggedUserGuid fromDictionary:dict];
            self.emailVerified = [[self objectOrNilForKey:kMOLoggedUserEmailVerified fromDictionary:dict] boolValue];
            self.cellNumber = [self objectOrNilForKey:kMOLoggedUserCellNumber fromDictionary:dict];
            self.city = [self objectOrNilForKey:kMOLoggedUserCity fromDictionary:dict];
            self.cellVerified = [[self objectOrNilForKey:kMOLoggedUserCellVerified fromDictionary:dict] boolValue];
            self.emailAddress = [self objectOrNilForKey:kMOLoggedUserEmailAddress fromDictionary:dict];
            self.iDProperty = [self objectOrNilForKey:kMOLoggedUserID fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kMOLoggedUserFirstName fromDictionary:dict];
            self.address = [self objectOrNilForKey:kMOLoggedUserAddress fromDictionary:dict];
            self.gender = [[self objectOrNilForKey:kMOLoggedUserGender fromDictionary:dict] boolValue];
            self.isActive = [[self objectOrNilForKey:kMOLoggedUserIsActive fromDictionary:dict] boolValue];
            self.lastName = [self objectOrNilForKey:kMOLoggedUserLastName fromDictionary:dict];
            self.approvalStatus = [self objectOrNilForKey:kMOLoggedUserApprovalStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.guid forKey:kMOLoggedUserGuid];
    [mutableDict setValue:[NSNumber numberWithBool:self.emailVerified] forKey:kMOLoggedUserEmailVerified];
    [mutableDict setValue:self.cellNumber forKey:kMOLoggedUserCellNumber];
    [mutableDict setValue:self.city forKey:kMOLoggedUserCity];
    [mutableDict setValue:[NSNumber numberWithBool:self.cellVerified] forKey:kMOLoggedUserCellVerified];
    [mutableDict setValue:self.emailAddress forKey:kMOLoggedUserEmailAddress];
    [mutableDict setValue:self.iDProperty forKey:kMOLoggedUserID];
    [mutableDict setValue:self.firstName forKey:kMOLoggedUserFirstName];
    [mutableDict setValue:self.address forKey:kMOLoggedUserAddress];
    [mutableDict setValue:[NSNumber numberWithBool:self.gender] forKey:kMOLoggedUserGender];
    [mutableDict setValue:[NSNumber numberWithBool:self.isActive] forKey:kMOLoggedUserIsActive];
    [mutableDict setValue:self.lastName forKey:kMOLoggedUserLastName];
    [mutableDict setValue:self.approvalStatus forKey:kMOLoggedUserApprovalStatus];

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

    self.guid = [aDecoder decodeObjectForKey:kMOLoggedUserGuid];
    self.emailVerified = [aDecoder decodeBoolForKey:kMOLoggedUserEmailVerified];
    self.cellNumber = [aDecoder decodeObjectForKey:kMOLoggedUserCellNumber];
    self.city = [aDecoder decodeObjectForKey:kMOLoggedUserCity];
    self.cellVerified = [aDecoder decodeBoolForKey:kMOLoggedUserCellVerified];
    self.emailAddress = [aDecoder decodeObjectForKey:kMOLoggedUserEmailAddress];
    self.iDProperty = [aDecoder decodeObjectForKey:kMOLoggedUserID];
    self.firstName = [aDecoder decodeObjectForKey:kMOLoggedUserFirstName];
    self.address = [aDecoder decodeObjectForKey:kMOLoggedUserAddress];
    self.gender = [aDecoder decodeBoolForKey:kMOLoggedUserGender];
    self.isActive = [aDecoder decodeBoolForKey:kMOLoggedUserIsActive];
    self.lastName = [aDecoder decodeObjectForKey:kMOLoggedUserLastName];
    self.approvalStatus = [aDecoder decodeObjectForKey:kMOLoggedUserApprovalStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_guid forKey:kMOLoggedUserGuid];
    [aCoder encodeBool:_emailVerified forKey:kMOLoggedUserEmailVerified];
    [aCoder encodeObject:_cellNumber forKey:kMOLoggedUserCellNumber];
    [aCoder encodeObject:_city forKey:kMOLoggedUserCity];
    [aCoder encodeBool:_cellVerified forKey:kMOLoggedUserCellVerified];
    [aCoder encodeObject:_emailAddress forKey:kMOLoggedUserEmailAddress];
    [aCoder encodeObject:_iDProperty forKey:kMOLoggedUserID];
    [aCoder encodeObject:_firstName forKey:kMOLoggedUserFirstName];
    [aCoder encodeObject:_address forKey:kMOLoggedUserAddress];
    [aCoder encodeBool:_gender forKey:kMOLoggedUserGender];
    [aCoder encodeBool:_isActive forKey:kMOLoggedUserIsActive];
    [aCoder encodeObject:_lastName forKey:kMOLoggedUserLastName];
    [aCoder encodeObject:_approvalStatus forKey:kMOLoggedUserApprovalStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    MOLoggedUser *copy = [[MOLoggedUser alloc] init];
    
    if (copy) {

        copy.guid = [self.guid copyWithZone:zone];
        copy.emailVerified = self.emailVerified;
        copy.cellNumber = [self.cellNumber copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.cellVerified = self.cellVerified;
        copy.emailAddress = [self.emailAddress copyWithZone:zone];
        copy.iDProperty = [self.iDProperty copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.gender = self.gender;
        copy.isActive = self.isActive;
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.approvalStatus = [self.approvalStatus copyWithZone:zone];;
    }
    
    return copy;
}


@end
