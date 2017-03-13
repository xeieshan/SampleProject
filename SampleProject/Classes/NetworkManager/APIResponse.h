//
//  APIResponse.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"

@interface APIResponse : NSObject

@property (strong, nonatomic) Error *error;
@property (strong, nonatomic) NSString *optionalMessage;
@property (strong, nonatomic) id data;

+ (APIResponse *)handleResponse:(NSDictionary *)dictResponse error:(NSError *)networkError;
//- (NSDictionary *)dictionaryRepresentation;


+ (void)uploadMultipleImagesWithparameters:(NSDictionary *)parameters
                                imagesData:(NSArray *)imagesDataArray
                                 imageFieldName:(NSString *)imageFieldName withCompletionHandler:(void(^)(APIResponse * response))handler;

@end
