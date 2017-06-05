//
//  TEWLearnVC.m
//  elephantswords
//
//  Created by star on 5/1/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWLearnVC.h"
#import "TEWScoreVC.h"

#import "TEWScoreView.h"
#import "TEWWordView.h"

#import "TEWProfileManager.h"
#import "TEWRoundManager.h"
#import "TEWFocusManager.h"
#import "TEWWordManager.h"
#import "TEWRotationManager.h"
#import "TEWSettingsConstant.h"

#import "Global.h"

#import <AVFoundation/AVFoundation.h>

@interface TEWLearnVC () <UIScrollViewDelegate, TEWScoreViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *textContainer;
@property (weak, nonatomic) IBOutlet UIButton *focusButton;

@property (weak, nonatomic) IBOutlet UILabel *pageNumberText;

@property (atomic) BOOL fInitialized;
@property (atomic) BOOL fFocusScreen;
@property (atomic) int  nWordIndex;

@property (strong, nonatomic) AVAudioPlayer * player;

@property (strong, nonatomic) TEWScoreView * scoreView;
@property (weak, nonatomic) IBOutlet UIView *topBarView;

@property (weak, nonatomic) IBOutlet UIView *bottomBarView;
@end

@implementation TEWLearnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textContainer.layer.cornerRadius = 10.0;
    self.fInitialized = NO;
    
    // Set image for tag button
    if (self.fFocusScreen) {
        UIImage *btnImage = [UIImage imageNamed:@"untag-gray"];
        [self.focusButton setImage:btnImage forState:UIControlStateNormal];
    }
    else {
        UIImage *btnImage = [UIImage imageNamed:@"tag-gray"];
        [self.focusButton setImage:btnImage forState:UIControlStateNormal];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [UIView setAnimationsEnabled:NO];
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [UIView setAnimationsEnabled:YES];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.textContainer layoutSubviews];
    
    CGFloat parentWidth = self.scrollView.frame.size.width;
    CGFloat parentHeight = self.scrollView.frame.size.height;

    
    if (!self.fInitialized) {
        
        self.fInitialized = YES;
        self.nWordIndex = 1;

        if (self.fFocusScreen) {
            // Focus screen
            TEWFocusManager * focusManager = [TEWFocusManager sharedInstance];
            
            [focusManager resetWordArray];
            [focusManager loadWords];
            
            NSMutableArray * wordArray = focusManager.wordArray;
            
            int i = 0;
            
            for(i=0; i<wordArray.count; i++) {
                int colorId = [TEWProfileManager sharedInstance].activeProfile.color;
                
                if ([TEWProfileManager sharedInstance].activeProfile.color == COLOR_ALTERNATE) {
                    colorId = i % 4 + COLOR_BLACK;
                }
                
                UIColor * color = nil;
                
                if (colorId == COLOR_BLACK) {
                    color = TEWUICOLOR_WORDCOLOR_BLACK;
                }
                else if (colorId == COLOR_BLUE) {
                    color = TEWUICOLOR_WORDCOLOR_BLUE;
                }
                else if (colorId == COLOR_GREEN) {
                    color = TEWUICOLOR_WORDCOLOR_GREEN;
                }
                else if (colorId == COLOR_RED) {
                    color = TEWUICOLOR_WORDCOLOR_RED;
                }
                
                
                TEWWordView * wordView = [[TEWWordView alloc] initWithFrame:CGRectMake(i*parentWidth, 0, parentWidth, parentHeight)];
                
                wordView.textContainer.layer.cornerRadius = 10.0;
                
                wordView.textContainer.layer.shadowOffset = CGSizeMake(0, 1);
                wordView.textContainer.layer.shadowOpacity = 0.5;
                wordView.textContainer.layer.shadowRadius = 3;
                
                wordView.wordLabel.text = wordArray[i];
                wordView.wordLabel.textColor = color;
                
                [self.scrollView addSubview:wordView];
            }
            
            // Score view
            self.scoreView = [[TEWScoreView alloc] initWithFrame:CGRectMake(i*parentWidth, 0, parentWidth, parentHeight)];
            self.scoreView.delegate = self;
            [self.scrollView addSubview:self.scoreView];
            
            // Resize scroll view
            CGSize newContentSize=self.scrollView.frame.size;
            newContentSize.width *=(wordArray.count + 1);
            [self.scrollView setContentSize:newContentSize];
            
            self.pageNumberText.text = [NSString stringWithFormat:@"%d", self.nWordIndex];
        }
        else {
            // Learn screen
            
            NSArray * wordArray = [[TEWWordManager sharedInstance] getWordsWithRoundNo:[TEWRoundManager sharedInstance].roundNo];
            
            int i = 0;
            
            for(i=0; i<wordArray.count; i++) {
                
                int colorId = [TEWProfileManager sharedInstance].activeProfile.color;
                
                if ([TEWProfileManager sharedInstance].activeProfile.color == COLOR_ALTERNATE) {
                    colorId = i % 4 + COLOR_BLACK;
                }
                
                UIColor * color = nil;
                
                if (colorId == COLOR_BLACK) {
                    color = TEWUICOLOR_WORDCOLOR_BLACK;
                }
                else if (colorId == COLOR_BLUE) {
                    color = TEWUICOLOR_WORDCOLOR_BLUE;
                }
                else if (colorId == COLOR_GREEN) {
                    color = TEWUICOLOR_WORDCOLOR_GREEN;
                }
                else if (colorId == COLOR_RED) {
                    color = TEWUICOLOR_WORDCOLOR_RED;
                }
                
                
                TEWWordView * wordView = [[TEWWordView alloc] initWithFrame:CGRectMake(i*parentWidth, 0, parentWidth, parentHeight)];
                
                wordView.textContainer.layer.cornerRadius = 10.0;
                
                
                wordView.textContainer.layer.shadowOffset = CGSizeMake(0, 1);
                wordView.textContainer.layer.shadowOpacity = 0.5;
                wordView.textContainer.layer.shadowRadius = 3;
                
                wordView.wordLabel.text = wordArray[i];
                wordView.wordLabel.textColor = color;
                
                [self.scrollView addSubview:wordView];
            }
            
            // Score view
            self.scoreView = [[TEWScoreView alloc] initWithFrame:CGRectMake(i*parentWidth, 0, parentWidth, parentHeight)];
            self.scoreView.delegate = self;
            [self.scrollView addSubview:self.scoreView];
            
            // Resize scroll view
            CGSize newContentSize=self.scrollView.frame.size;
            newContentSize.width *=(wordArray.count + 1);
            [self.scrollView setContentSize:newContentSize];
            
            self.pageNumberText.text = [NSString stringWithFormat:@"%d", self.nWordIndex];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initWithFocusOption: (BOOL)focusOption {
    self.fFocusScreen = focusOption;
}

- (void)initScreen {
    self.textContainer.layer.cornerRadius = 10.0f;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.nWordIndex = self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 1;
    self.pageNumberText.text = [NSString stringWithFormat:@"%d", self.nWordIndex];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
    
    self.nWordIndex = self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 1;
    self.pageNumberText.text = [NSString stringWithFormat:@"%d", self.nWordIndex];
    
    NSArray * wordArray = [[TEWWordManager sharedInstance] getWordsWithRoundNo:[TEWRoundManager sharedInstance].roundNo];
    
    if (self.nWordIndex == wordArray.count) {
        [self.scoreView beforeShowView];
    }
    else if (self.nWordIndex == (wordArray.count + 1)) {
        
        // Hide top bar and bottom bar
        self.topBarView.hidden = YES;
        self.bottomBarView.hidden = YES;
        
        [self.scoreView.completeLabel setAnimationDuration:0.5];
        
        [self.scoreView.completeLabel setText:@"Complete !" withCompletionBlock:^{
            
            [UIView animateWithDuration:1.0f animations:^{
                
                [self.scoreView.scoreView setAlpha:0.0f];
                [self.scoreView.completeLabel setAlpha:1.0f];
                
            } completion:^(BOOL finished) {
                
                //fade out
                [UIView animateWithDuration:1.0f animations:^{
                    
                    [self.scoreView.scoreView setAlpha:1.0f];
                    [self.scoreView.completeLabel setAlpha:0.0f];
                    
                    self.scrollView.scrollEnabled = NO;
                    
                } completion:nil];
                
            }];
        }];
    }
}

#pragma mark - ScoreView delegate

- (void) onTouchContinueButton {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - button action
- (IBAction)onTouchBackButton:(id)sender {
    
    [TEWRotationManager sharedInstance].animate = NO;
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)onTouchSoundButton:(id)sender {
    
    // Play sound
    NSString * path = [NSString stringWithFormat:@"%@/Marlene_Marker %02d.mp3", [[NSBundle mainBundle] resourcePath], self.nWordIndex];
    NSURL * soundUrl = [NSURL fileURLWithPath:path];

    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [self.player setVolume:1.0];
    [self.player play];
}

- (IBAction)onTouchFocusButton:(id)sender {

    TEWFocusManager * focusManager = [TEWFocusManager sharedInstance];
    
    
    if (self.fFocusScreen) {
        // Focus screen
        NSMutableArray * wordArray = focusManager.wordArray;
        
        [focusManager removeWord:wordArray[self.nWordIndex-1]];
        
        // Refresh screen
    }
    else {
        // Learn screen
        NSArray * wordArray = [[TEWWordManager sharedInstance] getWordsWithRoundNo:[TEWRoundManager sharedInstance].roundNo];
        
        [focusManager addWord:wordArray[self.nWordIndex-1]];
    }
}

- (IBAction)onTouchHelpButton:(id)sender {
}

@end
