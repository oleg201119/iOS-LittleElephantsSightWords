//
//  TEWProfileManager.m
//  elephantswords
//
//  Created by star on 5/21/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWProfileManager.h"
#import "TEWGenericFunctionManager.h"
#import "AppDelegate.h"

@implementation TEWProfileManager

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
    self.profileArray = [[NSMutableArray alloc]init];
    self.activeProfile = nil;
}

- (void) createNewProfileWithName: (NSString *)name WithAvatar: (int)avatar WithRegion: (int)region WithStyle: (int)style WithColor: (int)color WithSound: (BOOL)sound WithActive: (BOOL)active {
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    TEWProfileDataModel * profile = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:moc];
    
    profile.name = name;
    profile.avatar = avatar;
    profile.region = region;
    profile.style = style;
    profile.color = color;
    profile.sound = sound;
    profile.active = active;
    profile.uuid = [TEWGenericFunctionManager getUUID];
   
    // Save
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

- (void) updateActiveProfileWithName: (NSString *)name WithAvatar: (int)avatar WithRegion: (int)region WithStyle: (int)style WithColor: (int)color WithSound: (BOOL)sound {
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    TEWProfileDataModel * profile = self.activeProfile;
    
    profile.name = name;
    profile.avatar = avatar;
    profile.region = region;
    profile.style = style;
    profile.color = color;
    profile.sound = sound;
    
    // Save
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

- (void) loadProfiles {
    // Clear array
    [self.profileArray removeAllObjects];
    
    // Load profiles from core data
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Profile"];
    
    NSError * error = nil;
    NSArray * results = [moc executeFetchRequest:request error:&error];
    
    if (!results) {
        NSLog(@"Error fetching Profile objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    else {
        for(int i=0; i < results.count; i++) {
            TEWProfileDataModel * profileInfo = results[i];
            
            [self.profileArray addObject:profileInfo];
    
            // Set active profile
            if (profileInfo.active) {
                self.activeProfile = profileInfo;
            }
        }
    }
}

- (void) removeProfile: (NSString *)name {
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    BOOL changed = NO;
    
    for(int i=0; i < self.profileArray.count; i++) {
        TEWProfileDataModel * profileInfo = self.profileArray[i];
        
        if ([profileInfo.name isEqualToString:name] == YES) {
            [moc deleteObject:profileInfo];
            changed = YES;
            break;
        }
    }
    
    // Save
    if (changed) {
        NSError * error = nil;
        
        if ([moc save:&error] == NO) {
            NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        else {
            NSLog(@"Success saving core data");
        }
    }
}

- (void) switchActiveProfile: (NSString *)name {
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    for(int i=0; i < self.profileArray.count; i++) {
        TEWProfileDataModel * profileInfo = self.profileArray[i];
        
        if ([profileInfo.name isEqualToString:name] == YES) {
            profileInfo.active = YES;
            
            self.activeProfile = profileInfo;
        }
        else {
            profileInfo.active = NO;
        }
    }
    
    // Save
    {
        NSError * error = nil;
        
        if ([moc save:&error] == NO) {
            NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        else {
            NSLog(@"Success saving core data");
        }
    }
}

- (void) saveProfiles {
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext * moc = delegate.persistentContainer.viewContext;
    
    // Save
    {
        NSError * error = nil;
        
        if ([moc save:&error] == NO) {
            NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        else {
            NSLog(@"Success saving core data");
        }
    }
}

@end
