//
//  APIResponse.m
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "APIResponse.h"
#import "NSDictionary+Utilities.h"
@implementation APIResponse

/**
 ** A common method to handle the response.
 ** @dictResponse is the response dictionary that needs to be parsed.
 ** properties @error and @data are populated based on the response.
 **/

+ (APIResponse *)handleResponse:(NSDictionary *)dictResponse error:(NSError *)networkError
{
    APIResponse *response = [[APIResponse alloc] init];
    
    if (!networkError)
    {
        NSDictionary *result = dictResponse;
        
        if ([[result objectForKey:@"status"] intValue] == 0)
        {
            response.error = [[Error alloc] initWithDictionary:result];
            response.data = nil;
        }
        else
        {
            response.error = nil;
            response.optionalMessage = [result utilities_objectForKeyNotNull:@"message"];
            response.data = [dictResponse objectForKey:@"result"];
        }
    }
    else
    {
        response.error = [[Error alloc] initWithError:networkError];
        response.data = nil;
    }
    
    return response;
}

+ (void)uploadMultipleImagesWithparameters:(NSDictionary *)parameters
                                imagesData:(NSArray *)imagesDataArray
                            imageFieldName:(NSString *)imageFieldName withCompletionHandler:(void(^)(APIResponse * response))handler{
    
    NSString *boundary = [self generateBoundaryString];
    
    // configure the request
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://192.168.2.30/hobby_globe/api/v1/posts/save"]];
    [request setHTTPMethod:@"POST"];
    
    // set content type
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // create body
    NSData *httpBody = [self createBodyWithBoundary:boundary parameters:parameters imagesData:imagesDataArray fieldName:[NSString stringWithFormat:@"%@[]",imageFieldName]];
    
    request.HTTPBody = httpBody;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"error = %@", connectionError);
            return;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"result = %@", dict);
        
        handler([self handleResponse:dict error:nil]);
    }];
}


+ (NSData *)createBodyWithBoundary:(NSString *)boundary
                        parameters:(NSDictionary *)parameters
                        imagesData:(NSArray *)images
                         fieldName:(NSString *)fieldName
{
    NSMutableData *httpBody = [NSMutableData data];
    
    // add params (all params are strings)
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *parameterKey, NSString *parameterValue, BOOL *stop) {
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", parameterKey] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"%@\r\n", parameterValue] dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    
    // add image data
    int i =1;
    for (NSData *imageData in images) {
        NSString *mimetype  = @"image/jpeg";
        NSString *fileName = [NSString stringWithFormat:@"fileName%i.jpg",i++];
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, fileName] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", mimetype] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:imageData];
        [httpBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [httpBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return httpBody;
}

+ (NSString *)generateBoundaryString
{
    return [NSString stringWithFormat:@"Boundary-%@", [[NSUUID UUID] UUIDString]];
    
    // if supporting iOS versions prior to 6.0, you do something like:
    //
    // // generate boundary string
    // //
    // adapted from http://developer.apple.com/library/ios/#samplecode/SimpleURLConnections
    //
    // CFUUIDRef  uuid;
    // NSString  *uuidStr;
    //
    // uuid = CFUUIDCreate(NULL);
    // assert(uuid != NULL);
    //
    // uuidStr = CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
    // assert(uuidStr != NULL);
    //
    // CFRelease(uuid);
    //
    // return uuidStr;
}

@end

