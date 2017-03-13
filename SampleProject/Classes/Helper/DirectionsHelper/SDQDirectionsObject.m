//
//  SDQDirectionsObject.m
//  SampleProject
//
//  Created by <#Project Developer#> on 19/06/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//


#define DIRECTIONS_GOOGLE_PROTOCOL @"comgooglemaps://"
#define DIRECTIONS_CITYMAPPER_PROTOCOL @"citymapper://"
#define DIRECTIONS_WAZE_PROTOCOL @"waze://"
#define DIRECTIONS_APPLE_PROTOCOL @"http://maps.apple.com/maps?"

@implementation SDQDirectionsObject

-(void)directionsHandle:(CLLocation *)location type:(NSString *)type {
    if (type == nil) [self directionsAppleMaps:location];
    else if ([type isEqualToString:@"citymapper"]) [self directionsCitymapper:location];
    else if ([type isEqualToString:@"google"]) [self directionsGoogleMaps:location];
    else if ([type isEqualToString:@"waze"]) [self directionsWaze:location];
    else [self directionsAppleMaps:location];

}

-(void)directionsCitymapper:(CLLocation *)location {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_CITYMAPPER_PROTOCOL]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"citymapper://directions?endcoord=%f,%f&&endname=%@" ,location.coordinate.latitude ,location.coordinate.longitude ,[self.locationName stringByReplacingOccurrencesOfString:@" " withString:@"%20"]]]];
        
    }
    else [self directionsAppleMaps:location];
    
}

-(void)directionsGoogleMaps:(CLLocation *)location {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_GOOGLE_PROTOCOL]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?daddr=%f,%f&directionsmode=driving" ,location.coordinate.latitude ,location.coordinate.longitude]]];
        
    }
    else [self directionsAppleMaps:location];

}

-(void)directionsWaze:(CLLocation *)location {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_WAZE_PROTOCOL]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"waze://?%f,%f&z=10&navigate=yes" ,location.coordinate.latitude ,location.coordinate.longitude]]];
        
    }
    else [self directionsAppleMaps:location];
    
}

-(void)directionsAppleMaps:(CLLocation *)location {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=Current%%20Location&daddr=%f,%f" ,location.coordinate.latitude ,location.coordinate.longitude]]];

}


-(NSArray *)directionsApplications {
    applications = [[NSMutableArray alloc] init];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_GOOGLE_PROTOCOL]]) [applications addObject:@"google"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_APPLE_PROTOCOL]]) [applications addObject:@"apple"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_CITYMAPPER_PROTOCOL]]) [applications addObject:@"citymapper"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:DIRECTIONS_WAZE_PROTOCOL]]) [applications addObject:@"waze"];

    return applications;
}

@end
