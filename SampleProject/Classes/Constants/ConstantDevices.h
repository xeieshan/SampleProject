//
//  ConstantDevices.h
//  SampleProject
//
//  Created by <#Project Developer#> on 19/10/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#ifndef ConstantDevices_h
#define ConstantDevices_h

// Screen type
#define IS_RETINA_SCREEN()                          (MAIN_SCREEN.scale > 1.0)

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


// Device informations
#define DEVICE_MODEL                                [CURRENT_DEVICE model]
#define DEVICE_LOCALIZED_MODEL                      [CURRENT_DEVICE localizedModel]
#define DEVICE_PLATFORM                             [CURRENT_DEVICE platform]
#define DEVICE_SYSTEM_NAME                          [CURRENT_DEVICE systemName]
#define DEVICE_SYSTEM_VERSION                       [CURRENT_DEVICE systemVersion]

// System version
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)              ([[CURRENT_DEVICE systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_IS_IOS4_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"4.0")
#define SYSTEM_VERSION_IS_IOS5_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")
#define SYSTEM_VERSION_IS_IOS6_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
#define SYSTEM_VERSION_IS_IOS7_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define SYSTEM_VERSION_IS_IOS8_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
#define SYSTEM_VERSION_IS_IOS9_OR_GREATER()                     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")

// Device screen specifications / interface idiom

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) // iPhone and       iPod touch style UI

//IOS Versions

#define IS_IOS_6 floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1

#define IS_IPHONE_5_IOS7 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6_IOS7 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6P_IOS7 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)
#define IS_IPHONE_4_AND_OLDER_IOS7 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0f)
#define IS_IPHONE_4_OR_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height <= 568.0f)
#define IS_IPHONE_4_OR_5_OR_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height <= 667.0f)
#define IS_IPHONE_4_OR_5_OR_6_OR_6P (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height <= 736.0f)
#define IS_IPHONE_5_IOS8 (IS_IPHONE && ([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) == 568.0f)
#define IS_IPHONE_6_IOS8 (IS_IPHONE && ([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) == 667.0f)
#define IS_IPHONE_6P_IOS8 (IS_IPHONE && ([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) == 736.0f)
#define IS_IPHONE_4_AND_OLDER_IOS8 (IS_IPHONE && ([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) < 568.0f)

// System version
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[CURRENT_DEVICE systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_IS_IOS4_OR_GREATER()          SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"4.0")
#define SYSTEM_VERSION_IS_IOS5_OR_GREATER()          SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")
#define SYSTEM_VERSION_IS_IOS6_OR_GREATER()          SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
#define SYSTEM_VERSION_IS_IOS7_OR_GREATER()          SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define IS_IOS6_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define IS_IOS7_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define IS_IOS8_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#endif /* ConstantDevices_h */
