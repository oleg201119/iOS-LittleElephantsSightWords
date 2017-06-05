//
//  TEWProfileDataModel.h
//  elephantswords
//
//  Created by star on 5/21/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TEWProfileDataModel : NSManagedObject

@property (strong, nonatomic) NSString *name;
@property (atomic) int avatar;
@property (atomic) int region;
@property (atomic) int style;
@property (atomic) int color;
@property (atomic) BOOL sound;
@property (atomic) BOOL active;
@property (strong, nonatomic) NSString *uuid;

@end
