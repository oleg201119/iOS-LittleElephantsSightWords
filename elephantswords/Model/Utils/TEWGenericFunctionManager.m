//
//  TEWGenericFunctionManager.m
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWGenericFunctionManager.h"
#import "Global.h"
#import <UIKit/UIKit.h>

@implementation TEWGenericFunctionManager

#pragma mark -String Manipulation

+ (NSString *) refineNSString: (NSString *)sz {
    NSString *szResult = @"";
    if ((sz == nil) || ([sz isKindOfClass:[NSNull class]] == YES)) szResult = @"";
    else szResult = [NSString stringWithFormat:@"%@", sz];
    return szResult;
}

+ (int) refineInt:(id)value DefaultValue: (int) defValue {
    if (value == nil || [value isKindOfClass:[NSNull class]] == YES) return defValue;
    int v = defValue;
    @try {
        v = [value intValue];
    }
    @catch (NSException *exception) {
    }
    return v;
}

+ (BOOL) isValidEmailAddress: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

+ (NSString *) stripNonnumericsFromNSString :(NSString *) sz {
    NSString *szResult = sz;
    
    szResult = [[szResult componentsSeparatedByCharactersInSet: [[NSCharacterSet characterSetWithCharactersInString:@"0123456789*●"] invertedSet]] componentsJoinedByString:@""];
    return szResult;
}

+ (NSString *) getLongStringFromDate: (NSDate *) dt {
    if (dt == nil) return @"";
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:dt];
    return [NSString stringWithFormat:@"%02d-%02d-%04dT%02d:%02d", (int) dateComps.month, (int) dateComps.day, (int) dateComps.year, (int) dateComps.hour,  (int) dateComps.minute];
}

+ (NSString *) generateRandomString :(int) length {
    NSString *szPattern = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    for (int i = 0; i < length; i++) {
        [randomString appendFormat: @"%C", [szPattern characterAtIndex: arc4random_uniform((int)[szPattern length])]];
    }
    return randomString;
}

+ (NSString *) getBeautifiedDate: (NSDate *) dt {
    if (dt == nil) return @"";
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *compsDt = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday fromDate:dt];
    
    NSDateComponents *compsToday = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *compsTomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24]];
    
    if (compsToday.day == compsDt.day && compsToday.month == compsDt.month && compsToday.year == compsDt.year){
        return @"Today";
    }
    if (compsTomorrow.day == compsDt.day && compsTomorrow.month == compsDt.month && compsTomorrow.year == compsDt.year){
        return @"Tomorrow";
    }
    
    //    NSArray *arrWeekday = @[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"];
    NSArray *arrMonth = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
    //    NSString *szWeekday = [arrWeekday objectAtIndex:compsDt.weekday - 1];
    NSString *szMonth = [arrMonth objectAtIndex:compsDt.month - 1];
    NSString *szDay = [NSString stringWithFormat:@"%d", (int)(compsDt.day)];
    NSString *szYear = [NSString stringWithFormat:@"%d", (int) compsDt.year];
    //    return [NSString stringWithFormat:@"%@, %@ %@", szWeekday, szMonth, szDay];
    return [NSString stringWithFormat:@"%@ %@, %@", szMonth, szDay, szYear];
}

+ (NSString *) getBeautifiedLongDate: (NSDate *) dt {
    if (dt == nil) return @"";
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *compsDt = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday fromDate:dt];
    
    NSDateComponents *compsToday = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *compsTomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24]];
    
    if (compsToday.day == compsDt.day && compsToday.month == compsDt.month && compsToday.year == compsDt.year) {
        return @"Today";
    }
    if (compsTomorrow.day == compsDt.day && compsTomorrow.month == compsDt.month && compsTomorrow.year == compsDt.year) {
        return @"Tomorrow";
    }
    
    //    NSArray *arrWeekday = @[@"Sun", @"Monday", @"Tuesday", @"Wed", @"Thu", @"Fri", @"Sat"];
    NSArray *arrMonth = @[@"January", @"Feburary", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    //    NSString *szWeekday = [arrWeekday objectAtIndex:compsDt.weekday - 1];
    NSString *szMonth = [arrMonth objectAtIndex:compsDt.month - 1];
    NSString *szDay = [NSString stringWithFormat:@"%d", (int)(compsDt.day)];
    NSString *szYear = [NSString stringWithFormat:@"%d", (int) compsDt.year];
    //    return [NSString stringWithFormat:@"%@, %@ %@, %@", szWeekday, szMonth, szDay, szYear];
    return [NSString stringWithFormat:@"%@ %@, %@", szMonth, szDay, szYear];
}

+ (NSString *) getBeautifiedTime: (NSDate *) dt{
    if (dt == nil) return @"";
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *compsDt = [cal components: NSCalendarUnitHour | NSCalendarUnitMinute fromDate:dt];
    
    int nHour = (int) (compsDt.hour);
    int nMinute = (int) (compsDt.minute);
    NSString *szAMPM = @"am";
    
    if (nHour >= 12){
        nHour = nHour - 12;
        szAMPM = @"pm";
    }
    if (nHour == 0) nHour = 12;
    
    return [NSString stringWithFormat:@"%d:%02d %@", nHour, nMinute, szAMPM];
}

+ (NSString *) getBeautifiedRemainingTime: (NSDate *) dt {
    if (dt == nil) return @"";
    NSDate *dtToday = [NSDate date];
    NSDate *dt1, *dt2;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&dt1
                 interval:NULL forDate:dtToday];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&dt2
                 interval:NULL forDate:dt];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:dt1 toDate:dt2 options:0];
    
    int day = (int) difference.day;
    if (day < 0){
        return @"---";
    }
    else if (day == 0){
        int seconds = [dt timeIntervalSinceDate:dtToday];
        int minutes = seconds / 60;
        int hours = minutes / 60;
        
        if (hours > 0){
            if (minutes > 30) hours++;
            return [NSString stringWithFormat:@"In %d hours", hours];
        }
        
        if (minutes > 45) return @"In 1 hour";
        if (minutes > 30) return @"In 45 mins";
        if (minutes > 20) return @"In 30 mins";
        if (minutes > 15) return @"In 20 mins";
        if (minutes > 10) return @"In 15 mins";
        if (minutes > 5) return @"In 10 mins";
        return [NSString stringWithFormat:@"In %d mins", minutes];
    }
    else if (day == 1){
        return @"Tomorrow";
    }
    else if (day < 30){
        return [NSString stringWithFormat:@"In %d days", day];
    }
    else{
        return @"1 month+";
    }
    return @"";
}

+ (NSString *)getFormattedStringFromDateTime:(NSDate *)dt {
    // 8:50 PM, Today
    // 11:05 AM, Yesterday
    // 12:05 AM, 03/15/2015 (MM/dd/yyyy)
    
    if (dt == nil)
        return @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *compDateTime = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth
                                                           | NSCalendarUnitDay | NSCalendarUnitHour
                                                           | NSCalendarUnitMinute
                                                           | NSCalendarUnitSecond) fromDate:dt];
    
    NSDateComponents *compTemp = [calendar components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:dt];
    
    NSDate *aDate = [calendar dateFromComponents:compTemp];
    
    compTemp = [calendar components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [calendar dateFromComponents:compTemp];
    
    compTemp = [calendar components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate dateWithTimeIntervalSinceNow:(60 * 60 * 24)]];
    NSDate *yesterday = [calendar dateFromComponents:compTemp];
    
    NSString *szDate;
    if ([aDate isEqualToDate:today]){
        szDate = @"Today";
    }
    else if ([aDate isEqualToDate:yesterday]) {
        szDate = @"Yesterday";
    }
    else{
        szDate = [NSString stringWithFormat: @"%2d/%02d/%d", (int)[compDateTime month], (int)[compDateTime day], (int)[compDateTime year]];
    }
    
    NSString *szTime;
    int h = (int) [compDateTime hour];
    int m = (int) [compDateTime minute];
    NSString *szAMPM = @"AM";
    
    if (h == 0) {
        h = 12;
    }
    else if (h >= 12){
        szAMPM = @"PM";
        if (h > 12)
            h = h - 12;
    }
    
    szTime = [NSString stringWithFormat:@"%2d:%02d %@", h, m, szAMPM];
    return szTime;
}

+ (NSString *) getNormalizedStringFromDateTime:(NSDate *)dt {
    // yyyy-MM-dd HH:mm:ss zzz
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSString *stringFromDate = [formatter stringFromDate:dt];
    return stringFromDate;
}

+ (NSDate *) getDateTimeFromNormalizedString: (NSString *) sz {
    // yyyy-MM-dd HH:mm:ss zzz
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:sz];
    return dateFromString;
}

+ (NSString *) getNormalizedStringFromDate:(NSDate *)dt {
    // yyyy-MM-dd
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *stringFromDate = [formatter stringFromDate:dt];
    return stringFromDate;
}

+ (NSDate *) getDateFromNormalizedString: (NSString *) sz {
    // yyyy-MM-dd
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:sz];
    return dateFromString;
}

#pragma mark -UI

+ (void) showAlertWithMessage: (NSString *) szMessage {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:szMessage message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (void) showPromptViewWithTitle: (NSString *) title CancelButtonTitle: (NSString *) cancelButtonTitle OtherButtonTitle: (NSString *) otherButtonTitle Tag: (int) tag Delegate: (id) delegate {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
    alertView.tag = tag;
    
    [alertView show];
}

#pragma mark -Utils

+ (NSString *) getJSONStringRepresentation: (id) object {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    NSString *szResult = @"";
    if (!jsonData){
        NSLog(@"Error while serializing customer details into JSON\r\n%@", error.localizedDescription);
    }
    else{
        szResult = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return szResult;
}

+ (id) getObjectFromJSONStringRepresentation: (NSString *) sz {
    NSError *jsonError;
    NSData *objectData = [sz dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    if (jsonError != nil) return nil;
    return dict;
}

@end
