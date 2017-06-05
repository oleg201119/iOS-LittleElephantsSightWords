//
//  TEWRoundManager.m
//  elephantswords
//
//  Created by star on 5/21/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWRoundManager.h"
#import "Global.h"

@implementation TEWRoundManager

+ (instancetype) sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id) init{
    if (self = [super init]) {
        [self initializeManager];
    }
    return self;
}

- (void) initializeManager {
    self.roundNo = TEW_ROUND_NONE;
}

@end
