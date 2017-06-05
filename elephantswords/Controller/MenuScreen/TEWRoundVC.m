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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Play" bundle:nil];
    TEWLearnVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_LEARN"];
    [vc initWithFocusOption:NO];
    
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)onTouchFocusButton:(id)sender {
    
    // Go to focus screen
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Play" bundle:nil];
    TEWLearnVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_LEARN"];
    [vc initWithFocusOption:YES];
    
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)onTouchResetButton:(id)sender {
    
    // Clear focus words
    NSString * userId = [TEWProfileManager sharedInstance].activeProfile.uuid;
    int roundNo = [TEWRoundManager sharedInstance].roundNo;
    
    [[TEWFocusManager sharedInstance] removeFocusWordsWithUserId:userId withRoundNo:roundNo];
    
    [TEWGenericFunctionManager showAlertWithMessage:@"Focus words were removed!"];
}

- (IBAction)onTouchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (IBAction)onTouchSettingButton:(id)sender {
    // Go to setting screen
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
