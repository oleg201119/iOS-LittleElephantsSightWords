//
//  TEWWordManager.h
//  elephantswords
//
//  Created by star on 5/29/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWWordManager : NSObject

@property (strong, nonatomic) NSDictionary *wordInfo;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (NSArray *)getWordsWithRoundNo: (int)roundNo;

@end
