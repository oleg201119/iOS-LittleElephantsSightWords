//
//  TEWErrorManager.m
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWErrorManager.h"
#import "TEWGenericFunctionManager.h"
#import "Global.h"

@implementation TEWErrorManager

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id) init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void) initialize {
    self.nCode = -1;
    self.szDescription = @"";
    self.szMessage = @"";
}

- (void) initializeManager {
    [self initialize];
}

- (void) logLastError {
    NSLog(@"Error %d: %@", self.nCode, self.szDescription);
}

#pragma mark -Utils

- (int) analyzeErrorResponse: (NSError *) error ResponseObject: (NSDictionary *) dict {
    [self initialize];
    if (dict == nil) {
        self.szMessage = @"Sorry, we've encountered an unknown error.";
        self.szDescription = @"Sorry, we've encountered an unknown error.";
        return ERROR_CONNECTION_FAILED;
    }
    
    if ([dict isKindOfClass:[NSDictionary class]] == NO) return ERROR_BAD_REQUEST;
    
    self.nCode = [TEWGenericFunctionManager refineInt:[dict objectForKey:@"code"] DefaultValue:-1];
    if (self.nCode == -1) {
        NSString *sz = [TEWGenericFunctionManager refineNSString:[dict objectForKey:@"error"]];
        self.szMessage = sz;
        self.szDescription = sz;
        self.nCode = ERROR_BAD_REQUEST;
        if (sz.length > 0 && [[sz uppercaseString] isEqualToString:@"USER NOT FOUND"]) {
            self.nCode = ERROR_USER_NOTFOUND;
        }
        return self.nCode;
    }
    
    self.szMessage = [TEWGenericFunctionManager refineNSString:[dict objectForKey:@"message"]];
    
    NSDictionary *dictErrors = [dict objectForKey:@"errors"];
    if (dictErrors == nil) return self.nCode;
    
    NSDictionary *dictChildren = [dictErrors objectForKey:@"children"];
    if (dictChildren == nil) return self.nCode;
    
    for (NSString *key in dictChildren) {
        NSDictionary *dictItem = [dictChildren objectForKey:key];
        if ([dictItem.allKeys count] == 0) continue;
        
        NSArray *arrError = [dictItem objectForKey:@"errors"];
        if ([arrError count] == 0) continue;
        
        self.szDescription = [TEWGenericFunctionManager refineNSString:[arrError objectAtIndex:0]];
        break;
    }
    return self.nCode;
}

+ (id) getResponseObjectFromAFError: (NSError *) error {
    
#ifndef AFNetworkingOperationFailingURLResponseDataErrorKey
    
#define AFNetworkingOperationFailingURLResponseDataErrorKey @"com.alamofire.serialization.response.error.data"
    
#endif
    if ([error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey] == nil) return nil;
    NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    return [TEWGenericFunctionManager getObjectFromJSONStringRepresentation:errResponse];
}

@end
