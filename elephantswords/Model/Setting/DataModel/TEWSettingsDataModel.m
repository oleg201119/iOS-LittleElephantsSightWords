//
//  TEWSettingsDataModel.m
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingsDataModel.h"
#import "TEWGenericFunctionManager.h"
#import "SettingsConstant.h"

@implementation TEWSettingsDataModel

- (instancetype) init {
    self = [super init];
    if (self){
        [self initialize];
    }
    return self;
}

- (void) initialize {
    self.szUserName = @"";
    self.nAnimalCode = ANIMAL_NONE;
    self.nRegionCode = REGION_NONE;
    self.nTypefaceCode = STYLE_NONE;
    self.nColorCode = COLOR_NONE;
    self.fSoundEnable = SOUND_ENABLED;
}

- (void) setUserName: (NSString*)userName {
    self.szUserName = [TEWGenericFunctionManager refineNSString:userName];
}

- (void) setAnimalCode: (int)animalCode {
    self.nAnimalCode = animalCode;
}

- (void) setRegionCode: (int)regionCode {
    self.nRegionCode = regionCode;
}

- (void) setTypefaceCode: (int)typeFaceCode {
    self.nTypefaceCode = typeFaceCode;
}

- (void) setColorCode: (int)colorCode {
    self.nColorCode = colorCode;
}

- (void) setSoundEnable: (BOOL)soundEnable {
    self.fSoundEnable = soundEnable;
}

- (void) save: (NSManagedObjectContext *)moc {
    
    TEWProfile * profile = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:moc];
    
    profile.name = self.szUserName;
    profile.avatar = self.nAnimalCode;
    profile.region = self.nRegionCode;
    profile.style = self.nTypefaceCode;
    profile.color = self.nColorCode;
    profile.sound = self.fSoundEnable;
    profile.active = YES;
    
    NSError * error = nil;
    
    if ([[profile managedObjectContext] save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

- (void) load: (TEWProfile *)profile {
    self.szUserName = profile.name;
    self.nAnimalCode = profile.avatar;
    self.nRegionCode = profile.region;
    self.nTypefaceCode = profile.style;
    self.nColorCode = profile.color;
    self.fSoundEnable = profile.sound;    
}

@end
