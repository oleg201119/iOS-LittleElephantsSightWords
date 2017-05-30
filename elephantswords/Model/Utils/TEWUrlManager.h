//
//  TEWUrlManager.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWUrlManager : NSObject

#pragma mark -User

+ (NSString *) getEndpointForUserLogin;
+ (NSString *) getEndpointForUserRegistration;

#pragma mark -UserInfo

+ (NSString *) getEndpointForCreateUserInfo;
+ (NSString *) getEndpointForGetUserInfo;
+ (NSString *) getEndpointForGetUsersList;
+ (NSString *) getEndpointForUpdateUserWithObjectId: (NSString *) objectId;
+ (NSString *) getEndpointForDeleteUserWithObjectId: (NSString *) objectId;

@end
