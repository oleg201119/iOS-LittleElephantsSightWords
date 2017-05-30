//
//  TEWAppManager.m
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWAppManager.h"
#import "IQKeyboardManager.h"

@implementation TEWAppManager

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id) init{
    if (self = [super init]) {
        [self initializeManagers];
    }
    return self;
}

- (void) initializeManagers {
}

- (void) initializeManagersAfterLaunch {
    IQKeyboardManager *sharedInstance = [IQKeyboardManager sharedManager];
    sharedInstance.shouldResignOnTouchOutside = YES;
    sharedInstance.keyboardDistanceFromTextField = 70;
    sharedInstance.enableAutoToolbar = NO;
}


@end
