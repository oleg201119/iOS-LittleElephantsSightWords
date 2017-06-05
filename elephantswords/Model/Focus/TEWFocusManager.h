//
//  TEWFocusManager.h
//  elephantswords
//
//  Created by star on 5/20/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWFocusManager : NSObject

@property (strong, nonatomic) NSMutableArray *wordArray;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) resetWordArray;
- (void) addWord: (NSString *) word;
- (void) removeWord: (NSString *) word;

- (void) loadWords;

- (void) saveFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo;
- (void) loadFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo;
- (void) removeFocusWordsWithUserId: (NSString *)userId withRoundNo: (int)roundNo;

@end
