//
//  TEWSettingsDataModel.m
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingsDataModel.h"
#import "TEWGenericFunctionManager.h"
#import "TEWSettingsConstant.h"

@implementation TEWSettingsDataModel

- (instancetype) init {
    self = [super init];
    if (self){
        [self initialize];
    }
    return self;
}

- (void) initialize {
    self.name = @"";
    self.avatar = ANIMAL_NONE;
    self.region = REGION_NONE;
    self.style = STYLE_NONE;
    self.color = COLOR_NONE;
    self.sound = SOUND_ENABLED;
}

- (void) reset {
    self.name = @"";
    self.avatar = ANIMAL_NONE;
    self.region = REGION_NONE;
    self.style = STYLE_NONE;
    self.color = COLOR_NONE;
    self.sound = SOUND_ENABLED;
}

@end
