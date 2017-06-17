//
//  UIColor+Hex.h
//  elephantswords
//
//  Created by star on 6/18/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*) colorWithCSS: (NSString*) css;
+ (UIColor*) colorWithHex: (NSUInteger) hex;

- (uint)hex;
- (NSString*)hexString;
- (NSString*)cssString;

@end
