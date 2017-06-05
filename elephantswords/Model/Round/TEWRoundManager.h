//
//  TEWRoundManager.h
//  elephantswords
//
//  Created by star on 5/21/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWRoundManager : NSObject

@property (atomic) int roundNo;

+ (instancetype) sharedInstance;
- (void) initializeManager;

@end
