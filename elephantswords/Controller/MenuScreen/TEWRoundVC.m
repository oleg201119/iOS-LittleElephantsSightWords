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

@interface TEWRoundVC ()

@end

@implementation TEWRoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%d", self.nRoundNo);
}

- (void)viewDidAppear:(BOOL)animated {
    
    // Change orientation to landscape
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
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
}

@end
