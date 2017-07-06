//
//  TEWPurchaseManager.h
//  elephantswords
//
//  Created by star on 6/19/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PRODUCT_ID_ALL400       @"com.gavin.elephantswords.all400words"
#define PRODUCT_ID_TO100        @"com.gavin.elephantswords.1to100words"
#define PRODUCT_ID_TO200        @"com.gavin.elephantswords.101to200words"
#define PRODUCT_ID_TO300        @"com.gavin.elephantswords.201to300words"
#define PRODUCT_ID_TO400        @"com.gavin.elephantswords.301to400words"

@interface TEWPurchaseManager : NSObject

@property (atomic) BOOL all400Purchased;
@property (atomic) BOOL to100Purchased;
@property (atomic) BOOL to200Purchased;
@property (atomic) BOOL to300Purchased;
@property (atomic) BOOL to400Purchased;

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) setPurchasedItem: (NSString *)productId;

@end
