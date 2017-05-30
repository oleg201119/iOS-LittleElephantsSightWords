//
//  TEWUrlManager.m
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWUrlManager.h"
#import "Global.h"

@implementation TEWUrlManager

#pragma mark -User

+ (NSString *) getEndpointForUserLogin {
    return [NSString stringWithFormat:@"%@/users/login", TEW_BASEURL];
}

+ (NSString *) getEndpointForUserRegistration {
    return [NSString stringWithFormat:@"%@/users/register", TEW_BASEURL];
}

#pragma mark -UserInfo

+ (NSString *) getEndpointForCreateUserInfo {
    return [NSString stringWithFormat:@"%@/data/UserInfo", TEW_BASEURL];
}

+ (NSString *) getEndpointForGetUserInfo {
    return [NSString stringWithFormat:@"%@/data/UserInfo", TEW_BASEURL];
}

+ (NSString *) getEndpointForGetUsersList {
    return [NSString stringWithFormat:@"%@/data/UserInfo", TEW_BASEURL];
}

+ (NSString *) getEndpointForUpdateUserWithObjectId: (NSString *) objectId {
    return [NSString stringWithFormat:@"%@/data/UserInfo/%@", TEW_BASEURL, objectId];
}

+ (NSString *) getEndpointForDeleteUserWithObjectId: (NSString *) objectId {
    return [NSString stringWithFormat:@"%@/data/UserInfo/%@", TEW_BASEURL, objectId];
}

@end
