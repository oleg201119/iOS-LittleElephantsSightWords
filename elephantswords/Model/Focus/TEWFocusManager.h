//
//  TEWFocusManager.h
//  elephantswords
//
//  Created by star on 5/20/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEWFocusWordDataModel.h"

@interface TEWFocusManager : NSObject

@property (strong, nonatomic) NSMutableArray *focusArray;
@property (strong, nonatomic) TEWFocusWordDataModel * activeFocusWord;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) loadFocusWords;
- (void) removeFocusWord: (NSString *)uuid;
- (void) switchActiveFocusWord: (NSString *)uuid;
- (void)createEmptyFocusWord: (NSString *)uuid;
- (void) addWordToActiveFocus: (NSString *)word;
- (void) removeWordFromActiveFocus: (NSString *)word;
- (NSArray*) getActiveFocusWordArray;
- (void) resetActiveFocusWord;


@end
