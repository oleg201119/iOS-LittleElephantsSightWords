//
//  TEWPurchaseManager.m
//  elephantswords
//
//  Created by star on 6/19/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWPurchaseManager.h"

@implementation TEWPurchaseManager

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
    
    self.all400Purchased = NO;
    self.to100Purchased = NO;
    self.to200Purchased = NO;
    self.to300Purchased = NO;
    self.to400Purchased = NO;
    
    BOOL purchased;
    
    purchased = [[NSUserDefaults standardUserDefaults] boolForKey:PRODUCT_ID_ALL400];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (purchased) {
        self.all400Purchased = YES;
    }
    
    purchased = [[NSUserDefaults standardUserDefaults] boolForKey:PRODUCT_ID_TO100];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (purchased) {
        self.to100Purchased = YES;
    }
    
    purchased = [[NSUserDefaults standardUserDefaults] boolForKey:PRODUCT_ID_TO200];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (purchased) {
        self.to200Purchased = YES;
    }
    
    purchased = [[NSUserDefaults standardUserDefaults] boolForKey:PRODUCT_ID_TO300];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (purchased) {
        self.to300Purchased = YES;
    }
    
    purchased = [[NSUserDefaults standardUserDefaults] boolForKey:PRODUCT_ID_TO400];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (purchased) {
        self.to400Purchased = YES;
    }
}

- (void) setPurchasedItem: (NSString *)productId {
 
    if ([productId isEqualToString:PRODUCT_ID_TO100] == YES) {
        self.to100Purchased = YES;
    }
    
    if ([productId isEqualToString:PRODUCT_ID_TO200] == YES) {
        self.to200Purchased = YES;
    }
    
    if ([productId isEqualToString:PRODUCT_ID_TO300] == YES) {
        self.to300Purchased = YES;
    }
    
    if ([productId isEqualToString:PRODUCT_ID_TO400] == YES) {
        self.to400Purchased = YES;
    }
    
    if ([productId isEqualToString:PRODUCT_ID_ALL400] == YES) {
        self.all400Purchased = YES;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:productId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
