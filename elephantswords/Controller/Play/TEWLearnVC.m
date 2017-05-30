//
//  TEWLearnVC.m
//  elephantswords
//
//  Created by star on 5/1/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWLearnVC.h"
#import "TEWScoreVC.h"
#import "Global.h"

@import AVFoundation;

@interface TEWLearnVC () <AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *textContainer;
@property (weak, nonatomic) IBOutlet UIButton *focusButton;

@property (atomic) BOOL fInitialized;
@property (atomic) BOOL fFocusScreen;
@property (atomic) int  nPageCount;

@property (strong, nonatomic) AVPlayer * player;

@end

@implementation TEWLearnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Change orientation to landscape
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
    
    self.textContainer.layer.cornerRadius = 10.0;
    self.fInitialized = NO;
    
    if (self.fFocusScreen) {
        UIImage *btnImage = [UIImage imageNamed:@"untag-gray"];
        [self.focusButton setImage:btnImage forState:UIControlStateNormal];
    }
    else {
        UIImage *btnImage = [UIImage imageNamed:@"tag-gray"];
        [self.focusButton setImage:btnImage forState:UIControlStateNormal];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.textContainer layoutSubviews];
    
    CGFloat parentWidth = self.scrollView.frame.size.width;
    CGFloat parentHeight = self.scrollView.frame.size.height;
    
    NSLog(@"%f", parentWidth);
    NSLog(@"%f", parentHeight);
    
    if (!self.fInitialized) {
        
        self.fInitialized = YES;
        
        UILabel * wordLabel = nil;
        
        for(int i=0; i<5; i++) {
            wordLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*parentWidth, 0, parentWidth, parentHeight)];
            wordLabel.textAlignment = NSTextAlignmentCenter;
            wordLabel.text = @"This is a test label";
            wordLabel.font = [UIFont boldSystemFontOfSize:32.0];
            wordLabel.textColor = TEWUICOLOR_WORDCOLOR_BLUE;
            wordLabel.backgroundColor = [UIColor clearColor];
        
            [self.scrollView addSubview:wordLabel];
        }
        
        CGSize newContentSize=self.scrollView.frame.size;
        newContentSize.width *=5;
        [self.scrollView setContentSize:newContentSize];
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

#pragma mark - button action
- (IBAction)onTouchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)onTouchSoundButton:(id)sender {
    
    // Play sound
    NSString * path = [NSString stringWithFormat:@"%@/test.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL * soundUrl = [NSURL fileURLWithPath:path];
    
    self.player = [AVPlayer playerWithURL:soundUrl];
    [self.player play];
}

- (IBAction)onTouchFocusButton:(id)sender {
    
    // Go to score screen
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Play" bundle:nil];
    TEWScoreVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SCORE"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onTouchHelpButton:(id)sender {
}

@end
