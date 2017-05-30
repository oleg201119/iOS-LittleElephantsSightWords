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
#import "TEWProfile.h"

#import "TEWWordManager.h"

@interface TEWSplashVC ()

@end

@implementation TEWSplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Load active profile
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Profile"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"active == YES"]];
    
    NSError * error = nil;
    NSArray * results = [moc executeFetchRequest:request error:&error];
    
    if (!results) {
        NSLog(@"Error fetching Profile objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    else {
        // Load word data
//        TEWWordManager * wordManager = [TEWWordManager sharedInstance];
//        NSArray * words = [wordManager getWordsWithRoundNo:2];
        
        
        if ([results count] > 0) {
            // Load profile
            TEWProfile * profile = results[0];
            
            TEWSettingsManager * settingsManager = [TEWSettingsManager sharedInstance];
            
            [settingsManager.modelSettingInfo load:profile];
            
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
