//
//  TEWScoreView.m
//  elephantswords
//
//  Created by star on 6/2/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWScoreView.h"
#import "TEWSettingsConstant.h"

#define TEWSCORE_TITLE_AMAZING              @"Amazing!"
#define TEWSCORE_TITLE_FANTASTIC            @"Fantastic!"
#define TEWSCORE_TITLE_EXCELLENT            @"Excellent!"
#define TEWSCORE_TITLE_GREAT                @"Great!"
#define TEWSCORE_TITLE_WELLDONE             @"Well Done"
#define TEWSCORE_TITLE_GOODJOB              @"Good Job"
#define TEWSCORE_TITLE_KEEP                 @"Keep Practicing"

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
    
    self.starImageArray = [[NSMutableArray alloc] initWithCapacity:5];
    [self.starImageArray addObject:self.starImage1];
    [self.starImageArray addObject:self.starImage2];
    [self.starImageArray addObject:self.starImage3];
    [self.starImageArray addObject:self.starImage4];
    [self.starImageArray addObject:self.starImage5];
}

- (IBAction)onTouchContinueButton:(id)sender {
    [self.delegate onTouchContinueButton];
}

- (IBAction)onTouchContinueButton2:(id)sender {
    [self.delegate onTouchContinueButton];
}

- (void) setScoreWithAvatar: (int)avatarId WithScore: (float)percent {
    
    // Animal image
    NSString* prefixAnimal = @"";
    NSString* postfixMedal = @"";
    
    if (avatarId == ANIMAL_1) {
        prefixAnimal = @"giraffe-";
    }
    else if (avatarId == ANIMAL_2) {
        prefixAnimal = @"zebra-";
    }
    else if (avatarId == ANIMAL_3){
        prefixAnimal = @"elephant-";
    }
    
    if (percent == 100.0f) {
        // Gold
        postfixMedal = @"gold";
    }
    else if (percent >= 90.0f) {
        // Silver
        postfixMedal = @"silver";
    }
    else if (percent >= 80.0f) {
        // Bronze
        postfixMedal = @"bronze";
    }
    else if (percent >= 0.0f) {
        // Blue
        postfixMedal = @"blue";
    }
    
    UIImage *animalImage = [UIImage imageNamed:[prefixAnimal stringByAppendingString:postfixMedal]];
    
    [self.animalImage setImage:animalImage];
    
    // Star
    UIImage *starBorderImage = [UIImage imageNamed:@"star-border"];
    UIImage *starHalfImage = [UIImage imageNamed:@"star-half-fill"];
    UIImage *starFillImage = [UIImage imageNamed:@"star-fill"];
    
    float starValue = 0.0f;
    
    if (percent == 100.0f) {
        starValue = 5.0f;
    }
    else if (percent >= 95.0f) {
        starValue = 4.5f;
    }
    else if (percent >= 90.0f) {
        starValue = 4.0f;
    }
    else if (percent >= 85.0f) {
        starValue = 3.5f;
    }
    else if (percent >= 80.0f) {
        starValue = 3.0f;
    }
    else if (percent >= 75.0f) {
        starValue = 2.5f;
    }
    else if (percent >= 70.0f) {
        starValue = 2.0f;
    }
    else if (percent >= 65.0f) {
        starValue = 1.5f;
    }
    else if (percent >= 60.0f) {
        starValue = 1.0f;
    }
    else {
        starValue = 0.0f;
    }

    int nFillCount = (int)floor(starValue);
    int i = 0;
    
    for(i=0; i<nFillCount; i++) {
        [self.starImageArray[i] setImage:starFillImage];
    }
    
    if (starValue >= ((int)floor(starValue) + 0.5f)) {
        [self.starImageArray[i] setImage:starHalfImage];
        i++;
    }
    
    for(; i<5; i++) {
        [self.starImageArray[i] setImage:starBorderImage];
    }
    
    if (starValue == 5.0) {
        self.titleLabel.text = TEWSCORE_TITLE_AMAZING;
    }
    else if (starValue >= 4.5f) {
        self.titleLabel.text = TEWSCORE_TITLE_FANTASTIC;
    }
    else if (starValue >= 4.0f) {
        self.titleLabel.text = TEWSCORE_TITLE_EXCELLENT;
    }
    else if (starValue >= 3.5f) {
        self.titleLabel.text = TEWSCORE_TITLE_GREAT;
    }
    else if (starValue >= 3.0f) {
        self.titleLabel.text = TEWSCORE_TITLE_WELLDONE;
    }
    else if (starValue >= 2.5f) {
        self.titleLabel.text = TEWSCORE_TITLE_GOODJOB;
    }
    else if (starValue >= 2.0f) {
        self.titleLabel.text = TEWSCORE_TITLE_KEEP;
    }
    else {
        self.titleLabel.text = TEWSCORE_TITLE_KEEP;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
