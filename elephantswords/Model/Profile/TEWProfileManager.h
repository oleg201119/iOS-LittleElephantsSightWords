//
//  TEWProfileManager.h
//  elephantswords
//
//  Created by star on 5/21/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEWProfileDataModel.h"

@interface TEWProfileManager : NSObject

@property (strong, nonatomic) NSMutableArray *profileArray;
@property (strong, nonatomic) TEWProfileDataModel * activeProfile;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) createNewProfileWithName: (NSString *)name WithAvatar: (int)avatar WithRegion: (int)region WithStyle: (int)style WithColor: (int)color WithSound: (BOOL)sound WithActive: (BOOL)active;
- (void) updateActiveProfileWithName: (NSString *)name WithAvatar: (int)avatar WithRegion: (int)region WithStyle: (int)style WithColor: (int)color WithSound: (BOOL)sound;
- (void) loadProfiles;
- (void) removeProfile: (NSString *)name;
- (void) switchActiveProfile: (NSString *)name;
- (void) saveProfiles;

@end
