//
//  TEWErrorManager.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWErrorManager : NSObject

@property (atomic) int nCode;
@property (strong, nonatomic) NSString *szDescription;
@property (strong, nonatomic) NSString *szMessage;

+ (instancetype) sharedInstance;
- (void) initializeManager;
- (void) logLastError;

#pragma mark -Utils

- (int) analyzeErrorResponse: (NSError *) error ResponseObject: (NSDictionary *) dict;
+ (id) getResponseObjectFromAFError: (NSError *) error;

@end
