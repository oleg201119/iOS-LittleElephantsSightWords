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

#import "TEWGenericFunctionManager.h"
#import "AppDelegate.h"

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
    self.focusArray = [[NSMutableArray alloc]init];
    self.activeFocusWord = nil;
}

- (void) loadFocusWords {
    // Clear array
    [self.focusArray removeAllObjects];
    
    // Load focus words from core data
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Focus"];
    
    NSError * error = nil;
    NSArray * results = [moc executeFetchRequest:request error:&error];
    
    if (!results) {
        NSLog(@"Error fetching Profile objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    else {
        for(int i=0; i < results.count; i++) {
            TEWFocusWordDataModel * focusInfo = results[i];
            
            [self.focusArray addObject:focusInfo];
        }
    }
}

- (void) removeFocusWord: (NSString *)uuid {
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    BOOL changed = NO;
    
    for(int i=0; i < self.focusArray.count; i++) {
        TEWFocusWordDataModel * focusInfo = self.focusArray[i];
        
        if ([focusInfo.uuid isEqualToString:uuid] == YES) {
            
            [moc deleteObject:focusInfo];
            [self.focusArray removeObject:focusInfo];
            
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

- (void) switchActiveFocusWord: (NSString *)uuid {
    
    BOOL changed = NO;
    
    for(int i=0; i < self.focusArray.count; i++) {
        TEWFocusWordDataModel * focusInfo = self.focusArray[i];
        
        if ([focusInfo.uuid isEqualToString:uuid] == YES) {
            self.activeFocusWord = focusInfo;
            
            changed = YES;
            break;
        }
    }
    
    if (changed == NO) {
        
        self.activeFocusWord = nil;
    }
}

- (void)createEmptyFocusWord: (NSString *)uuid {
    
    // Create empty slot
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    TEWFocusWordDataModel * focusInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Focus" inManagedObjectContext:moc];
    
    focusInfo.uuid = uuid;
    focusInfo.words = nil;
    
    // Save
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

- (void) addWordToActiveFocus: (NSString *)word {
    
    // Convert string to array
    NSMutableArray *wordArray = [[self.activeFocusWord.words componentsSeparatedByString:@","] mutableCopy];
    
    if (wordArray == nil) {
        wordArray = [[NSMutableArray alloc] init];
    }
    
    for (int i=0; i<wordArray.count; i++) {
        
        NSString * item = [wordArray objectAtIndex:i];
        
        if ([item isEqualToString:word] == YES) {
            return;
        }
    }
    
    // Add the word
    [wordArray addObject:word];
    
    // Convert array to string
    NSString * words = [wordArray componentsJoinedByString:@","];
    
    // Update
    self.activeFocusWord.words = words;
    
    // Save
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

- (void) removeWordFromActiveFocus: (NSString *)word {
    // Convert string to array
    NSMutableArray *wordArray = [[self.activeFocusWord.words componentsSeparatedByString:@","] mutableCopy];

    // Remove the word
    for (int i=0; i<wordArray.count; i++) {
        
        NSString * item = [wordArray objectAtIndex:i];
        
        if ([item isEqualToString:word] == YES) {
            [wordArray removeObject:item];
            break;
        }
    }
    
    // Convert array to string
    NSString * words = nil;
    
    if (wordArray.count > 0) {
        words = [wordArray componentsJoinedByString:@","];;
    }    
    
    // Update
    self.activeFocusWord.words = words;
    
    // Save
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
    
}

- (NSArray*) getActiveFocusWordArray {
    // Convert string to array
    NSArray *wordArray = [self.activeFocusWord.words componentsSeparatedByString:@","];
    
    if (wordArray == nil) {
        wordArray = [[NSArray alloc] init];
    }
    
    return wordArray;
}

- (void) resetActiveFocusWord {
    self.activeFocusWord.words = nil;
    
    // Save
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSError * error = nil;
    
    if ([moc save:&error] == NO) {
        NSLog(@"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    else {
        NSLog(@"Success saving core data");
    }
}

@end
