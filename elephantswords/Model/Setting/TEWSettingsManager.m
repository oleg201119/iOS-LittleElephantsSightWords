//
//  TEWSettingsManager.m
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingsManager.h"
#import "TEWProfileManager.h"

@implementation TEWSettingsManager

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
    self.modelSettingInfo = [[TEWSettingsDataModel alloc] init];
}

- (void) setWithActiveProfile {
    TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
    
    self.modelSettingInfo.name = profileManager.activeProfile.name;
    self.modelSettingInfo.avatar = profileManager.activeProfile.avatar;
    self.modelSettingInfo.region = profileManager.activeProfile.region;
    self.modelSettingInfo.style = profileManager.activeProfile.style;
    self.modelSettingInfo.color = profileManager.activeProfile.color;
    self.modelSettingInfo.sound = profileManager.activeProfile.sound;
}

@end
