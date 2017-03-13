//
//  SDQDirectionsObject.h
//  SampleProject
//
//  Created by <#Project Developer#> on 19/06/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>


@interface SDQDirectionsObject : NSObject
{
    NSUserDefaults *userData;
    NSMutableArray *applications;
}
@property (nonatomic, strong) NSString *locationName;

-(void)directionsHandle:(CLLocation *)location type:(NSString *)type;

-(NSArray *)directionsApplications;

@end


/*

 About
 
 SDQDirectionsObject is an NSObject class designed to make opening other maps applications a breeze. This class is developed for our newest iOS App All Hours, please be sure to check it out!
 
 Supports
 
 Apple Maps (Obviously)
 Citymapper
 Google Maps
 Waze
 Setup
 
 Add the SDQDirectionsObject.h & SDQDirectionsObject.m files to your project. In your .h file add #import "SDQDirectionsObject.h" In your .m file add
 
 SDQDirectionsObject *directions = [[SDQDirectionsObject alloc] init];
 **iOS 9 Update**
 
 Apple has updated its security significantly in iOS 9, which means you need to declare all URL Schemers otherwise 3rd party applications will not open.
 
 To declare all scemers you must add LSApplicationQueriesSchemes in your project .plst file, like so...
 
 <key>LSApplicationQueriesSchemes</key>
 <array>
 <string>citymapper</string><br/>
 <string>comgooglemaps</string><br/>
 <string>waze</string><br/>
 </array>
 For more information on these changes see this video from WWDC 2015
 
 Installed Applications
 
 To return a list (NSArray) of the available (installed) map services on the users device simple call...
 
 [directions directionsApplications];
 
 
 Open Application
 
 To open a specifyed application call the directionsHandle. This method has two parameters - the location (CLLocation) and the type of application (NSString)
 
 [directions directionsHandle:[[CLLocation alloc] initWithLatitude:YOUR_LATITUDE_FLOAT longitude:YOUR_LONGITUDE_FLOAT] type:@"citymapper"];
 
 
 They type key accepts...
 
 citymapper - (Citymapper)
 google - (Google Maps)
 waze - (Waze Maps)
 Or, set as nil to open the native Apple Maps.
 
 
 
 Notes
 
 If a application type is passed which is not available the class will revert to Apple Maps

*/
