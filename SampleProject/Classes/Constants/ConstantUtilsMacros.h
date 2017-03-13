//
//  ConstanttilsMacros.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

/** Utils macros **/
// Open URL
#define OPEN_URL(url)                                           [APPLICATION openURL:(url)]
#define OPEN_STRING_URL(url)                                    [APPLICATION openURL:[NSURL URLWithString:([url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding])]]
#define CALL_NUMBER(number)                                     [APPLICATION openURL:[NSURL URLWithString:[@"tel://" stringByAppendingString:[number stringByReplacingOccurrencesOfString:@" " withString:@""]]]]

// Files
#define PATH_DOCUMENTS                                          [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define PATH_LIBRARY                                            [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define PATH_PRIVATE_STORAGE                                    [[PATH_LIBRARY stringByAppendingPathComponent:@"Caches"] stringByAppendingPathComponent:@"PrivateStorage"]
#define PATH_FOR_RESOURCE(file, ext)                            (file ? [MAIN_BUNDLE pathForResource:(file) ofType:ext] : nil)
#define PATH_FOR_RESOURCE_IN_DIRECTORY(file, ext, directory)    (file ? [MAIN_BUNDLE pathForResource:(file) ofType:ext inDirectory:directory] : nil)
#define TEMPORARY_FILE_PATH                                     [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%f", [NSDate timeIntervalSinceReferenceDate]]]
#define REMOVE_ITEM_AT_PATH(path)                               [FILE_MANAGER removeItemAtPath:path error:nil]
#define FILE_EXISTS_AT_PATH(path)                               [FILE_MANAGER fileExistsAtPath:path]

// Load a nib
#define LOAD_NIB_NAMED(nibName)                                 do{[MAIN_BUNDLE loadNibNamed:nibName owner:self options:nil];}while(0)

// User interactions
#define ENABLE_USER_INTERACTIONS                                [APPLICATION endIgnoringInteractionEvents]
#define DISABLE_USER_INTERACTIONS                               [APPLICATION beginIgnoringInteractionEvents]

// Notifications
#define NOTIFICATION_CENTER_REMOVE                              [NOTIFICATION_CENTER removeObserver:self]

// Allow conversion from nil to [NSNull null]
#define nilToNSNull(value)                                      (value ? value : [NSNull null])
#define NSNullToNil(value)                                      ((id)value == [NSNull null] ? nil : value)

// Device language override
#define APPLICATION_LANGUAGES_KEY                               @"AppleLanguages"
#define OVERRIDE_APPLICATION_LANGUAGE(newLang)                  do {[USER_DEFAULTS setObject:[NSArray arrayWithObject:newLang] forKey:APPLICATION_LANGUAGES_KEY]; [USER_DEFAULTS synchronize];} while(0)
#define RESET_APPLICATION_LANGUAGE                              do {[USER_DEFAULTS removeObjectForKey:APPLICATION_LANGUAGES_KEY]; [USER_DEFAULTS synchronize];} while(0)

// List all fonts available
#define DUMP_FONT_LIST  do {\
    NSArray *familyNames = [[UIFont familyNames] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]]];\
    NSArray *fonts;\
    NSLog(@"Listing all availables fonts : ");\
    NSLog(@"-------------------------------");\
    for (NSString *familyName in familyNames)\
    {\
        NSLog(@"%@", familyName);\
        fonts = [[UIFont fontNamesForFamilyName:familyName] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]]];\
        for (NSString *fontName in fonts)\
            NSLog(@"\t\t%@", fontName);\
        NSLog(@"\n");\
    }\
    NSLog(@"-------------------------------");\
}  while(0)

#ifndef ALog
#define ALog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);};
#endif

#ifdef DEBUG
#ifndef DLog
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#endif
#ifndef ELog
#   define ELog(err) {if(err) DLog(@"%@", err)}
#endif
#else
#ifndef DLog
#   define DLog(...)
#endif
#ifndef ELog
#   define ELog(err)
#endif
#endif


//#if !defined(D_BLOCK_ASSERTIONS)
//# define D_BLOCK_ASSERTIONS 0
//#endif

//#if !D_BLOCK_ASSERTIONS

//# define DAssert(expression, ...) \
//do {\
//if (!(expression)) {	\
//NSString *description = [NSString stringWithFormat:@"" __VA_ARGS__]; \
//NSString *reason = [NSString \
//stringWithFormat: @"Assertion failed with expression (%s) in %@:%i %s. %@", \
//#expression, \
//[[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
//__LINE__, \
//__PRETTY_FUNCTION__, \
//description]; \
//NSLog(@"Description: %@", description); \
//NSLog(@"Reason: %@", reason); \
//[[NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil] raise]; \
//abort(); \
//} \
//} while(0)
//
//# define DCAssert(expression, ...) \
//do {\
//if (!(expression)) {	\
//NSString *description = [NSString stringWithFormat:@"" __VA_ARGS__]; \
//NSString *reason = [NSString \
//stringWithFormat: @"Assertion failed with expression (%s) in %@:%i %s. %@", \
//#expression, \
//[[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
//__LINE__, \
//__PRETTY_FUNCTION__, \
//description]; \
//NSLog(@"Description: %@", description); \
//NSLog(@"Reason: %@", reason); \
//[[NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil] raise]; \
//abort(); \
//} \
//} while(0)
//
//# define DParameterAssert(condition) DAssert((condition), @"Invalid parameter not satisfying: %s", #condition)
//
//#else
//# define DAssert(condition, desc, ...)
//# define DCAssert(condition, desc, ...)
//# define DParameterAssert(condition)
//#endif
