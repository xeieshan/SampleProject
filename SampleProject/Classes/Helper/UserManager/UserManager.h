//
//  UserManager.h
//  SampleProject
//
//  Created by <#Project Developer#> on 30/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//
//#import "MOLoggedUser.h"

#ifndef NO_USER_MANAGER
#define NO_USER_MANAGER
#endif

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MOLoggedUser;

@interface UserManager : NSObject

/* --- User --- */

+ (NSObject<MOLoggedUser> *)currentUser;

+ (void)setCurrentUser:(NSObject<MOLoggedUser> *)newCurrentUser;

+ (void)saveCurrentUser;

+ (void)logOutUserAndClearToken;

+ (BOOL)isLoggedIn; //Checks for presence of currentUser && token

+ (void)setToken:(NSString * __nullable)token;

+ (NSString * __nullable)token;

+ (NSString *)getAppBuildNumber;
+ (NSString *)getAppVersionNumber;

//Deprecated Methods:

+ (void)logOutCurrentUser __deprecated_msg("Use -(void)logOutUserAndClearToken instead");

@end

NS_ASSUME_NONNULL_END
