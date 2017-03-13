//
//  Error.h
//  SampleProject
//
//  Created on 27/09/2013.

//

#import <Foundation/Foundation.h>

@interface Error : NSObject

@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) NSString *message;

- (id)initWithDictionary:(NSDictionary*)dictResult;
- (id)initWithError:(NSError*)error;
- (id)initWithMessage:(NSString*)message errorCode:(NSString*)code;

@end
