//
//  TEWAppManager.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWAppManager : NSObject

+ (instancetype) sharedInstance;
- (void) initializeManagersAfterLaunch;

@end
