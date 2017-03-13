//
//  UserManager.m
//  SampleProject
//
//  Created by <#Project Developer#> on 30/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import "UserManager.h"
#import "MOLoggedUser.h"

@implementation UserManager

static MOLoggedUser  *currentUser;
static NSString * const kUserType = @"user";

#pragma mark - User

+ (MOLoggedUser *)currentUser;
{
    if (currentUser) {
        return currentUser;
    }
    
    NSData *dataCurentUser = [NSData dataWithContentsOfFile:[self pathWithObjectType:kUserType]];
    if (dataCurentUser != nil) {
        @try {
            currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:dataCurentUser];
        }
        @catch (NSException *exception) {
            return nil;
        }
        @finally {
            
        }
        //DLog(@"\n\n\nCurrent user Auth-token: - %@", currentUser.api_token);
        return currentUser;
    }
    
    return nil;
}

+ (void)setCurrentUser:(MOLoggedUser *)newCurrentUser
{
    NSAssert(newCurrentUser != nil, @"Trying to set current user to nil! Use [UserManager logOutCurrentUser] instead!");
    
    currentUser = newCurrentUser;
    
    [self saveCurrentUser];
}

+ (void)saveCurrentUser
{
    if (currentUser == nil) {
        NSAssert(currentUser != nil, @"Error! Save current user: currentUser == nil!!");
        return;
    }
    
    NSString *path = [self pathWithObjectType:kUserType];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        DLog(@"Deleting previous user entry");
    }
    
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:currentUser];
    
    NSError *error = nil;
    [userData writeToFile:path options:NSDataWritingAtomic error:&error];
    
    NSAssert1(error == nil, @"currentUser save Error: %@", error.localizedDescription);
    
    DLog(@"Current user %@ saved", currentUser);
}

+ (void)logOutCurrentUser
{
    [[NSFileManager defaultManager] removeItemAtPath:[self pathWithObjectType:kUserType] error:nil];
    
    currentUser = nil;
}

+ (void)logOutUserAndClearToken
{
    [[NSFileManager defaultManager] removeItemAtPath:[self pathWithObjectType:kUserType] error:nil];
    
    currentUser = nil;
    [self setToken:nil];
}

+ (BOOL)isLoggedIn {
    return [self currentUser] != nil && [self token] != nil;
}

static NSString * const UserManagerUserToken = @"UserManagerUserToken";

+ (void)setToken:(NSString *)token {
    if ( token != nil ) {
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:UserManagerUserToken];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserManagerUserToken];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] stringForKey:UserManagerUserToken];
}


#pragma mark - Utility

+ (NSString *)pathWithObjectType:(NSString *)objectType
{
    return [NSString stringWithFormat:@"%@/%@.bin", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES)[0], objectType];
}

+ (NSString *)getAppBuildNumber{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *build = infoDictionary[(NSString*)kCFBundleVersionKey];
    return build;
    
//    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}

+ (NSString *)getAppVersionNumber{
    NSDictionary *infoDictionary        = [[NSBundle mainBundle]infoDictionary];
    
    NSString *version = infoDictionary[@"CFBundleShortVersionString"];
    return version;
    
//    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


@end
