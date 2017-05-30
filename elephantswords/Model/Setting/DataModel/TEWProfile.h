//
//  TEWProfile.h
//  elephantswords
//
//  Created by star on 5/3/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TEWProfile : NSManagedObject

@property (strong, nonatomic) NSString *name;
@property (atomic) int avatar;
@property (atomic) int region;
@property (atomic) int style;
@property (atomic) int color;
@property (atomic) BOOL sound;
@property (atomic) BOOL active;

@end
