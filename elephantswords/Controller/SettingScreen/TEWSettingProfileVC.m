//
//  TEWSettingProfileVC.m
//  elephantswords
//
//  Created by star on 4/30/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingProfileVC.h"
#import "TEWProfileMenuTVC.h"
#import "TEWSettingWizardVC.h"
#import "TEWProfileManager.h"
#import "TEWFocusManager.h"
#import "TEWSettingsConstant.h"

#import "Global.h"
#import "TEWGenericFunctionManager.h"

#define PROFILE_MENU_EDIT_PROFILE               0
#define PROFILE_MENU_SWITCH_PROFILE             1
#define PROFILE_MENU_NEW_PROFILE                2
#define PROFILE_MENU_DELETE_PROFIILE            3

@interface TEWSettingProfileVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIView *avatarContainerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary *menuDictionary;

@end

@implementation TEWSettingProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMenu];
    [self initScreen];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setAvatar];
    [self setName];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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

- (void) setAvatar {
    int avatarId = [TEWProfileManager sharedInstance].activeProfile.avatar;
    
    if (avatarId == ANIMAL_1) {
        [self.avatarImageView setImage:[UIImage imageNamed:@"zebra-110"]];
    }
    else if (avatarId == ANIMAL_2) {
        [self.avatarImageView setImage:[UIImage imageNamed:@"giraffe-110"]];
    }
    else if (avatarId == ANIMAL_3) {
        [self.avatarImageView setImage:[UIImage imageNamed:@"elephant-110"]];
    }
}

- (void) setName {
    self.nameLabel.text = [TEWProfileManager sharedInstance].activeProfile.name;
}

- (void)initScreen {
    
    [self setAvatar];
    [self setName];
    
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.clipsToBounds = YES;
    self.avatarImageView.layer.borderWidth = 2;
    self.avatarImageView.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
    
    self.avatarContainerView.backgroundColor = [UIColor clearColor];
    self.avatarContainerView.layer.shadowColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
    self.avatarContainerView.layer.shadowOffset = CGSizeMake(0,0);
    self.avatarContainerView.layer.shadowOpacity = 1.0;
    self.avatarContainerView.layer.shadowRadius = 3;
}

- (void)initMenu {
    // Init menu fields
    self.menuDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Edit Profile", [NSNumber numberWithInt:PROFILE_MENU_EDIT_PROFILE],
                           @"Switch Profiles", [NSNumber numberWithInt:PROFILE_MENU_SWITCH_PROFILE],
                           @"Create New Profile", [NSNumber numberWithInt:PROFILE_MENU_NEW_PROFILE],
                           @"Delete Profile", [NSNumber numberWithInt:PROFILE_MENU_DELETE_PROFIILE],
                           nil];
}

#pragma mark - Biz logic

- (void) gotoDetailsAtIndex: (int) index {
    
    if (index == PROFILE_MENU_EDIT_PROFILE) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:NO allowBack:NO pageIndex:SETTING_WIZARD_ACCOUNT];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == PROFILE_MENU_SWITCH_PROFILE) {
        UIAlertController *alertController;
        
        alertController = [UIAlertController alertControllerWithTitle:nil
                                                              message:nil
                                                       preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            // Cancel action
        }]];
        
        TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
        
        for(int i=0; i<profileManager.profileArray.count; i++) {
            
            TEWProfileDataModel * profileInfo = profileManager.profileArray[i];
            TEWProfileDataModel * activeProfile = profileManager.activeProfile;
            
            if ([profileInfo.uuid isEqualToString:activeProfile.uuid] == YES) {
                continue;
            }
            
            [alertController addAction:[UIAlertAction actionWithTitle:profileInfo.name style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [profileManager switchActiveProfile:profileInfo.uuid];
                                
                [self setAvatar];
                [self setName];
            }]];
        }
        
        
        [alertController setModalPresentationStyle:UIModalPresentationPopover];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (index == PROFILE_MENU_NEW_PROFILE) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_SETTINGWIZARD"];
        
        [vc configureWizardMode:YES allowBack:YES pageIndex:SETTING_WIZARD_ACCOUNT];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == PROFILE_MENU_DELETE_PROFIILE) {
        
        
        UIAlertController *alertController;
        
        alertController = [UIAlertController alertControllerWithTitle:nil
                                                              message:nil
                                                       preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            // Cancel action
        }]];
        
        TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
        
        for(int i=0; i<profileManager.profileArray.count; i++) {
            
            TEWProfileDataModel * profileInfo = profileManager.profileArray[i];
            TEWProfileDataModel * activeProfile = profileManager.activeProfile;
            
            if ([profileInfo.uuid isEqualToString:activeProfile.uuid] == YES) {
                continue;
            }
            
            [alertController addAction:[UIAlertAction actionWithTitle:profileInfo.name style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                // Show confirm window
                UIAlertController *alertController = [UIAlertController
                                                    alertControllerWithTitle:@"Confirm"
                                                    message:@"You're deleting profile"
                                                    preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *removeAction = [UIAlertAction
                                              actionWithTitle:NSLocalizedString(@"Remove", @"Remove action")
                                              style:UIAlertActionStyleDestructive
                                              handler:^(UIAlertAction *action)
                                              {
                                                  NSLog(@"Remove action");
                                                  
                                                  // Delete profile
                                                  [profileManager removeProfile:profileInfo.uuid];
                                                  [profileManager loadProfiles];
                                                  
                                                  // Delete focus words
                                                  TEWFocusManager * focusManager = [TEWFocusManager sharedInstance];
                                                  
                                                  for (int i=0; i<5; i++) {
                                                      NSString* focusId = [profileInfo.uuid stringByAppendingFormat:@"-%d", i];
                                                      [focusManager removeFocusWord:focusId];
                                                  }
                                                  
                                                  [focusManager loadFocusWords];
                                                  
                                                  [self setAvatar];
                                                  [self setName];
                                              }];
                
                UIAlertAction *cancelAction = [UIAlertAction
                                               actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                               style:UIAlertActionStyleCancel
                                               handler:^(UIAlertAction *action)
                                               {
                                                   NSLog(@"Cancel action");
                                               }];
                
                [alertController addAction:removeAction];
                [alertController addAction:cancelAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
                
            }]];
        }
        
        [alertController setModalPresentationStyle:UIModalPresentationPopover];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Cell config

- (void) configureCell:(TEWProfileMenuTVC *) cell AtIndex:(int) index {
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back-chevron"]];
    
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
    static NSString *szIdentifier = @"TVC_PROFILEMENU";
    TEWProfileMenuTVC *cell = [tableView dequeueReusableCellWithIdentifier:szIdentifier];
    
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

#pragma mark - navigation

- (IBAction)onTouchBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
