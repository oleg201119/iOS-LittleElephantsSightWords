//
//  TEWRotationManager.m
//  elephantswords
//
//  Created by star on 6/2/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWRotationManager.h"

@implementation TEWRotationManager

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
    self.animate = YES;
}

@end
