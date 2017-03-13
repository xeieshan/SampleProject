//
//  SPGoogleGeoCoder.m
//  SampleProject
//
//  Created by <#Project Developer#> on 09/12/2015.
//  Copyright © 2015 by <#Project Developer#> on. All rights reserved.
//

#import "SPGoogleMapsHelper.h"

@implementation SPGoogleMapsHelper
#pragma mark - sharedClient

+ (instancetype)sharedGoogleMapHelper {
    static SPGoogleMapsHelper *singleton;
    singleton = [SPGoogleMapsHelper sharedClientWithIdentifier:NSStringFromClass([self class])];
    singleton.APIKey = @""; // Obtained from Google
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self) {
//        self.requestQueue = [[NSOperationQueue alloc] init];
//        self.requestQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

- (void)geocodeAddressString:(NSString *)query components:(NSDictionary *)components completionHandler:(SPGoogleGeoCoderCompletionBlock)completion
{
    NSMutableDictionary *params = @{@"address" : query,
                                    @"sensor"  : @"true",
                                    }.mutableCopy;
    
    if ( components ) {
        __block NSString *componentsString = @"";
        
        [components enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            componentsString = [componentsString stringByAppendingString:[NSString stringWithFormat:@"&%@:%@|", key, obj]];
        }];
        
        if ( componentsString.length > 1 ) {
            componentsString = [componentsString substringToIndex:componentsString.length - 2];
        }
        
        [params setValue:componentsString forKey:@"components"];
    }
    
    [[SPGoogleMapsHelper sharedGoogleMapHelper] cancelAllRequests];
    
    [[SPGoogleMapsHelper sharedGoogleMapHelper] GET:@"http://maps.googleapis.com/maps/api/geocode/json" parameters:params completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        SPGoogleGeoCoderResponse responseCode = [SPGoogleMapsHelper responseCodeFromJSONResponse:response];
        if (responseCode == SPGoogleGeoCoderResponseOK || responseCode == SPGoogleGeoCoderResponseOKZeroResults) {
            dispatch_async(dispatch_get_main_queue(), ^{
                MOGoogleGeocodeList *geocode = [MOGoogleGeocodeList modelObjectWithDictionary:response];
                completion(geocode, responseCode, [SPGoogleMapsHelper messageStringFromResponseCode:responseCode]);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, responseCode, [SPGoogleMapsHelper messageStringFromResponseCode:responseCode]);
            });
        }
    }];
}

- (void)reverseGeocodeCoordinate:(CLLocationCoordinate2D)coordinate resultTypes:(NSArray *)resultTypes locationTypes:(NSArray *)locationTypes completionHandler:(SPGoogleGeoCoderCompletionBlock)completion
{
    NSMutableDictionary *params = @{@"latlng" : [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude]
                                    }.mutableCopy;
    
    if ( locationTypes ) {
        __block NSString *typesString = @"";
        
        [locationTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            typesString = [typesString stringByAppendingString:[NSString stringWithFormat:@"%@|", obj]];
        }];
        
        if ( typesString.length > 1 ) {
            typesString = [typesString substringToIndex:typesString.length - 1];
        }
        
        [params setValue:typesString forKey:@"location_type"];
    }
    
    if ( resultTypes ) {
        __block NSString *typesString = @"";
        
        [resultTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            typesString = [typesString stringByAppendingString:[NSString stringWithFormat:@"%@|", obj]];
        }];
        
        if ( typesString.length > 1 ) {
            typesString = [typesString substringToIndex:typesString.length - 1];
        }
        
        [params setValue:typesString forKey:@"result_type"];
    }
    
    [[SPGoogleMapsHelper sharedGoogleMapHelper] cancelAllRequests];
    [[SPGoogleMapsHelper sharedGoogleMapHelper]  GET:@"http://maps.googleapis.com/maps/api/geocode/json" parameters:params completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        SPGoogleGeoCoderResponse responseCode = [SPGoogleMapsHelper responseCodeFromJSONResponse:response];
        if (responseCode == SPGoogleGeoCoderResponseOK || responseCode == SPGoogleGeoCoderResponseOKZeroResults) {
            MOGoogleGeocodeList *googleGeoCodeList = [MOGoogleGeocodeList modelObjectWithDictionary:response];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(googleGeoCodeList, responseCode, [SPGoogleMapsHelper messageStringFromResponseCode:responseCode]);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, responseCode, [SPGoogleMapsHelper messageStringFromResponseCode:responseCode]);
            });
        }
    }];
}

- (void)getDirections:(CLLocationCoordinate2D)coordinateSource andCoordinateDestination:(CLLocationCoordinate2D)coordinateDestination  andDrawPoints:(SPGoogleDirectionsVoidBlock)drawPoints andPlaceMarks:(SPGoogleDirectionsPlaceMarksBlock)placeMarks
{
    [SVProgressHUD show];
    [[SPGoogleMapsHelper sharedGoogleMapHelper] cancelAllRequests];
    [[SPGoogleMapsHelper sharedGoogleMapHelper]  GET:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@&mode=driving",[NSString stringWithFormat:@"%f,%f", coordinateSource.latitude, coordinateSource.longitude],[NSString stringWithFormat:@"%f,%f", coordinateDestination.latitude, coordinateDestination.longitude]] parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            if ([[response utilities_objectForKeyNotNull:@"status"] isEqualToString:@"ZERO_RESULTS"])
            {
                [SVProgressHUD showErrorWithStatus:@"Failed to get directions"];
                return;
            }
            NSArray *routeArray = [response utilities_objectForKeyNotNull:@"routes"];
            
            NSMutableArray *routeSetAry = [NSMutableArray new];
            NSMutableArray *directionStrAry = [NSMutableArray new];
            NSArray *encodedPoints;
            NSMutableArray *polylineSetAry = [NSMutableArray new];
            NSMutableArray *distanceStrAry = [NSMutableArray new];
            for(int i=0;i<[routeArray count];i++)
            {
                NSDictionary *tempDictionary = [routeArray objectAtIndex:i];
                if([tempDictionary objectForKey:@"overview_polyline"]!=nil)
                {
                    NSDictionary *secTempDictionary = [tempDictionary objectForKey:@"overview_polyline"];
                    if([secTempDictionary objectForKey:@"points"]!=nil)
                    {
                        NSString * routePoint =[secTempDictionary objectForKey:@"points"];
                        
                        [routeSetAry addObject:routePoint];
                        
                        encodedPoints = [secTempDictionary objectForKey:@"points"];
                    }
                    // NSLog(@"secTempDictionary is: %@", secTempDictionary);
                }
                if([tempDictionary objectForKey:@"legs"]!=nil)
                {
                    NSArray *lagArray = [[NSArray alloc]init];
                    lagArray= [tempDictionary objectForKey:@"legs"];
                    
                    for(int i=0;i<[lagArray count];i++)
                    {
                        NSDictionary *thirdTempDictionary = [lagArray objectAtIndex:i];
                        if([thirdTempDictionary objectForKey:@"steps"]!=nil)
                        {
                            NSArray *stepsArray = [[NSArray alloc]init];
                            stepsArray= [thirdTempDictionary objectForKey:@"steps"];
                            
                            for(int i=0;i<[stepsArray count];i++)
                            {
                                NSDictionary *forthTempDictionary = [stepsArray objectAtIndex:i];
                                
                                if([forthTempDictionary objectForKey:@"html_instructions"]!=nil)
                                {
                                    NSString * directionStr =[forthTempDictionary objectForKey:@"html_instructions"];
                                    
                                    NSRange range;
                                    while ((range = [directionStr rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound){
                                        directionStr=[directionStr stringByReplacingCharactersInRange:range withString:@""];
                                    }
                                    [directionStrAry addObject:directionStr];
                                }
                                
                                NSDictionary *fifthTempDictionary = [forthTempDictionary objectForKey:@"polyline"];
                                if([fifthTempDictionary objectForKey:@"points"]!=nil)
                                {
                                    NSString * routePoint =[fifthTempDictionary objectForKey:@"points"];
                                    
                                    [polylineSetAry addObject:routePoint];
                                    
                                    // encodedPoints = [fifthTempDictionary objectForKey:@"points"];
                                }
                                NSDictionary *sixthTempDictionary =[forthTempDictionary objectForKey:@"distance"];
                                if([sixthTempDictionary objectForKey:@"text"]!=nil)
                                {
                                    NSString * distanceStr =[sixthTempDictionary objectForKey:@"text"];
                                    
                                    [distanceStrAry addObject:distanceStr];
                                    
                                    // encodedPoints = [fifthTempDictionary objectForKey:@"points"];
                                } 
                            }
                        }
                    }
                }
            }
            NSDictionary *route = [routeArray lastObject];
            if (route) {
                [self parseResponse:response andDrawPoints:drawPoints andPlaceMarks:placeMarks andPolyLineSetArray:polylineSetAry andDirectionsSetArray:directionStrAry andDistanceSetArray:distanceStrAry];
            }
        }else{
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }
    }];
}
- (void)getAutoCompleteFromGoogle:(NSString *)keyWord andAutoComplete:(SPGoogleAutoCompletionBlock)autocomplete{
    [[SPGoogleMapsHelper sharedGoogleMapHelper] cancelAllRequests];
    [[SPGoogleMapsHelper sharedGoogleMapHelper] GET:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&key=%@",[keyWord utilities_urlEncode], @""] parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        MOGoogleAutoCompleteList *autocompleteList = [MOGoogleAutoCompleteList modelObjectWithDictionary:response];
        SPGoogleGeoCoderResponse responseCode = [SPGoogleMapsHelper responseCodeFromJSONResponse:response];
        autocomplete(autocompleteList,responseCode,[SPGoogleMapsHelper messageStringFromResponseCode:responseCode]);
    }];
}

#pragma mark -
#pragma mark Private
#pragma mark -

+ (BOOL)isJSONResponseSuccessful:(id)JSON forURL:(NSURL *)url
{
    @try {
        NSString *status = [JSON objectForKey:@"status"];
        NSLog(@"Status %@", status);
        if ( [status isEqualToString:@"OK"] || [status isEqualToString:@"ZERO_RESULTS"] ) {
            return YES;
        }
        
    }
    @catch (NSException *exception) {
        return NO;
    }
    
    return NO;
}

+ (id)dataContentFromJSONResponse:(id)JSON forURL:(NSURL *)url
{
    return [JSON objectForKey:@"results"];
}

+ (SPGoogleGeoCoderResponse )responseCodeFromJSONResponse:(id)JSON
{
    NSString *status = [JSON objectForKey:@"status"];
    NSLog(@"status: %@", status);
    if ( [status isKindOfClass:NSString.class] ) {
        if ( [status isEqualToString:@"OK"] ) {
            return SPGoogleGeoCoderResponseOK;
        } else if ( [status isEqualToString:@"ZERO_RESULTS"] ) {
            return SPGoogleGeoCoderResponseOKZeroResults;
        } else if ( [status isEqualToString:@"OVER_QUERY_LIMIT"] ) {
            return SPGoogleGeoCoderResponseErrorOverQueryLimit;
        } else if ( [status isEqualToString:@"REQUEST_DENIED"] ) {
            return SPGoogleGeoCoderResponseErrorRequestDenied;
        } else if ( [status isEqualToString:@"INVALID_REQUEST"] ) {
            return SPGoogleGeoCoderResponseErrorInvalidRequest;
        } else if ( [status isEqualToString:@"UNKNOWN_ERROR"] ) {
            return SPGoogleGeoCoderResponseErrorUnknownError;
        }
    }
    
    return SPGoogleGeoCoderResponseUnknownError;
}

+ (NSString * )messageStringFromResponseCode:(SPGoogleGeoCoderResponse)responseCode
{
    NSString *status = @"";
    NSLog(@"status: %@", status);
    if ( responseCode ==  SPGoogleGeoCoderResponseOK) {
        return @"Processed successfully.";
    } else if ( responseCode == SPGoogleGeoCoderResponseOKZeroResults ) {
        return @"No results found!";
    } else if ( responseCode == SPGoogleGeoCoderResponseErrorOverQueryLimit ) {
        return @"Query over limit.";
    } else if ( responseCode == SPGoogleGeoCoderResponseErrorRequestDenied ) {
        return @"Request is denied";
    } else if ( responseCode ==  SPGoogleGeoCoderResponseErrorInvalidRequest) {
        return @"Invalid request";
    } else if ( responseCode == SPGoogleGeoCoderResponseErrorUnknownError ) {
        return @"Unknown error";
    }
    return @"No error";
}
- (void)parseResponse:(NSDictionary *)response andDrawPoints:(SPGoogleDirectionsVoidBlock)drawPoints andPlaceMarks:(SPGoogleDirectionsPlaceMarksBlock)placeMarks andPolyLineSetArray:(NSMutableArray*)polyLineSetArray andDirectionsSetArray:(NSMutableArray*)directionStrAry andDistanceSetArray:(NSMutableArray*)distanceStrAry{
    
    drawPoints ();
    NSArray *routes = [response objectForKey:@"routes"];
    NSDictionary *route = [routes lastObject];
    
    if (route) {
        NSArray *legs = [route objectForKey: @"legs"];
        NSDictionary *routeTime = [legs lastObject];
        NSString *distance = [[routeTime objectForKey: @"distance"] objectForKey:@"text"];
        NSString *duration = [[routeTime objectForKey: @"duration"] objectForKey:@"text"];
        NSString *endAddress = [routeTime objectForKey:@"end_address"];
        NSString *startAddress = [routeTime objectForKey: @"start_address"];
        
        
        NSString *overviewPolyline = [[route objectForKey: @"overview_polyline"] objectForKey:@"points"];
        NSMutableArray *arrRoutePoints = [self decodePolyLine:overviewPolyline];
        
        NSInteger numberOfSteps = arrRoutePoints.count;
        
        CLLocationCoordinate2D coordinates[numberOfSteps];
        for (NSInteger index = 0; index < numberOfSteps; index++) {
            CLLocation *location = [arrRoutePoints objectAtIndex:index];
            CLLocationCoordinate2D coordinate = location.coordinate;
            
            coordinates[index] = coordinate;
        }
        
        MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:coordinates count:numberOfSteps];

        placeMarks(polyLine,distance,duration,startAddress,endAddress,polyLineSetArray,distanceStrAry,directionStrAry);
    }
}
-(NSMutableArray *)decodePolyLine:(NSString *)encodedStr {
    @try {
        NSMutableString *encoded = [[NSMutableString alloc] initWithCapacity:[encodedStr length]];
        [encoded appendString:encodedStr];
        [encoded replaceOccurrencesOfString:@"\\\\" withString:@"\\"
                                    options:NSLiteralSearch
                                      range:NSMakeRange(0, [encoded length])];
        NSInteger len = [encoded length];
        NSInteger index = 0;
        NSMutableArray *array = [[NSMutableArray alloc] init];
        NSInteger lat=0;
        NSInteger lng=0;
        while (index < len) {
            NSInteger b;
            NSInteger shift = 0;
            NSInteger result = 0;
            do {
                b = [encoded characterAtIndex:index++] - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
            lat += dlat;
            shift = 0;
            result = 0;
            do {
                b = [encoded characterAtIndex:index++] - 63;
                result |= (b & 0x1f) << shift;
                shift += 5;
            } while (b >= 0x20);
            NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
            lng += dlng;
            NSNumber *latitude = [[NSNumber alloc] initWithFloat:lat * 1e-5];
            NSNumber *longitude = [[NSNumber alloc] initWithFloat:lng * 1e-5];
            
            CLLocation *location = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
            [array addObject:location];
        }
        
        return array;
    }
    @catch (NSException *exception) {
        SPDBAnyVar(exception.description);
    }
    @finally {
        
    }
}


@end
