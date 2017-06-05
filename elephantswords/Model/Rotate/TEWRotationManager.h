//
//  TEWRotationManager.h
//  elephantswords
//
//  Created by star on 6/2/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWRotationManager : NSObject

@property (atomic) BOOL animate;

+ (instancetype) sharedInstance;
- (void) initializeManager;

@end
