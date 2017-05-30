//
//  TEWSettingsDataModel.h
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TEWProfile.h"

@interface TEWSettingsDataModel : NSObject

@property (strong, nonatomic) NSString *szUserName;
@property (atomic) int nAnimalCode;
@property (atomic) int nRegionCode;
@property (atomic) int nTypefaceCode;
@property (atomic) int nColorCode;
@property (atomic) BOOL fSoundEnable;

- (instancetype) init;

- (void) setUserName: (NSString*)userName;
- (void) setAnimalCode: (int)animalCode;
- (void) setRegionCode: (int)regionCode;
- (void) setTypefaceCode: (int)typeFaceCode;
- (void) setColorCode: (int)colorCode;
- (void) setSoundEnable: (BOOL)soundEnable;

- (void) save: (NSManagedObjectContext *)moc;
- (void) load: (TEWProfile *)profile;

@end
