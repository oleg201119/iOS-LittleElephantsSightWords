//
//  TEWScoreView.m
//  elephantswords
//
//  Created by star on 6/2/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWScoreView.h"

@implementation TEWScoreView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void)initView {
    [[NSBundle mainBundle] loadNibNamed:@"ScoreView" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

- (void)beforeShowView {
    [self.completeLabel setAlpha:1.0f];
    [self.scoreView setAlpha:0.0f];
}

- (void)afterShowView {
    [self.completeLabel setAlpha:0.0f];
    [self.scoreView setAlpha:1.0f];
}

- (IBAction)onTouchContinueButton:(id)sender {
    [self.delegate onTouchContinueButton];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
