//
//  TEWSettingVC.m
//  elephantswords
//
//  Created by star on 4/29/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingVC.h"
#import "TEWSettingMenuTVC.h"
#import "TEWSettingProfileVC.h"
#import "TEWSettingNewsVC.h"
#import "TEWSettingAboutVC.h"
#import "TEWSettingWizardVC.h"
#import "TEWProfileManager.h"

#import <Social/Social.h>

#define SETTING_MENU_PROFILE                    0
#define SETTING_MENU_REGION                     1
#define SETTING_MENU_STYLE                      2
#define SETTING_MENU_COLOR                      3
#define SETTING_MENU_SOUND                      4
#define SETTING_MENU_RATE                       5
#define SETTING_MENU_NEWS                       6
#define SETTING_MENU_REPORT                     7
#define SETTING_MENU_ABOUT                      8

@interface TEWSettingVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary *menuDictionary;

@property (weak, nonatomic) IBOutlet UIButton *fbButton;
@property (weak, nonatomic) IBOutlet UIButton *twButton;
@property (weak, nonatomic) IBOutlet UIButton *emButton;

@end

@implementation TEWSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self initScreen];
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

#pragma mark - initialize
    
- (void) initScreen {
    self.fbButton.layer.cornerRadius = self.fbButton.frame.size.width / 2;
    self.fbButton.layer.masksToBounds = YES;
    self.fbButton.clipsToBounds = YES;
    
    self.twButton.layer.cornerRadius = self.twButton.frame.size.width / 2;
    self.twButton.layer.masksToBounds = YES;
    self.twButton.clipsToBounds = YES;
    
    self.emButton.layer.cornerRadius = self.emButton.frame.size.width / 2;
    self.emButton.layer.masksToBounds = YES;
    self.emButton.clipsToBounds = YES;
    
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
    
    [self initMenu];
}

- (void) initMenu {
    
    // Init menu fields
    self.menuDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Profile", [NSNumber numberWithInt:SETTING_MENU_PROFILE],
                           @"Spelling Region", [NSNumber numberWithInt:SETTING_MENU_REGION],
                           @"Writing Style", [NSNumber numberWithInt:SETTING_MENU_STYLE],
                           @"Text Colour", [NSNumber numberWithInt:SETTING_MENU_COLOR],
                           @"Sound Playback", [NSNumber numberWithInt:SETTING_MENU_SOUND],
                           @"Rate App", [NSNumber numberWithInt:SETTING_MENU_RATE],
                           @"What's New", [NSNumber numberWithInt:SETTING_MENU_NEWS],
                           @"Report Bug", [NSNumber numberWithInt:SETTING_MENU_REPORT],
                           @"About", [NSNumber numberWithInt:SETTING_MENU_ABOUT],
                           nil];
}

#pragma mark - Biz logic

- (void) gotoDetailsAtIndex: (int) index {
    
    if (index == SETTING_MENU_PROFILE) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingProfileVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTING_PROFILE"];
        [self.navigationController pushViewController:vc animated:YES];
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<<" style:UIBarButtonItemStylePlain target:nil action:nil];
        
    }
    else if (index == SETTING_MENU_REGION) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:NO allowBack:NO pageIndex:SETTING_WIZARD_REGION];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if (index == SETTING_MENU_STYLE) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:NO allowBack:NO pageIndex:SETTING_WIZARD_STYLE];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == SETTING_MENU_COLOR) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:NO allowBack:NO pageIndex:SETTING_WIZARD_COLOR];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == SETTING_MENU_SOUND) {
        // No action
    }
    else if (index == SETTING_MENU_RATE) {
        
    }
    else if (index == SETTING_MENU_NEWS) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingNewsVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_NEWS"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == SETTING_MENU_REPORT) {

    }
    else if (index == SETTING_MENU_ABOUT) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingAboutVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_ABOUT"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Cell config

- (void) configureCell:(TEWSettingMenuTVC *) cell AtIndex:(int) index {
    
    if (index == SETTING_MENU_SOUND) {
        cell.switchControlView.hidden = NO;
        
        if ([TEWProfileManager sharedInstance].activeProfile.sound == YES) {
            [cell.switchControl setOn:YES];
        }
        else {
            [cell.switchControl setOn:NO];
        }
                
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        cell.switchControlView.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back-chevron"]];
    }
    
    cell.menuLabel.text = [self.menuDictionary objectForKey:[NSNumber numberWithInt:index]];
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.menuDictionary count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *szIdentifier = @"TVC_SETTINGMENU";
    TEWSettingMenuTVC *cell = [tableView dequeueReusableCellWithIdentifier:szIdentifier];
    
    [self configureCell:cell AtIndex:(int) indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    [self gotoDetailsAtIndex:(int) indexPath.row];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

# pragma mark - Social button action

- (IBAction)onTouchTwitter:(id)sender {
    // Launch Twitter
}

- (IBAction)onTouchFacebook:(id)sender {
    // Launch Facebook
    
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://"]];
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        
        [fbController setInitialText:@"This is My Sample Text"];
        
        
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else {
        NSLog(@"Error");
    }
}

- (IBAction)onTouchEmail:(id)sender {
    // Launch Email
    
}

#pragma mark - navigation

- (IBAction)onTouchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - switch control value changed

- (IBAction)onSwitchValueChanged:(id)sender {
    
    TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
    UISwitch *s = (UISwitch*)sender;
    
    if (s.isOn == YES) {
        profileManager.activeProfile.sound = YES;
    }
    else {
        profileManager.activeProfile.sound = NO;
    }
    
    [profileManager saveProfiles];    
}

@end
