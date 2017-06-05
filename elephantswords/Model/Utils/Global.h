//
//  Global.h
//  elephantswords
//
//  Created by star on 4/22/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#ifndef Global_h
#define Global_h

#include "UIColor+HexString.h"

#define DEBUG_LOGIN_DEFAULTUSER                                 YES

#define TEWLOG( s, ... ) NSLog( @"%s: %@ l=>%d", __FUNCTION__, [NSString stringWithFormat:(s), ##__VA_ARGS__], __LINE__ )

#define TEW_BASEURL                                             @"https://api.backendless.com/v1"

// APP ID
#define TEW_APP_ID                                              @"353372460"

// ROUND
#define TEW_ROUND_NONE                                          -1
#define TEW_ROUND_0                                             0
#define TEW_ROUND_1                                             1
#define TEW_ROUND_2                                             2
#define TEW_ROUND_3                                             3
#define TEW_ROUND_4                                             4

// UICOLOR
#define TEWUICOLOR_THEMECOLOR_GREEN                             [UIColor colorWithHexString:@"#73BE28"]
#define TEWUICOLOR_THEMECOLOR_YELLOW                            [UIColor colorWithHexString:@"#EEFA98"]
#define TEWUICOLOR_THEMECOLOR_TITLE                             [UIColor colorWithHexString:@"#4220B9"]

#define TEWUICOLOR_WORDCOLOR_BLACK                              [UIColor colorWithHexString:@"#000000"]
#define TEWUICOLOR_WORDCOLOR_BLUE                               [UIColor colorWithHexString:@"#0080FF"]
#define TEWUICOLOR_WORDCOLOR_GREEN                              [UIColor colorWithHexString:@"#73BE28"]
#define TEWUICOLOR_WORDCOLOR_RED                                [UIColor colorWithHexString:@"#FF0000"]


#define TEWUICOLOR_THEMECOLOR_MAIN                              [UIColor colorWithRed:(153 / 255.0) green:(198 / 255.0) blue:(20 / 255.0) alpha:1]
#define TEWUICOLOR_THEMECOLOR_DARKBLUE                          [UIColor colorWithRed:(52 / 255.0) green:(73 / 255.0) blue:(94 / 255.0) alpha:1]
#define TEWUICOLOR_THEMECOLOR_LIGHTBLUE                         [UIColor colorWithRed:(130 / 255.0) green:(157 / 255.0) blue:(185 / 255.0) alpha:1]
#define TEWUICOLOR_THEMECOLOR_INVALID                           [UIColor colorWithRed:(195 / 255.0) green:(28 / 255.0) blue:(28 / 255.0) alpha:1]
#define TEWUICOLOR_TEXTFIELD_BORDER                             [UIColor colorWithRed:(217 / 255.0) green:(223 / 255.0) blue:(223 / 255.0) alpha:1]
#define TEWUICOLOR_TEXTFIELD_BORDER_INVALID                     [UIColor colorWithRed:(195 / 255.0) green:(40 / 255.0) blue:(0 / 255.0) alpha:1]

// Error Code

#define ERROR_NONE                                                 0
#define ERROR_BAD_REQUEST                                        400
#define ERROR_CONNECTION_FAILED                                 1000
#define ERROR_USER_LOGIN_FAILED                                 1001
#define ERROR_USER_LOGIN_CANCELLED                              1002
#define ERROR_USER_REGISTER_FAILED                              1003
#define ERROR_USER_UPDATE_FAILED                                1004
#define ERROR_USER_SEARCH_FAILED                                1005
#define ERROR_USER_REGISTER_FAILED_PHONENUMBER_ALREADY_EXIST    1006
#define ERROR_USER_NOTFOUND                                     1007

// Notification

#define TEWLOCALNOTIFICATION_JOGGING_LISTUPDATED                @"TEWLOCALNOTIFICATION_JOGGING_LISTUPDATED"
#define TEWLOCALNOTIFICATION_USERS_LISTUPDATED                  @"TEWLOCALNOTIFICATION_USERS_LISTUPDATED"

#endif /* Global_h */
