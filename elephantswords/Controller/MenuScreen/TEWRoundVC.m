//
//  TEWRoundVC.m
//  elephantswords
//
//  Created by star on 4/29/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWRoundVC.h"
#import "TEWLearnVC.h"
#import "TEWSettingVC.h"

#import "TEWProfileManager.h"
#import "TEWRoundManager.h"
#import "TEWFocusManager.h"
#import "TEWRotationManager.h"

#import "TEWGenericFunctionManager.h"

#import "Global.h"

@interface TEWRoundVC ()

@end

@implementation TEWRoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Load focus words
    TEWFocusManager * focusManager = [TEWFocusManager sharedInstance];
    TEWRoundManager * roundManager = [TEWRoundManager sharedInstance];
    TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
    
    int roundNo = roundManager.roundNo;
    NSString* userId = profileManager.activeProfile.uuid;
    
    NSString* focusId = [userId stringByAppendingFormat:@"-%d", roundNo];
    
    [focusManager loadFocusWords];
    [focusManager switchActiveFocusWord:focusId];
    
    if (focusManager.activeFocusWord == nil) {
        [focusManager createEmptyFocusWord: focusId];
        [focusManager loadFocusWords];
        [focusManager switchActiveFocusWord:focusId];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    if ([TEWRotationManager sharedInstance].animate == NO) {
        [super viewWillAppear:NO];
        [UIView setAnimationsEnabled:NO];
    }
    else {
        [super viewWillAppear:animated];
    }
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
}

- (void)viewDidAppear:(BOOL)animated {
    
    if ([TEWRotationManager sharedInstance].animate == NO) {
        [super viewDidAppear:NO];
        [UIView setAnimationsEnabled:YES];
    }
    else {
        [super viewDidAppear:animated];
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTouchLearnButton:(id)sender {
    
    // Go to learn screen
    [TEWRotationManager sharedInstance].animate = NO;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Play" bundle:nil];
    TEWLearnVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_LEARN"];
    [vc initWithFocusOption:NO];
    
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)onTouchFocusButton:(id)sender {
    
    // Go to focus screen
    [TEWRotationManager sharedInstance].animate = NO;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Play" bundle:nil];
    TEWLearnVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_LEARN"];
    [vc initWithFocusOption:YES];
    
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)onTouchResetButton:(id)sender {
    
    [[TEWFocusManager sharedInstance] resetActiveFocusWord];
    
    [TEWGenericFunctionManager showAlertWithMessage:@"Focus words were removed!"];
}

- (IBAction)onTouchBackButton:(id)sender {
    
    // Back
    [TEWRotationManager sharedInstance].animate = YES;
    
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (IBAction)onTouchSettingButton:(id)sender {
    // Go to setting screen
    [TEWRotationManager sharedInstance].animate = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TEWSettingVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTING"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onTouchFeedbackButton:(id)sender {
    NSString *str;
    NSString *appID = TEW_APP_ID;
    
    float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (ver >= 7.0 && ver < 7.1) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",appID];
    } else if (ver >= 8.0) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software",appID];
    } else {
        str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appID];
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
