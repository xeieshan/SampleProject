//
//  SPGoogleGeoCoder.h
//  SampleProject
//
//  Created by <#Project Developer#> on 09/12/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import <SVHTTPRequest/SVHTTPRequest.h>
#import "MOGoogleGeocodeList.h"
#import "MOGoogleAutoCompleteList.h"
#import "SVProgressHUD.h"

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&name=cruise&key=AIzaSyA8Al6-s6ZVX4F_-9gEh06AU6YEIdnmdlY

typedef NS_ENUM(NSUInteger, SPGoogleGeoCoderResponse) {
    
    SPGoogleGeoCoderResponseErrorOverQueryLimit, // indicates that you are over your quota.
    SPGoogleGeoCoderResponseErrorRequestDenied,  // indicates that your request was denied, generally because of lack of a sensor parameter.
    SPGoogleGeoCoderResponseErrorInvalidRequest, // generally indicates that the query (address or latlng) is missing.
    SPGoogleGeoCoderResponseErrorUnknownError,    // indicates that the request could not be processed due to a server error. The request may succeed if you try again.
    SPGoogleGeoCoderResponseOK,
    SPGoogleGeoCoderResponseOKZeroResults,
    SPGoogleGeoCoderResponseUnknownError
};

///* --- This is the exception return codes --- */
//static int const kJSONResponseIsOK = -12345678;
//static int const kUnknownErrorCode = 0;
///* ------------------------------------------ */

typedef void(^SPGoogleDirectionsVoidBlock)();
typedef void(^SPGoogleDirectionsPlaceMarksBlock)(MKPolyline *polyLine, NSString *distance, NSString *duration, NSString *startAddress, NSString *endAddress, NSMutableArray *polyLineSetArray, NSMutableArray *directionsSetArray, NSMutableArray *distanceSetArray);
typedef void (^ SPGoogleGeoCoderCompletionBlock) (MOGoogleGeocodeList *googleGeoCodeList, SPGoogleGeoCoderResponse responseCode, NSString *message);
typedef void (^ SPGoogleAutoCompletionBlock) (MOGoogleAutoCompleteList *googleAutocompleteList, SPGoogleGeoCoderResponse responseCode, NSString *message);

@interface SPGoogleMapsHelper : SVHTTPClient

/**
 *  Google API key. Not required, but result filtering on reverse geocoding is only available when set.
 */
@property (nonatomic, strong)NSString *APIKey;
/**
 *  Operation Queue for requesting a call. Currently not being used.
 */
@property (nonatomic, strong)NSOperationQueue *requestQueue;

/**
 *  sharedGoogleMapHelper
 *
 *  @return a singleton
 */
+ (instancetype)sharedGoogleMapHelper;

/**
 *@description Asynchroniously queries the Google Geocoder API with the data provided.
 *@param query A free search query string
 *@param components A dictionary containing filters.
 *@see https://developers.google.com/maps/documentation/geocoding/#ComponentFiltering for possible filter values.
 *@param completionHandler Upon completion or failure this will be invoked. Passes an array of IRTSGooglePlacemark objects (or empty if no results). If an error occured, the "error" object will be != nil
 **/

- (void)geocodeAddressString:(NSString *)query components:(NSDictionary *)components completionHandler:(SPGoogleGeoCoderCompletionBlock)completion;

/**
 *@description Asynchroniously queries the Google Geocoder API with the data provided.
 *@see https://developers.google.com/maps/documentation/geocoding/#Types and https://developers.google.com/maps/documentation/geocoding/#ReverseGeocoding for possible filter values.
 *@param coordinate Coordinate to look up
 *@param resultTypes A dictionary containing result type filters. NOTE: Ignored if APIKey == nil.
 *@param key — Your application's API key, obtained from the Google Developers Console. This key identifies your application for purposes of quota management.
 *@param language — The language in which to return results. See the list of supported domain languages. Note that we often update supported languages so this list may not be exhaustive. If language is not supplied, the geocoder will attempt to use the native language of the domain from which the request is sent wherever possible.
 *@param result_type — One or more address types, separated by a pipe (|). Examples of address types: country, street_address, postal_code. For a full list of allowable values, see the address types on this page. Specifying a type will restrict the results to this type. If multiple types are specified, the API will return all addresses that match any of the types. Note: This parameter is available only for requests that include an API key or a client ID.
 *@param location_type — One or more location types, separated by a pipe (|). Specifying a type will restrict the results to this type. If multiple types are specified, the API will return all addresses that match any of the types. Note: This parameter is available only for requests that include an API key or a client ID. The following values are supported:
 "ROOFTOP" restricts the results to addresses for which we have location information accurate down to street address precision.
 "RANGE_INTERPOLATED" restricts the results to those that reflect an approximation (usually on a road) interpolated between two precise points (such as intersections). An interpolated range generally indicates that rooftop geocodes are unavailable for a street address.
 "GEOMETRIC_CENTER" restricts the results to geometric centers of a location such as a polyline (for example, a street) or polygon (region).
 "APPROXIMATE" restricts the results to those that are characterized as approximate.
 
 If both result_type and location_type restrictions are present then the API will return only those results that matches both the result_type and the location_type restrictions.
 
 *@param locationTypes A dictionary containing location type filters. NOTE: Ignored if APIKey == nil.
 *@param completionHandler Upon completion or failure this will be invoked. Passes an array of NOGooglePlacemark objects (or empty if no results). If an error occured, the "error" object will be != nil
 **/
- (void)reverseGeocodeCoordinate:(CLLocationCoordinate2D)coordinate resultTypes:(NSArray *)resultTypes locationTypes:(NSArray *)locationTypes completionHandler:(SPGoogleGeoCoderCompletionBlock)completion;

/**
 *  <#Description#>
 *
 *  @param coordinateSource      <#coordinateSource description#>
 *  @param coordinateDestination <#coordinateDestination description#>
 *  @param drawPoints            <#drawPoints description#>
 *  @param placeMarks            <#placeMarks description#>
 */
- (void)getDirections:(CLLocationCoordinate2D)coordinateSource andCoordinateDestination:(CLLocationCoordinate2D)coordinateDestination  andDrawPoints:(SPGoogleDirectionsVoidBlock)drawPoints andPlaceMarks:(SPGoogleDirectionsPlaceMarksBlock)placeMarks;

/**
 *  Google autocomplete for places will res
 *
 *  @param keyWord      <#keyWord description#>
 *  @param autocomplete <#autocomplete description#>
 */
- (void)getAutoCompleteFromGoogle:(NSString *)keyWord andAutoComplete:(SPGoogleAutoCompletionBlock)autocomplete;


@end
