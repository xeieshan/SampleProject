//
//  Error.m
//  SampleProject
//
//  Created on 27/09/2013.

//

#import "Error.h"

@implementation Error

/**
 ** Initialize Error with @dictResult dictionary
 ** @dictResult is the dictionary that contains error-code and related error-messages.
 **/
- (id)initWithDictionary:(NSDictionary *)dictResult
{
    self = [super init];
    if (self)
    {
        self.message = [dictResult objectForKey:@"error"];
        if (self.message == nil)
        {
            self.message = [dictResult objectForKey:@"message"];
        }
    }
    return self;
}

/**
 ** Initialize with @error
 **/
- (id)initWithError:(NSError*)error
{
    self = [super init];
    if (self)
    {
        //self.errorCode = [NSString stringWithFormat:@"%d",[error code]];
        self.message = error.localizedDescription;
    }
    return self;
}

/**
 ** Initialize with @message & @errorCode
 **/
- (id)initWithMessage:(NSString*)message errorCode:(NSString*)code
{
    self = [super init];
    if (self)
    {
        //self.errorCode = code;
        self.message = message;
    }
    return self;
}

/**
 ** Describe the error
 ** Used in log statements
 **/
- (NSString*)description
{
    return self.message;
}

@end

