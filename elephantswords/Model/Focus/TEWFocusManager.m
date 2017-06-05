//
//  TEWFocusManager.m
//  elephantswords
//
//  Created by star on 5/20/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWFocusManager.h"
#import "TEWProfileManager.h"
#import "TEWRoundManager.h"

@implementation TEWFocusManager

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
    self.wordArray = [[NSMutableArray alloc]init];
}

- (void) resetWordArray {
    [self.wordArray removeAllObjects];
}

- (void) addWord: (NSString *) word {
    
    // Add
    for (int i=0; i<self.wordArray.count; i++) {
        if ([self.wordArray[i] isEqualToString:word] == YES) {
            return;
        }
    }
    
    [self.wordArray addObject:word];
    
    // Save
    NSString * userId = [TEWProfileManager sharedInstance].activeProfile.uuid;
    int roundNo = [TEWRoundManager sharedInstance].roundNo;
    
    [self saveFocusWordsWithUserId:userId withRoundNo:roundNo];
}

- (void) removeWord: (NSString *) word {
    
    for (int i=0; i<[self.wordArray count]; i++) {
        NSString * item = [self.wordArray objectAtIndex:i];
        
        if ([item isEqualToString:word]) {
            [self.wordArray removeObject:item];
            
            // Save
            NSString * userId = [TEWProfileManager sharedInstance].activeProfile.uuid;
            int roundNo = [TEWRoundManager sharedInstance].roundNo;
            
            [self saveFocusWordsWithUserId:userId withRoundNo:roundNo];
            
            break;
        }
    }
}

- (void) loadWords {
    NSString * userId = [TEWProfileManager sharedInstance].activeProfile.uuid;
    int roundNo = [TEWRoundManager sharedInstance].roundNo;
    
    [self loadFocusWordsWithUserId:userId withRoundNo:roundNo];
}

- (void) saveFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *  key = [userId stringByAppendingFormat:@"-%d", roundNo];

    [userDefaults setObject:self.wordArray forKey:key];
    [userDefaults synchronize];
}

- (void) loadFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *  key = [userId stringByAppendingFormat:@"-%d", roundNo];

    self.wordArray = [[userDefaults arrayForKey:key] mutableCopy];
}

- (void) removeFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *  key = [userId stringByAppendingFormat:@"-%d", roundNo];
    
    [userDefaults removeObjectForKey:key];
}

@end
