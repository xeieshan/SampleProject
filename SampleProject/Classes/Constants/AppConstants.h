//
//  AppConstants.h
//
//
//  Created by <#Project Developer#> on 08/06/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AppConstants : NSObject



#pragma mark - API Related

extern NSString *const kAPIBaseURL;
extern NSString *const kAPIForgotPasswordPath;
extern NSString *const kAPISignupPath;
extern NSString *const kAPISigninPath;
extern NSString *const kAPIUpdateProfilePath;
extern NSString *const kAPIChangePasswordPath;
extern NSString *const kAPIGetCurrenciesPath;
extern NSString *const kAPISaveSuggestiveBrandsPath;
extern NSString *const kAPIVoteSuggestiveBrandPath;
extern NSString *const kAPISaveUserLocationPath;
extern NSString *const kAPIShippmentOptionPath;
extern NSString *const kAPISaveUserCampaignsPath;
extern NSString *const kAPICreatePaymentCard;
extern NSString *const kAPIMakePaymentCardDefault;
extern NSString *const kAPIDestroyPaymentCard;
extern NSString *const kAPIMethodPost;
extern NSString *const kAPIMethodGet;
extern NSString *const kAPIMethodPut;
extern NSString *const kAppStoreID;
extern NSString *const kEmptyString;
extern NSString *const kDummyPasswordMask;
extern NSString *const kComingSoonText;



#pragma mark - Validation Messages

extern NSString *const kValidationMessageMissingInput;
extern NSString *const kValidationMessageInvalidInput;



#pragma mark - NSDates

extern NSString *const kDateFormatStandard;
extern NSString *const kDateFormatShort;
extern NSString *const kDateFormatPaymentCardExpiry;


#pragma  mark - UI

extern double const kAnimationDuration;
extern double const kcellHeightForHomeVC;
extern double const kcellHeightForCommunitySettings;
extern double const kcellHeightForCelebrityCloset;
extern double const kcellHeightForIndividualCelebrityCollection;
extern double const kcellHeightForCelebrityCollection;
extern double const kcellHeightForCelebrityOutfits;
extern double const kdeleteAnimationDuration;

#pragma mark - SearchfieldFont

extern NSString *const kSearchFieldFontName;

#pragma mark - Pagination

extern NSInteger const kPageSizeForHomePage;


extern NSString *const kUserBrandsCountKey;
extern NSInteger const kAddNewBrandsLimit;


#pragma mark - String Building

extern NSString *const kPointsFullString;
extern NSString *const kStampsFullString;
extern NSString *const kCashBackFullString;
extern NSString *const kPointsShortString;
extern NSString *const kStampsShortString;
extern NSString *const kCashBackShortString;
extern NSString *const kPaymentOptionCashOnly;
extern NSString *const kPaymentOptionCardOnly;
extern NSString *const kPaymentOptionBoth;
extern NSString *const kBaseCurrency;
extern NSString *const kSharedManagerDumpFileName;

#pragma mark - Notification


//Notifications

extern NSString *const kNotificationForCurrentCountOfMessages;
extern NSString *const kNotificationForCurrentCountOfJobs;
extern NSString *const kNotificationForUpdatingMenuItems;
extern NSString *const kNotificationForIncomingCall;
extern NSString *const kNotificationForCash;
extern NSString *const kNotificationForGift;
extern NSString *const kNotificationForConfirmingReadMessage; 
extern NSString *const kNotificationForJobDetachInJobList;    
extern NSString *const kNotificationForJobDetachNotInJobList;


#pragma mark - Validations

extern NSInteger const kPasswordRequiredLength;
extern NSInteger const kUserNameRequiredLength;
extern NSInteger const kPhoneNumberRequiredLength;
extern NSInteger const kAddressRequiredLength;
extern NSInteger const kPaymentCardNumberRequiredLength;
extern NSInteger const kPaymentCardCSVRequiredLength;
extern NSInteger const kPaymentCardExpiryLength;
extern NSInteger const kCityRequiredLength;
extern NSInteger const kZipCodeRequiredLength;
extern NSInteger const kAreaCodeRequiredLength;
extern NSInteger const kStateRequiredLength;
extern NSInteger const kCountryRequiredLength;
extern NSInteger const kAppPINRequiredLength;
extern NSInteger const kPersonalizationFormFieldRequiredLength;


#pragma mark - AlertView

extern NSString *const kLogoutMessage;
extern NSString *const kPasswordChangeAlert;
extern NSString *const kApplyRewardAlert;
extern NSString *const kEmptyBasketAlert;
extern NSString *const kBasketProductCannotBurnMessage;
extern NSString *const kBasketCollectAtStore;
extern NSString *const kBasketPaymentInPerson;
extern NSString *const kPaymentCardAlreadyExist;

#pragma  mark - BrainTree Constant

extern NSString *const kBrainTreeDemoToken;


@end
