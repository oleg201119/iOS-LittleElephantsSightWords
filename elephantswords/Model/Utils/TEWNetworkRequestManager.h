//
//  TEWNetworkRequestManager.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWNetworkRequestManager : NSObject

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) GET: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock;
- (void) POST: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock;
- (void) PUT: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock;
- (void) DELETE: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock;

@end
