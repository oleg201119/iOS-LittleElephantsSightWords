//
//  TEWNetworkRequestManager.m
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWNetworkRequestManager.h"

#import "Global.h"
#import "TEWGenericFunctionManager.h"
#import "TEWErrorManager.h"
#import "AFNetworking.h"

@implementation TEWNetworkRequestManager

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id) init{
    if (self = [super init]) {
        [self initializeManager];
    }
    return self;
}

- (void) initializeManager {
}

- (void) GET: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock {
    AFHTTPSessionManager *managerAFSession = [AFHTTPSessionManager manager];
    managerAFSession.requestSerializer = [AFJSONRequestSerializer serializer];
    managerAFSession.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [managerAFSession.requestSerializer setValue:@"REST" forHTTPHeaderField:@"application-type"];
    
    TEWLOG(@"Network Request =>\nGET: %@\nParams: %@", szUrl, params);
    [managerAFSession GET:szUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dict = [TEWErrorManager getResponseObjectFromAFError:error];
        int status = [[TEWErrorManager sharedInstance] analyzeErrorResponse:error ResponseObject:dict];
        if (failureBlock) failureBlock(status, dict);
    }];
}

- (void) POST: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock {
    AFHTTPSessionManager *managerAFSession = [AFHTTPSessionManager manager];
    managerAFSession.requestSerializer = [AFJSONRequestSerializer serializer];
    managerAFSession.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [managerAFSession.requestSerializer setValue:@"REST" forHTTPHeaderField:@"application-type"];
    
    TEWLOG(@"Network Request =>\nPOST: %@\nParams: %@", szUrl, params);
    [managerAFSession POST:szUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dict = [TEWErrorManager getResponseObjectFromAFError:error];
        int status = [[TEWErrorManager sharedInstance] analyzeErrorResponse:error ResponseObject:dict];
        if (failureBlock) failureBlock(status, dict);
    }];
}

- (void) PUT: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock {
    AFHTTPSessionManager *managerAFSession = [AFHTTPSessionManager manager];
    managerAFSession.requestSerializer = [AFJSONRequestSerializer serializer];
    managerAFSession.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [managerAFSession.requestSerializer setValue:@"REST" forHTTPHeaderField:@"application-type"];
    
    
    TEWLOG(@"Network Request =>\nPUT: %@\nParams: %@", szUrl, params);
    [managerAFSession PUT:szUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dict = [TEWErrorManager getResponseObjectFromAFError:error];
        int status = [[TEWErrorManager sharedInstance] analyzeErrorResponse:error ResponseObject:dict];
        if (failureBlock) failureBlock(status, dict);
    }];
}

- (void) DELETE: (NSString *) szUrl requireAuth: (BOOL) requireAuth parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock {
    AFHTTPSessionManager *managerAFSession = [AFHTTPSessionManager manager];
    managerAFSession.requestSerializer = [AFJSONRequestSerializer serializer];
    managerAFSession.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [managerAFSession.requestSerializer setValue:@"REST" forHTTPHeaderField:@"application-type"];
    
    TEWLOG(@"Network Request =>\nDELETE: %@\nParams: %@", szUrl, params);
    [managerAFSession DELETE:szUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dict = [TEWErrorManager getResponseObjectFromAFError:error];
        int status = [[TEWErrorManager sharedInstance] analyzeErrorResponse:error ResponseObject:dict];
        if (failureBlock) failureBlock(status, dict);
    }];
}

@end
