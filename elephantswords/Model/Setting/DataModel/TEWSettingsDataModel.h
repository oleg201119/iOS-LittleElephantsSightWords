//
//  TEWSettingsDataModel.h
//  elephantswords
//
//  Created by star on 4/27/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWSettingsDataModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (atomic) int avatar;
@property (atomic) int region;
@property (atomic) int style;
@property (atomic) int color;
@property (atomic) BOOL sound;

- (void) reset;

@end
