//
//  UIConfiguration.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//


#define debugClearBackground [UIColor clearColor]
#define debugClearBackground2 [UIColor clearColor]
#define cellSeparatorHeight 2
#define METERS_PER_MILE 1609.344
#define WhiteColor [UIColor whiteColor]

#define kCollectionCellBorderTop 12.0
#define kCollectionCellBorderBottom 12.0
#define kCollectionCellBorderLeft 12.0
#define kCollectionCellBorderRight 12.0

#define kCollectionCellContentOriginX 7.0
#define kCollectionCellImageTitlePaddingY 16.0
#define kCollectionCellTitleDescriptionPaddingY kCollectionCellContentOriginX
#define kCollectionCellDescriptionSeperatorPaddingY kCollectionCellContentOriginX
#define kCollectionCellSeperatorCurrentLevelPaddingY kCollectionCellContentOriginX
#define kCollectionCellCurrentLevelNextCouponPaddingY 0
#define kCollectionCellNextCouponButtonCouponPaddingY kCollectionCellContentOriginX

#define kCollectionCellCurrentLevelNextCouponPaddingXRight IS_IPHONE_5 ? 64.0 : 85.0
#define kCollectionCellCurrentLevelNextCouponWidth  70.0//(IS_IPAD) ? 80.0 :
#define kCollectionCellQuantityWidth 50.0
#define kCollectionCellCurrentButtonCouponWidth [UIImage imageNamed:@"CollectionCell_Coupon"].size.width

#define IPHONE5_FRAME CGRectMake(0, 0, 320, 568)
#define IPHONE4_FRAME CGRectMake(0, 0, 320, 480)

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define kCollectionViewBackground [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1]

//for viewBack 		0
#define MainNavBackColor [UIColor colorWithRed:0.18 green:0.2 blue:0.24 alpha:1]
#define MainSideMenu [UIColor colorWithRed:243./255. green:152./255. blue:1./255. alpha:1.]
#define MainNavBackNewsListColor [UIColor whiteColor]//[UIColor colorWithRed:233./255. green:233./255. blue:233./255. alpha:1.]
#define MainBackColor [UIColor colorWithRed:242./255. green:244./255. blue:235./255. alpha:1.]
#define AdditionalBackColor [UIColor colorWithRed:187./255. green:191./255. blue:179./255. alpha:1.]
#define MainNavTitleColor [UIColor colorWithRed:61./255. green:79./255. blue:90./255. alpha:1.]

#define kColor_Actionsheet [UIColor colorWithRed:49./255. green:45./255. blue:33./255. alpha:1.]

//for black color
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define grayColor [UIColor grayColor]
// White Color
#define ColorWhite [UIColor whiteColor]

// Black Color
#define ColorBlack [UIColor blackColor]

// Purple Color
#define ColorPurple [UIColor colorWithRed:236./255. green:0./255. blue:147./255. alpha:1.]

// Dark Text Color
#define ColorDarkText [UIColor colorWithRed:98./255. green:98./255. blue:98./255. alpha:1.]

// Dark Background Color
#define ColorDarkBackground [UIColor colorWithRed:20./255. green:20./255. blue:20./255. alpha:1.]

// Section Header Bg Color
#define ColorSectionHeaderBG [UIColor colorWithRed:118.0/255.0 green:118.0/255.0 blue:118.0/255.0 alpha:1.0]

// Sunny Color
#define ColorSunny [UIColor colorWithRed:246./255. green:122./255. blue:22./255. alpha:1.]

// Contrast Color
#define ColorContrast [UIColor colorWithRed:35./255. green:35./255. blue:35./255. alpha:1.]

// Ocean Color
#define ColorOcean [UIColor colorWithRed:8./255. green:34./255. blue:61./255. alpha:1.]

// Pop Color
#define ColorPop [UIColor colorWithRed:208./255. green:0 blue:2./255. alpha:1.]

// Red Blue Color
#define ColorRedBlue [UIColor colorWithRed:37./255. green:183./255. blue:238./255. alpha:1.]

// Pink Lady Color
#define ColorPinkLady [UIColor colorWithRed:166./255. green:0 blue:72./255. alpha:1.]

//Gold Color
#define ColorGold [UIColor colorWithRed:216./255. green:171./255 blue:39./255. alpha:1.]

// Red Color
#define ColorRed [UIColor redColor]

// Green Color
#define ColorGreen [UIColor greenColor]

// Clear Color
#define ColorClear [UIColor clearColor]

// Light Gray Color
#define ColorLightGray [UIColor lightGrayColor]

#define ColorWithRGBAlpha(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define appColor [UIColor colorWithRed:85./255. green:105./255. blue:73./255. alpha:1.]

#define menuColor [UIColor colorWithRed:60./255. green:78./255. blue:89./255. alpha:1.]
#define menuSeperatorColor [UIColor colorWithRed:42./255. green:121./255. blue:172./255. alpha:1.]
//for placeHolder text color
#define kPlaceholderColor [UIColor colorWithRed:61./255. green:61./255. blue:61./255. alpha:1.]

#define LightTextColor [UIColor colorWithRed:157./255. green:157./255. blue:157./255. alpha:1.]
#define VeryLightTextColor [UIColor colorWithRed:157./255. green:157./255. blue:157./255. alpha:0.4]


//for cell selected
#define HighlightedColor [UIColor colorWithRed:232./255. green:236./255. blue:223./255. alpha:1.]


//redcolor
#define RedColor [UIColor colorWithRed:232./255. green:121./255. blue:86./255. alpha:1.]

//yellowcolor
#define YellowColor [UIColor colorWithRed:255./255. green:233./255. blue:79./255. alpha:1.]

//Profile Title Color
#define ColorProfileTitle [UIColor colorWithRed:41./255. green:183./255. blue:117./255. alpha:1.]

//Profile Email Color
#define BadgeColor [UIColor colorWithRed:240./255. green:58./255. blue:62./255. alpha:1.]


static NSString *const KPlaceholderImage = @"brand-placeholder";
//Font Names
static NSString *const kFontRegularName = @"Constantia";
static NSString *const kFontBoldName = @"Constantia-Bold";
static NSString *const kFontItalicName = @"Constantia-Italic";
static NSString *const kFontBoldItalicName = @"Constantia-BoldItalic";




#define kFontHelveticaNeue_Bold(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Bold" size:(theFontSize)]
#define kFontHelveticaNeue(theFontSize) [UIFont fontWithName:@"HelveticaNeue" size:(theFontSize)]
#define kFontHelveticaNeue_Regular(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Regular" size:(theFontSize)]

#define fontNormal(theFontSize) [UIFont fontWithName:@"HelveticaNeue" size:(theFontSize)]


#define fontRegular(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Regular" size:(theFontSize)]
#define fontLight(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Light" size:(theFontSize)]

#define fontLight12 [UIFont fontWithName:@"HelveticaNeue-Light" size:12]
#define fontLight13 [UIFont fontWithName:@"HelveticaNeue-Light" size:13]
#define fontLight14 [UIFont fontWithName:@"HelveticaNeue-Light" size:14]
#define fontLight15 [UIFont fontWithName:@"HelveticaNeue-Light" size:15]
#define kSetFont(_name_, _size_) ((UIFont*)[UIFont fontWithName:(NSString*)(_name_)size:(CGFloat)(_size_)])

// UIImage from Image Name
#define UIImageFromName(imageName) [UIImage imageNamed:imageName]


// Placeholder image
#define PlaceHolderImage [UIImage imageNamed:KPlaceholderImage]




#define fontBold10 [UIFont fontWithName:kFontBoldName size:10]
#define fontBold12 [UIFont fontWithName:kFontBoldName size:12]
#define fontBold13 [UIFont fontWithName:kFontBoldName size:13]
#define fontBold14 [UIFont fontWithName:kFontBoldName size:14]
#define fontBold15 [UIFont fontWithName:kFontBoldName size:15]
#define fontBold16 [UIFont fontWithName:kFontBoldName size:16]
#define fontBold18 [UIFont fontWithName:kFontBoldName size:18]
#define fontBold20 [UIFont fontWithName:kFontBoldName size:20]
#define fontBold21 [UIFont fontWithName:kFontBoldName size:21]
#define fontBold22 [UIFont fontWithName:kFontBoldName size:22]
#define fontBold24 [UIFont fontWithName:kFontBoldName size:24]

#define fontLight10 [UIFont fontWithName:@"HelveticaNeue-Light" size:10]
#define fontLight12 [UIFont fontWithName:@"HelveticaNeue-Light" size:12]
#define fontLight13 [UIFont fontWithName:@"HelveticaNeue-Light" size:13]
#define fontLight14 [UIFont fontWithName:@"HelveticaNeue-Light" size:14]
#define fontLight15 [UIFont fontWithName:@"HelveticaNeue-Light" size:15]
#define fontLight17 [UIFont fontWithName:@"HelveticaNeue-Light" size:17]

#define HELVETICANEUE_BOLD(theFontSize) [UIFont fontWithName:kFontBoldName size:(theFontSize)]
#define HELVETICANEUE(theFontSize) [UIFont fontWithName:@"HelveticaNeue" size:(theFontSize)]
#define HELVETICANEUE_REGULAR(theFontSize) [UIFont fontWithName:kFontRegularName size:(theFontSize)]

#define UIFONTSYSTEM_REGULAR(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Regular" size:(theFontSize)]
#define UIFONTSYSTEM_SEMIBOLD(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Semibold" size:(theFontSize)]
#define UIFONTSYSTEM_BOLD(theFontSize) [UIFont fontWithName:@"HelveticaNeue-Bold" size:(theFontSize)]

#define UIFONTSYSTEM_LIGHT(theFontSize) [UIFont fontWithName:UIFONTAPP size:(theFontSize)]

#define UIFONTAPP @"HelveticaNeue"
#define UIFONTAPPBOLD @"HelveticaNeue-Bold"
#define UIFONTAPPITALIC @"HelveticaNeue-Italic"

//#define UIFONTSYSTEM_REGULAR(theFontSize) [UIFont fontWithName:@"NeoSans" size:(theFontSize)]
#define NEOSANS_LIGHT(theFontSize) [UIFont fontWithName:@"NeoSans-Light" size:(theFontSize)]

#define kCollectionCellTitleFont [UIFont systemFontOfSize:IS_IPAD?15:13]
#define kCollectionCellDescriptionFont [UIFont systemFontOfSize:IS_IPAD?15:13]
#define kCollectionCellLevelCouponFont [UIFont systemFontOfSize:IS_IPAD?15:IS_IPHONE_5 ? 8:9]
#define kCollectionCellGameTypeFont [UIFont systemFontOfSize:IS_IPAD?15:13]//IS_IPHONE_5 ? UIFONTSYSTEM_REGULAR(12) : UIFONTSYSTEM_REGULAR(13)

#define kCollectionCellTitleColor [UIColor colorWithRed:0./255. green:0./255. blue:0./255. alpha:1.]
#define kCollectionCellDescriptionColor [UIColor colorWithRed:152./255. green:152./255. blue:152./255. alpha:1.]
#define kCollectionCellGameTypeColor [UIColor colorWithRed:0./255. green:0./255. blue:0./255. alpha:1.]
#define kCollectionCellLevelCouponColor [UIColor colorWithRed:72./255. green:72./255. blue:72./255. alpha:1.]
#define kCollectionCellQuantityColor kCollectionCellLevelCouponColor
#define kCollectionCellEndingInColor [UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1]
#define kCollectionCellToQualifyColor [UIColor colorWithRed:0.37 green:0.37 blue:0.37 alpha:1]
#define kCollectionCellBonusPrizeColor kCollectionCellLevelCouponColor
#define kCollectionCellPlaysColor [UIColor colorWithRed:0.63 green:0.63 blue:0.63 alpha:1]

#define SETFONT(_name_, _size_) ((UIFont *)[UIFont fontWithName:(NSString *)(_name_) size:(CGFloat)(_size_)]) //Unused currently


#define NavBarBackImage [UIImage imageNamed:@"NavBack"]
#define NavBarMenuImage [UIImage imageNamed:@"Nav_Menu"]
#define NavBarTickImage [UIImage imageNamed:@"Nav_Tick"]
#define NavBarPinPlusImage [UIImage imageNamed:@"M_PinTypeAddress"]
#define NavBarNotificationImage [UIImage imageNamed:@"Nav_Notification"]
#define NavBarNotificationBarredImage [UIImage imageNamed:@"Nav_Notification_Barred"]
#define NavBarLogoutImage [UIImage imageNamed:@"Nav_Logout"]
#define NavBarPlusImage [UIImage imageNamed:@"Nav_Plus"]
#define NavBarAlertImage [UIImage imageNamed:@"Nav-Alert"]
#define NavBarDirectionImage [UIImage imageNamed:@"Nav-Direction"]

#define NavBarNextImage [UIImage imageNamed:@"next_btn_normal.png"]
#define NavBarOptionImage [UIImage imageNamed:@"menuOption.png"]
#define NavBarAddImage [UIImage imageNamed:@"add_new.png"]
#define NavBarShareImage [UIImage imageNamed:@"share_black.png"]
#define NavBarDoneImage [UIImage imageNamed:@"done_btn.png"]
#define NavBarSettingImage [UIImage imageNamed:@"settings_grey_icon.png"]
#define NavBarMessagesImage [UIImage imageNamed:@"alert_icon.png"]

#define NavBarNewsList [UIImage imageNamed:@"NavigationBar-NewsList.png"]

#define BACKGROUND_IMAGE [UIImage imageNamed:@"bg_image.png"]
#define IMAGE_DROPDOWN_DOB [UIImage imageNamed:@"dob_dropdown.png"]
#define IMAGE_DROPDOWN_LOCATION [UIImage imageNamed:@"location_dropdown.png"]

#define IMAGE_PLACEHOLDER_CATEGORY_GALLERY [UIImage imageNamed:@"Newslist_place_holder.png"]
#define IMAGE_PLACEHOLDER_NEWSLIST_CELL [UIImage imageNamed:@"NewslistCell_place_holder.png"]
#define IMAGE_PLACEHOLDER_NEWSDETAIL [UIImage imageNamed:@"Newsdetail_place_holder.png"]

#define IMAGE_INACTIVE_PAGE [UIImage imageNamed:@"Selected-Page.png"]
#define IMAGE_ACTIVE_PAGE [UIImage imageNamed:@"Selected-Page.png"]
//Messages

#define IMAGE_APPLOGO [UIImage imageNamed:@"AppLogo"]
#define IMAGE_LEFT_PATTERN [UIImage imageNamed:@"LeftPatternMenu"]

#define kSeperator_Image @"seprator.png"
#define kSelected_Background_Color [UIColor colorWithRed:24./255. green:24./255. blue:24./255. alpha:1.];

#define BookingRoundedViewBorder [UIColor colorWithRed:204./255. green:204./255. blue:204./255. alpha:1.]

#define IMAGE_HUD_TICK [UIImage imageNamed:@"Success"]
#define IMAGE_HUD_CROSS [UIImage imageNamed:@"Fail"]

