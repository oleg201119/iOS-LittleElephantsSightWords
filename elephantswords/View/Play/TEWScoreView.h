//
//  TEWScoreView.h
//  elephantswords
//
//  Created by star on 6/2/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOMSMorphingLabel.h"

// Delegate protocol
@protocol TEWScoreViewDelegate

- (void)onTouchContinueButton;

@end

// ScoreView
@interface TEWScoreView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;


@property (weak, nonatomic) IBOutlet UIView *finishedView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton2;

@property (weak, nonatomic) IBOutlet UIView *scoreView;

@property (weak, nonatomic) IBOutlet UIImageView *animalImage;
@property (weak, nonatomic) IBOutlet UIImageView *starImage1;
@property (weak, nonatomic) IBOutlet UIImageView *starImage2;
@property (weak, nonatomic) IBOutlet UIImageView *starImage3;
@property (weak, nonatomic) IBOutlet UIImageView *starImage4;
@property (weak, nonatomic) IBOutlet UIImageView *starImage5;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) NSMutableArray* starImageArray;

// delegate
@property (nonatomic, assign) id <TEWScoreViewDelegate> delegate;

- (void) setScoreWithAvatar: (int)avatarId WithScore: (float)percent;

@end
