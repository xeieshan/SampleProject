//
//  AppConstants.m
//  
//
//  Created by <#Project Developer#> on 08/06/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "AppConstants.h"


@implementation AppConstants


#pragma mark - API Related

NSString *const kAPIBaseURL = @"";
NSString *const kAPIForgotPasswordPath = @"";
NSString *const kAPISignupPath = @"";
NSString *const kAPISigninPath = @"";
NSString *const kAPIUpdateProfilePath = @"";
NSString *const kAPIChangePasswordPath = @"";
NSString *const kAPIGetCurrenciesPath = @"";
NSString *const kAPISaveSuggestiveBrandsPath = @"";
NSString *const kAPIVoteSuggestiveBrandPath = @"";
NSString *const kAPISaveUserLocationPath = @"";
NSString *const kAPIShippmentOptionPath = @"";
NSString *const kAPISaveUserCampaignsPath = @"";
NSString *const kAPICreatePaymentCard = @"";
NSString *const kAPIMakePaymentCardDefault = @"";
NSString *const kAPIDestroyPaymentCard = @"";
NSString *const kAPIMethodPost = @"POST";
NSString *const kAPIMethodGet = @"GET";
NSString *const kAPIMethodPut = @"PUT";
NSString *const kAppStoreID = @"";
NSString *const kEmptyString = @"";


#pragma mark - Validation Messages

NSString *const kValidationMessageMissingInput = @"Please fill all the fields";
NSString *const kValidationMessageInvalidInput = @"Please enter valid information";



#pragma mark - NSDates

NSString *const kDateFormatStandard = @"yyyy-MM-dd HH:mm:ss.SZ";
NSString *const kDateFormatShort = @"yyyy-MM-dd";
NSString *const kDateFormatPaymentCardExpiry = @"MM/yy";


#pragma mark - UI

double const kAnimationDuration = 0.25;
double const kcellHeightForHomeVC = 84.0;
double const kcellHeightForCelebrityCloset = 138.0;
double const kcellHeightForIndividualCelebrityCollection = 132.0;
double const kcellHeightForCommunitySettings = 80.0;
double const kcellHeightForCelebrityCollection = 163.0;
double const kcellHeightForCelebrityOutfits = 383.0f;
double const kdeleteAnimationDuration = 0.12;

#pragma mark - Pagination

NSInteger const kPageSizeForHomePage = 20;


NSString *const kUserBrandsCountKey = @"UserBrandsCountKey";
NSInteger const kAddNewBrandsLimit = 10;


#pragma mark - String Building

NSString *const kPointsFullString = @"Point";
NSString *const kStampsFullString = @"Stamp";
NSString *const kCashBackFullString = @"Discount";
NSString *const kPointsShortString = @"PTS";
NSString *const kStampsShortString = @"STM";
NSString *const kCashBackShortString = @"CBD";
NSString *const kPaymentOptionCashOnly = @"cash";
NSString *const kPaymentOptionCardOnly = @"cards";
NSString *const kPaymentOptionBoth = @"cash_and_cards";
NSString *const kBaseCurrency = @"GBP";
NSString *const kSharedManagerDumpFileName = @"sharedManager.dmp";

#pragma Notification

NSString *const kNotificationForCurrentCountOfMessages = @"Point";
NSString *const kNotificationForCurrentCountOfJobs = @"Point";
NSString *const kNotificationForUpdatingMenuItems = @"Point";
NSString *const kNotificationForIncomingCall = @"Point";
NSString *const kNotificationForCash = @"Point";
NSString *const kNotificationForGift = @"Point";
NSString *const kNotificationForConfirmingReadMessage = @"Point";
NSString *const kNotificationForJobDetachInJobList = @"Point";
NSString *const kNotificationForJobDetachNotInJobList = @"Point";


#pragma mark - Validations

NSInteger const kPasswordRequiredLength = 6;
NSInteger const kUserNameRequiredLength = 4;
NSInteger const kPhoneNumberRequiredLength = 4;
NSInteger const kAddressRequiredLength = 4;
NSInteger const kPaymentCardNumberRequiredLength = 15;
NSInteger const kPaymentCardExpiryLength = 5;
NSInteger const kPaymentCardCSVRequiredLength = 3;
NSInteger const kCityRequiredLength = 2;
NSInteger const kZipCodeRequiredLength = 4;
NSInteger const kAreaCodeRequiredLength = 3;
NSInteger const kStateRequiredLength = 2;
NSInteger const kCountryRequiredLength = 2;
NSInteger const kAppPINRequiredLength = 4;
NSInteger const kPersonalizationFormFieldRequiredLength = 1;

#pragma mark - AlertView

NSString *const kLogoutMessage = @"Are you sure you want to logout?";
NSString *const kPasswordChangeAlert = @"Please enter your current password in order to change it to new one";
NSString *const kApplyRewardAlert = @"You can't perform this action on this product";
NSString *const kEmptyBasketAlert = @"Your basket is empty";
NSString *const kBasketProductCannotBurnMessage = @"This item cannot be paid by the Loyalty Card.";
NSString *const kBasketCollectAtStore = @"Collect at store";
NSString *const kBasketPaymentInPerson = @"Payment in person";
NSString *const kPaymentCardAlreadyExist = @"Card already exists.";


#pragma mark - SearchfieldFont

NSString *const kSearchFieldFontName = @"HelveticaNeue";

#pragma  mark - BrainTree Constant

NSString *const kBrainTreeDemoToken = @"==";



@end
