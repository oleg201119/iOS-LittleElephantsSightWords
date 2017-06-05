//
//  TEWGenericFunctionManager.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEWGenericFunctionManager : NSObject

#pragma mark -String Manipulation

+ (NSString *) refineNSString: (NSString *)sz;
+ (int) refineInt:(id)value DefaultValue: (int) defValue;
+ (BOOL) isValidEmailAddress: (NSString *) candidate;
+ (NSString *) getLongStringFromDate: (NSDate *) dt;
+ (NSString *) stripNonnumericsFromNSString :(NSString *) sz;
+ (NSString *) generateRandomString :(int) length;
+ (NSString *) getBeautifiedDate: (NSDate *) dt;
+ (NSString *) getBeautifiedLongDate: (NSDate *) dt;
+ (NSString *) getBeautifiedTime: (NSDate *) dt;
+ (NSString *) getBeautifiedRemainingTime: (NSDate *) dt;
+ (NSString *)getFormattedStringFromDateTime:(NSDate *)dt;
+ (NSString *) getNormalizedStringFromDateTime:(NSDate *)dt;
+ (NSDate *) getDateTimeFromNormalizedString: (NSString *) sz;
+ (NSString *) getNormalizedStringFromDate:(NSDate *)dt;
+ (NSDate *) getDateFromNormalizedString: (NSString *) sz;

#pragma mark -UI

+ (void) showAlertWithMessage: (NSString *) szMessage;
+ (void) showPromptViewWithTitle: (NSString *) title CancelButtonTitle: (NSString *) cancelButtonTitle OtherButtonTitle: (NSString *) otherButtonTitle Tag: (int) tag Delegate: (id) delegate;

#pragma mark -Utils

+ (NSString *) getJSONStringRepresentation: (id) object;
+ (id) getObjectFromJSONStringRepresentation: (NSString *) sz;

#pragma mark -UUID

+ (NSString *) getUUID;

@end
