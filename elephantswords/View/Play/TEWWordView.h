//
//  TEWWordView.h
//  elephantswords
//
//  Created by star on 6/3/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEWWordView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *textContainer;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;

@end
