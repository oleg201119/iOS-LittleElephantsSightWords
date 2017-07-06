//
//  TEWSplashVC.m
//  elephantswords
//
//  Created by star on 5/3/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSplashVC.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "TEWSettingsManager.h"
#import "TEWSettingWizardVC.h"
#import "TEWRoundSelectVC.h"
#import "TEWProfileManager.h"

#import "TEWWordManager.h"

@interface TEWSplashVC ()

@end

@implementation TEWSplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. 
    
    // Load profiles
    [[TEWProfileManager sharedInstance] loadProfiles];
    
    if ([TEWProfileManager sharedInstance].activeProfile != nil) {
        
        // Go to round selection screen
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_ROUNDSELECT"];
     
        [self.navigationController pushViewController:vc animated:NO];
    }
    else {
        // This is first launch and will go to wizard screen
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:YES allowBack:NO pageIndex:SETTING_WIZARD_ACCOUNT];
        
        [self.navigationController pushViewController:vc animated:NO];
    }
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

#pragma mark - biz


@end
