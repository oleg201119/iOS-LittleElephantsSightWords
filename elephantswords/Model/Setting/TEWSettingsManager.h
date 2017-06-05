//
//  TEWSettingsManager.h
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEWSettingsDataModel.h"

@interface TEWSettingsManager : NSObject

@property (strong, nonatomic) TEWSettingsDataModel *modelSettingInfo;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) setWithActiveProfile;

@end
