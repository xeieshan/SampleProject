//
//  Constants.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//Necessary Macros
#define SquareDimension ((IS_IPAD)?600:310)

#define ViewHeight (((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))?130:70)

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//Log

#ifndef ALog
#define ALog(fmt, ...)                                                               \
    {                                                                                \
        NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
    };
#endif

#ifdef DEBUG
#ifndef DLog
#define DLog(fmt, ...)                                                               \
    {                                                                                \
        NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
    }
#endif
#ifndef ELog
#define ELog(err)            \
    {                        \
        if (err)             \
            DLog(@"%@", err) \
    }
#endif
#else
#ifndef DLog
#define DLog(...)
#endif
#ifndef ELog
#define ELog(err)
#endif
#endif

//Assert

#if !defined(D_BLOCK_ASSERTIONS)
#define D_BLOCK_ASSERTIONS 0
#endif

#if !D_BLOCK_ASSERTIONS

#define DAssert(expression, ...)                                                                                                                                                                                                            \
    do {                                                                                                                                                                                                                                    \
        if (!(expression)) {                                                                                                                                                                                                                \
            NSString* description = [NSString stringWithFormat:@"" __VA_ARGS__];                                                                                                                                                           \
            NSString* reason = [NSString stringWithFormat:@"Assertion failed with expression (%s) in %@:%i %s. %@", #expression, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, description]; \
            NSLog(@"Description: %@", description);                                                                                                                                                                                         \
            NSLog(@"Reason: %@", reason);                                                                                                                                                                                                   \
            [[NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil] raise];                                                                                                                            \
            abort();                                                                                                                                                                                                                        \
        }                                                                                                                                                                                                                                   \
    } while (0)

#define DCAssert(expression, ...)                                                                                                                                                                                                           \
    do {                                                                                                                                                                                                                                    \
        if (!(expression)) {                                                                                                                                                                                                                \
            NSString* description = [NSString stringWithFormat:@"" __VA_ARGS__];                                                                                                                                                           \
            NSString* reason = [NSString stringWithFormat:@"Assertion failed with expression (%s) in %@:%i %s. %@", #expression, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, description]; \
            NSLog(@"Description: %@", description);                                                                                                                                                                                         \
            NSLog(@"Reason: %@", reason);                                                                                                                                                                                                   \
            [[NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil] raise];                                                                                                                            \
            abort();                                                                                                                                                                                                                        \
        }                                                                                                                                                                                                                                   \
    } while (0)

#define DParameterAssert(condition) DAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#else
#define DAssert(condition, desc, ...)
#define DCAssert(condition, desc, ...)
#define DParameterAssert(condition)
#endif

//API
#define kHTTP_PostMethod @"POST"
#define kHTTP_GetMethod @"GET"
#define k_CONNECTIVITY_URL @"www.google.com"



//IPHONE Versions



#define CACHE_IMAGES_PATH @"cachedImages"

//Null Check

#define IsNull(x) ((x == nil) || ([x isKindOfClass:[NSNull class]]))

//Validations

#define kValidate_Numeric @"0123456789"
#define kValidate_AlphaNumeric @"0123456789"

#define kLastSyncDate [[NSUserDefaults standardUserDefaults] objectForKey:@"LastSyncDate"]
#define kSetLastSyncDate(param) [[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"LastSyncDate"]
#define kNSSycronize [[NSUserDefaults standardUserDefaults] synchronize];

//Social
static NSString* const kClientID =
    @"1085693423970-r8itnpdu9djaic2f0s6aeuvnihoisbrn.apps.googleusercontent.com";
#define FACEBOOK_APPID @"1422725397966767"
#define FACEBOOK_APPSECRET @"3043c7971561a62425f17f5a37983df4"
#define TWITTER_CONSUMER_KEY @"SqWdUTfx04kQupNIdbV3w"
#define TWITTER_CONSUMER_SECRET @"bw6ffilWgooYwBUIKV4FiuCdoKg9HTsks9bjgb83rRo"

#define SetNSUserDefault(_object_, _key_) [[NSUserDefaults standardUserDefaults] setObject:_object_ forKey:_key_]
#define GetNSUserDefault(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]
#define SyncroniseNSUserDefault [[NSUserDefaults standardUserDefaults] synchronize]

//NSUserDefaults
#define IsLoggedIn [[NSUserDefaults standardUserDefaults] objectForKey:@"IsLoggedIn"]
#define SetIsLoggedIn(param)                                                       \
    [[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"IsLoggedIn"]; \
    NSSycronize;
#define tNetToken [[NSUserDefaults standardUserDefaults] objectForKey:@"tNetToken"]
#define SetTNetToken(param)                                                       \
    [[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"tNetToken"]; \
    NSSycronize;
#define NSSycronize [[NSUserDefaults standardUserDefaults] synchronize];
#define DEVICE_TOKEN IsNull([[NSUserDefaults standardUserDefaults] objectForKey:@"KEY_DEVICE_TOKEN"]) ? DEVICE_TOKEN_EXAMPLE : [[NSUserDefaults standardUserDefaults] objectForKey:@"KEY_DEVICE_TOKEN"]
#define SetKeyDeviceToken(param)                                                       \
[[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"KEY_DEVICE_TOKEN"]; \
NSSycronize;

#define credUserName [[NSUserDefaults standardUserDefaults] objectForKey:@"credUserName"]
#define SetCredUserName(param)                                                       \
[[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"credUserName"]; \
NSSycronize;

#define credUserPassword [[NSUserDefaults standardUserDefaults] objectForKey:@"credUserPassword"]
#define SetCredUserPassword(param)                                                       \
[[NSUserDefaults standardUserDefaults] setObject:(param)forKey:@"credUserPassword"]; \
NSSycronize;

#pragma mark - FaceBook Account Constants

#define kFaceBook_APPID @"905510219492561"//@"1399280053679500"//@"1422725397966767"
#define kFaceBookUserInfoURL [NSURL URLWithString:@"https://graph.facebook.com/me"]
#define kFaceBookPermissions @[@"email", @"user_friends", @"public_profile"]
#define kMSGUserDisabledAPPInSettings @"You can enable SampleProject to access Facebook from Settings"
#define kUnknownFacebookError @"Unknown Facebook Error"


#define kCellPadding 11.0f
#define kCellImagePaddingY 6.0f
#define kPointsForOpeningUrl 1
#define kPointsForAdSmashInAdBreakPreview 5
#define kPointsFor4PiecesIn2Sec 3
#define kPointsFor4PiecesIn2SecTime 5
#define kTimeForAdSmashInAdBreakPreview 10
#define kPieceDownloadTimeOut 50

#define ButtonY [[NSUserDefaults standardUserDefaults] floatForKey:@"ButtonY"]
#define SetButtonY(param) [[NSUserDefaults standardUserDefaults] setFloat:(param)  forKey:@"ButtonY"]; NSSycronize;
#endif
