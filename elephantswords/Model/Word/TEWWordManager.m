//
//  TEWWordManager.m
//  elephantswords
//
//  Created by star on 5/29/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWWordManager.h"

@implementation TEWWordManager

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
    self.wordInfo = [self JSONFromFile];
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (NSArray *)getWordsWithRoundNo: (int)roundNo {
    NSString * key = [@"round" stringByAppendingFormat:@"%d", roundNo ];
    NSArray *words = [self.wordInfo objectForKey:key];
    
    return words;
}


@end
