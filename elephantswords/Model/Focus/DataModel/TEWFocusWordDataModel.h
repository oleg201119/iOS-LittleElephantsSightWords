//
//  TEWFocusWordDataModel.h
//  elephantswords
//
//  Created by star on 5/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TEWFocusWordDataModel : NSManagedObject

@property (strong, nonatomic) NSString *uuid;
@property (strong, nonatomic) NSString *words;

@end
