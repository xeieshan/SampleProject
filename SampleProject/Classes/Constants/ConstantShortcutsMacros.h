//
//  ConstantShortcuts_All.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

// Localized string helpers
#ifndef LOCALIZED_STRING
    #define LOCALIZED_STRING(string)                NSLocalizedString(string, nil)
#else
    #pragma message("LOCALIZED_STRING already declared")
#endif

#define LANG                                        LOCALIZED_STRING(@"globals.lang")
#define LANG_DISPLAY                                LOCALIZED_STRING(@"globals.langDisplay")

// Shared instance shortcuts
#define NOTIFICATION_CENTER                         [NSNotificationCenter defaultCenter]
#define FILE_MANAGER                                [NSFileManager defaultManager]
#define MAIN_BUNDLE                                 [NSBundle mainBundle]
#define MAIN_THREAD                                 [NSThread mainThread]
#define MAIN_SCREEN                                 [UIScreen mainScreen]
#define USER_DEFAULTS                               [NSUserDefaults standardUserDefaults]
#define APPLICATION                                 [UIApplication sharedApplication]
#define CURRENT_DEVICE                              [UIDevice currentDevice]
#define MAIN_RUN_LOOP                               [NSRunLoop mainRunLoop]
#define GENERAL_PASTEBOARD                          [UIPasteboard generalPasteboard]
#define CURRENT_LANGUAGE                            [[[NSLocale preferredLanguages] objectAtIndex:0] substringToIndex:2]
// Network
#define NETWORK_ACTIVITY                            [APPLICATION networkActivityIndicatorVisible]


// Color consts
#define CLEAR_COLOR                                 [UIColor clearColor]

// Application informations
#define APPLICATION_NAME                            ([[[MAIN_BUNDLE executablePath] pathComponents] lastObject])
#define APPLICATION_VERSION                         [MAIN_BUNDLE objectForInfoDictionaryKey:@"CFBundleVersion"]

// Device informations
#define DEVICE_MODEL                                [CURRENT_DEVICE model]
#define DEVICE_LOCALIZED_MODEL                      [CURRENT_DEVICE localizedModel]
#define DEVICE_PLATFORM                             [CURRENT_DEVICE platform]
#define DEVICE_SYSTEM_NAME                          [CURRENT_DEVICE systemName]
#define DEVICE_SYSTEM_VERSION                       [CURRENT_DEVICE systemVersion]



//#define IS_IOS_6 floor (NSFoundationVersionNumber)<=NSFoundationVersionNumber_iOS_6_1

//G－C－D
#define GLOBAL(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define PERFORM_ON_MAIN_THREAD(block) dispatch_async(dispatch_get_main_queue(), block);

//String
#ifndef formatString
#define formatString(string) [NSString stringWithFormat:@"%@", string]
#endif

#define PNGPATH(NAME)          [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)          [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME,EXT)         [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:(EXT)]

#define PNGIMAGE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME,EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

#define IMAGENAMED(NAME)       [UIImage imageNamed:NAME]

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

