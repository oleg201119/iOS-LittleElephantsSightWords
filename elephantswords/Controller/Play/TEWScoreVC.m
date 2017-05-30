//
//  TEWScoreVC.m
//  elephantswords
//
//  Created by star on 5/1/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWScoreVC.h"
#import "SettingsConstant.h"

#define TEWSCORE_TITLE_AMAZING              @"Amazing!"
#define TEWSCORE_TITLE_FANTASTIC            @"Fantastic!"
#define TEWSCORE_TITLE_EXCELLENT            @"Excellent!"
#define TEWSCORE_TITLE_GREAT                @"Great!"
#define TEWSCORE_TITLE_WELLDONE             @"Well Done"
#define TEWSCORE_TITLE_GOODJOB              @"Good Job"
#define TEWSCORE_TITLE_KEEP                 @"Keep Practicing"



@interface TEWScoreVC ()

@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;

@property (weak, nonatomic) IBOutlet UIImageView *starImage1;
@property (weak, nonatomic) IBOutlet UIImageView *starImage2;
@property (weak, nonatomic) IBOutlet UIImageView *starImage3;
@property (weak, nonatomic) IBOutlet UIImageView *starImage4;
@property (weak, nonatomic) IBOutlet UIImageView *starImage5;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) NSMutableArray* imgViewArray;

@end

@implementation TEWScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgViewArray = [[NSMutableArray alloc] initWithCapacity:5];
    [self.imgViewArray addObject:self.starImage1];
    [self.imgViewArray addObject:self.starImage2];
    [self.imgViewArray addObject:self.starImage3];
    [self.imgViewArray addObject:self.starImage4];
    [self.imgViewArray addObject:self.starImage5];
    
    // Set score
    [self initRatingViewWithScore:3.5];
    
    // Set animal
    [self initAnimalWithScore:3.5 Animal: ANIMAL_2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - rating view

- (void)initAnimalWithScore: (float)score Animal: (int)animal {
    
    NSString* prefixAnimal = @"";
    NSString* postfixMedal = @"";
    
    if (animal == ANIMAL_1) {
        prefixAnimal = @"giraffe-";
    }
    else if (animal == ANIMAL_2) {
        prefixAnimal = @"zebra-";
    }
    else {
        prefixAnimal = @"elephant-";
    }
    
    if (score == 5) {
        // Gold
        postfixMedal = @"gold";
    }
    else if (score >= 4) {
        // Silver
        postfixMedal = @"silver";
    }
    else if (score >= 3) {
        // Bronze
        postfixMedal = @"bronze";
    }
    else {
        // Blue
        postfixMedal = @"blue";
    }
    
    UIImage *animalImage = [UIImage imageNamed:[prefixAnimal stringByAppendingString:postfixMedal]];
 
    [self.animalImageView setImage:animalImage];
}

- (void)initRatingViewWithScore: (float)score {
    
    UIImage *starBorderImage = [UIImage imageNamed:@"star-border"];
    UIImage *starHalfImage = [UIImage imageNamed:@"star-half-fill"];
    UIImage *starFillImage = [UIImage imageNamed:@"star-fill"];
    
    int nFillCount = (int)floor(score);
    int i = 0;
    
    for(i=0; i<nFillCount; i++) {
        [self.imgViewArray[i] setImage:starFillImage];
    }
    
    if (score >= ((int)floor(score) + 0.5)) {
        [self.imgViewArray[i] setImage:starHalfImage];
        i++;
    }
    
    for(; i<5; i++) {
        [self.imgViewArray[i] setImage:starBorderImage];
    }
    
    if (score == 5.0) {
        self.titleLabel.text = TEWSCORE_TITLE_AMAZING;
    }
    else if (score >= 4.5) {
        self.titleLabel.text = TEWSCORE_TITLE_FANTASTIC;
    }
    else if (score >= 4) {
        self.titleLabel.text = TEWSCORE_TITLE_EXCELLENT;
    }
    else if (score >= 3.5) {
        self.titleLabel.text = TEWSCORE_TITLE_GREAT;
    }
    else if (score >= 3) {
        self.titleLabel.text = TEWSCORE_TITLE_WELLDONE;
    }
    else if (score >= 2.5) {
        self.titleLabel.text = TEWSCORE_TITLE_GOODJOB;
    }
    else if (score >= 2) {
        self.titleLabel.text = TEWSCORE_TITLE_KEEP;
    }
    else {
        self.titleLabel.text = TEWSCORE_TITLE_KEEP;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - button action

- (IBAction)onTouchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onTouchContinueButton:(id)sender {
    
}



@end
