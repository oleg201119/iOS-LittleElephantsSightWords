//
//  TEWSettingWizardVC.m
//  elephantswords
//
//  Created by star on 4/25/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingWizardVC.h"
#import "TEWSettingsConstant.h"
#import "TEWGenericFunctionManager.h"
#import "TEWSettingsManager.h"
#import "TEWProfileManager.h"

#import "Global.h"
#import "AppDelegate.h"

#import <UIView+Shake.h>

#define FOTTER_FOR_NEXT                     0
#define FOOTER_FOR_BACKNEXT                 1
#define FOOTER_FOR_CANCELSAVE               2

@interface TEWSettingWizardVC () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *navBackButton;
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
    
// Scroll page
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

// Footer
@property (weak, nonatomic) IBOutlet UIView *bottomViewForNext;
@property (weak, nonatomic) IBOutlet UIView *bottomViewForBackNext;
@property (weak, nonatomic) IBOutlet UIView *bottomViewForCancelSave;

// Wizard 1
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView3;

@property (weak, nonatomic) IBOutlet UIView *animalContainer1;
@property (weak, nonatomic) IBOutlet UIView *animalContainer2;
@property (weak, nonatomic) IBOutlet UIView *animalContainer3;

// Wizard 2
@property (weak, nonatomic) IBOutlet DLRadioButton *regionNAButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *regionUKButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *regionAUButton;

@property (weak, nonatomic) IBOutlet UIImageView *animalImageViewOnWizard2;
@property (weak, nonatomic) IBOutlet UIView *animalContainerOnWizard2;
@property (weak, nonatomic) IBOutlet UILabel *characterNameOnWizard2;

// Wizard 3
@property (weak, nonatomic) IBOutlet DLRadioButton *styleStdButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *styleUnJoinButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *styleJoinButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *styleDislexButton;

@property (weak, nonatomic) IBOutlet UIImageView *animalImageViewOnWizard3;
@property (weak, nonatomic) IBOutlet UIView *animalContainerOnWizard3;
@property (weak, nonatomic) IBOutlet UILabel *characterNameOnWizard3;

// Wizard 4
@property (weak, nonatomic) IBOutlet UISwitch *soundSwitch;

@property (weak, nonatomic) IBOutlet DLRadioButton *colorBlackButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *colorBlueButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *colorGreenButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *colorRedButton;
@property (weak, nonatomic) IBOutlet DLRadioButton *colorAltButton;

@property (weak, nonatomic) IBOutlet UIImageView *animalImageViewOnWizard4;
@property (weak, nonatomic) IBOutlet UIView *animalContainerOnWizard4;
@property (weak, nonatomic) IBOutlet UILabel *characterNameOnWizard4;

// Container
@property (weak, nonatomic) IBOutlet UIView *wizardContainer1;
@property (weak, nonatomic) IBOutlet UIView *wizardContainer2;
@property (weak, nonatomic) IBOutlet UIView *wizardContainer3;
@property (weak, nonatomic) IBOutlet UIView *wizardContainer4;

@end

@implementation TEWSettingWizardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initScreen];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self initScrollContent];
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

- (void)configureWizardMode:(BOOL)wizardMode allowBack: (BOOL)allowBack pageIndex: (int) pageIndex {
 
    self.fWizardMode = wizardMode;
    self.fAllowBack = allowBack;
    self.nCurrentPage = pageIndex;
}

- (void)initScrollContent {
    
    // Wizard 1
    self.animalImageView1.layer.cornerRadius = self.animalImageView1.frame.size.width / 2;
    self.animalImageView1.layer.masksToBounds = YES;
    self.animalImageView1.clipsToBounds = YES;
    self.animalImageView1.layer.borderWidth = 2;
    
    self.animalContainer1.backgroundColor = [UIColor clearColor];
    self.animalContainer1.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainer1.layer.shadowOpacity = 1.0;
    self.animalContainer1.layer.shadowRadius = 3;
    
    self.animalImageView2.layer.cornerRadius = self.animalImageView2.frame.size.width / 2;
    self.animalImageView2.layer.masksToBounds = YES;
    self.animalImageView2.clipsToBounds = YES;
    self.animalImageView2.layer.borderWidth = 2;
    
    self.animalContainer2.backgroundColor = [UIColor clearColor];
    self.animalContainer2.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainer2.layer.shadowOpacity = 1.0;
    self.animalContainer2.layer.shadowRadius = 3;
    
    self.animalImageView3.layer.cornerRadius = self.animalImageView3.frame.size.width / 2;
    self.animalImageView3.layer.masksToBounds = YES;
    self.animalImageView3.clipsToBounds = YES;
    self.animalImageView3.layer.borderWidth = 2;
    
    self.animalContainer3.backgroundColor = [UIColor clearColor];
    self.animalContainer3.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainer3.layer.shadowOpacity = 1.0;
    self.animalContainer3.layer.shadowRadius = 3;
    
    // Wizard 2
    self.animalImageViewOnWizard2.layer.cornerRadius = self.animalImageViewOnWizard2.frame.size.width / 2;
    self.animalImageViewOnWizard2.layer.masksToBounds = YES;
    self.animalImageViewOnWizard2.clipsToBounds = YES;
    self.animalImageViewOnWizard2.layer.borderWidth = 2;
    
    self.animalContainerOnWizard2.backgroundColor = [UIColor clearColor];
    self.animalContainerOnWizard2.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainerOnWizard2.layer.shadowOpacity = 1.0;
    self.animalContainerOnWizard2.layer.shadowRadius = 3;
    
    self.animalImageViewOnWizard2.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainerOnWizard2.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    // Wizard 3
    self.animalImageViewOnWizard3.layer.cornerRadius = self.animalImageViewOnWizard3.frame.size.width / 2;
    self.animalImageViewOnWizard3.layer.masksToBounds = YES;
    self.animalImageViewOnWizard3.clipsToBounds = YES;
    self.animalImageViewOnWizard3.layer.borderWidth = 2;
    
    self.animalContainerOnWizard3.backgroundColor = [UIColor clearColor];
    self.animalContainerOnWizard3.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainerOnWizard3.layer.shadowOpacity = 1.0;
    self.animalContainerOnWizard3.layer.shadowRadius = 3;
    
    self.animalImageViewOnWizard3.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainerOnWizard3.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    // Wizard 4
    self.animalImageViewOnWizard4.layer.cornerRadius = self.animalImageViewOnWizard4.frame.size.width / 2;
    self.animalImageViewOnWizard4.layer.masksToBounds = YES;
    self.animalImageViewOnWizard4.clipsToBounds = YES;
    self.animalImageViewOnWizard4.layer.borderWidth = 2;
    
    self.animalContainerOnWizard4.backgroundColor = [UIColor clearColor];
    self.animalContainerOnWizard4.layer.shadowOffset = CGSizeMake(0,0);
    self.animalContainerOnWizard4.layer.shadowOpacity = 1.0;
    self.animalContainerOnWizard4.layer.shadowRadius = 3;
    
    self.animalImageViewOnWizard4.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainerOnWizard4.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
}

- (void)initScreen {
    
    if (self.fAllowBack == YES) {
        self.navBackButton.hidden = NO;
    }
    else {
        self.navBackButton.hidden = YES;
    }
    
    self.wizardContainer1.layer.cornerRadius = 10.0f;
    self.wizardContainer2.layer.cornerRadius = 10.0f;
    self.wizardContainer3.layer.cornerRadius = 10.0f;
    self.wizardContainer4.layer.cornerRadius = 10.0f;
    
    self.userNameText.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.userNameText.layer.shadowOffset = CGSizeMake(0,0);
    self.userNameText.layer.shadowOpacity = 1.0;
    self.userNameText.layer.shadowRadius = 3;
    self.userNameText.layer.borderWidth = 2;
    self.userNameText.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    // Init settings manager
    TEWSettingsManager * settingManager = [TEWSettingsManager sharedInstance];

    if (self.fWizardMode == YES) {
        [settingManager.modelSettingInfo reset];
    }
    else {
        [settingManager setWithActiveProfile];
    }
    
    // Set name
    self.userNameText.text = settingManager.modelSettingInfo.name;
    
    // Set avatar
    [self changeSelectedAnimal:settingManager.modelSettingInfo.avatar];
    
    // Set region
    [self changeSelectedRegion:settingManager.modelSettingInfo.region];

    // Set style
    [self changeSelectedStyle:settingManager.modelSettingInfo.style];
    
    // Set color
    [self changeSelectedColor:settingManager.modelSettingInfo.color];
    
    // Set sound
    [self.soundSwitch setOn:settingManager.modelSettingInfo.sound animated:NO];
    
    // Set animal on Wizard2
    [self setAvatarOnWizard2];
    
    // Set animal on Wizard3
    [self setAvatarOnWizard3];
    
    // Go to page
    [self scrollToPage:self.nCurrentPage withAnimation:false];
}

#pragma mark - Biz logic

- (BOOL) checkMandatoryFields {
    
    if (self.nCurrentPage == SETTING_WIZARD_ACCOUNT) {
        
        if (self.userNameText.text.length == 0) {
            [TEWGenericFunctionManager showAlertWithMessage:@"Please enter your name"];
            return NO;
        }
        
        if ([TEWSettingsManager sharedInstance].modelSettingInfo.avatar == ANIMAL_NONE) {
            [TEWGenericFunctionManager showAlertWithMessage:@"Please select a persona"];
            return NO;
        }
    }
    else if (self.nCurrentPage == SETTING_WIZARD_REGION) {
        if ([TEWSettingsManager sharedInstance].modelSettingInfo.region == REGION_NONE) {
            [TEWGenericFunctionManager showAlertWithMessage:@"Please select a region"];
            return NO;
        }
    }
    else if (self.nCurrentPage == SETTING_WIZARD_STYLE) {
        if ([TEWSettingsManager sharedInstance].modelSettingInfo.style == STYLE_NONE) {
            [TEWGenericFunctionManager showAlertWithMessage:@"Please select a typeface"];
            return NO;
        }
    }
    else if (self.nCurrentPage == SETTING_WIZARD_COLOR) {
        if ([TEWSettingsManager sharedInstance].modelSettingInfo.color == COLOR_NONE) {
            [TEWGenericFunctionManager showAlertWithMessage:@"Please select a color"];
            return NO;
        }
    }
    
    return YES;
}
    
- (void) changeSelectedAnimal: (long) animalId {
    
    self.animalImageView1.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainer1.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalImageView2.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainer2.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalImageView3.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    self.animalContainer3.layer.shadowColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    if (animalId == 1) {
        [TEWSettingsManager sharedInstance].modelSettingInfo.avatar = ANIMAL_1;
        self.animalImageView1.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
        self.animalContainer1.layer.shadowColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
    }
    else if (animalId == 2) {
        [TEWSettingsManager sharedInstance].modelSettingInfo.avatar = ANIMAL_2;
        self.animalImageView2.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
        self.animalContainer2.layer.shadowColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
    }
    else if (animalId == 3) {
        [TEWSettingsManager sharedInstance].modelSettingInfo.avatar = ANIMAL_3;
        self.animalImageView3.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
        self.animalContainer3.layer.shadowColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
    }
    
    [self setAvatarOnWizard2];
    [self setAvatarOnWizard3];
    [self setAvatarOnWizard4];
}

- (void) setAvatarOnWizard2 {
    int avatarId = [TEWProfileManager sharedInstance].activeProfile.avatar;
    NSString * name = [TEWProfileManager sharedInstance].activeProfile.name;
    
    if (avatarId == ANIMAL_1) {
        [self.animalImageViewOnWizard2 setImage:[UIImage imageNamed:@"zebra-110"]];
    }
    else if (avatarId == ANIMAL_2) {
        [self.animalImageViewOnWizard2 setImage:[UIImage imageNamed:@"giraffe-110"]];
    }
    else if (avatarId == ANIMAL_3) {
        [self.animalImageViewOnWizard2 setImage:[UIImage imageNamed:@"elephant-110"]];
    }
    
    self.characterNameOnWizard2.text = name;
}

- (void) setAvatarOnWizard3 {
    int avatarId = [TEWProfileManager sharedInstance].activeProfile.avatar;
    NSString * name = [TEWProfileManager sharedInstance].activeProfile.name;
    
    if (avatarId == ANIMAL_1) {
        [self.animalImageViewOnWizard3 setImage:[UIImage imageNamed:@"zebra-110"]];
    }
    else if (avatarId == ANIMAL_2) {
        [self.animalImageViewOnWizard3 setImage:[UIImage imageNamed:@"giraffe-110"]];
    }
    else if (avatarId == ANIMAL_3) {
        [self.animalImageViewOnWizard3 setImage:[UIImage imageNamed:@"elephant-110"]];
    }
    
    self.characterNameOnWizard3.text = name;
}

- (void) setAvatarOnWizard4 {
    int avatarId = [TEWProfileManager sharedInstance].activeProfile.avatar;
    NSString * name = [TEWProfileManager sharedInstance].activeProfile.name;
    
    if (avatarId == ANIMAL_1) {
        [self.animalImageViewOnWizard4 setImage:[UIImage imageNamed:@"zebra-110"]];
    }
    else if (avatarId == ANIMAL_2) {
        [self.animalImageViewOnWizard4 setImage:[UIImage imageNamed:@"giraffe-110"]];
    }
    else if (avatarId == ANIMAL_3) {
        [self.animalImageViewOnWizard4 setImage:[UIImage imageNamed:@"elephant-110"]];
    }
    
    self.characterNameOnWizard4.text = name;
}

- (void) changeSelectedRegion: (int) regionId {
    self.regionUKButton.selected = NO;
    self.regionNAButton.selected = NO;
    self.regionAUButton.selected = NO;
    
    if (regionId == REGION_UK) {
        self.regionUKButton.selected = YES;
    }
    else if (regionId == REGION_NA) {
        self.regionNAButton.selected = YES;
    }
    else if (regionId == REGION_AU) {
        self.regionAUButton.selected = YES;
    }
}

- (void) changeSelectedStyle: (int)styleId {
    self.styleStdButton.selected = NO;
    self.styleUnJoinButton.selected = NO;
    self.styleJoinButton.selected = NO;
    self.styleDislexButton.selected = NO;
    
    if (styleId == STYLE_STANDARD) {
        self.styleStdButton.selected = YES;
    }
    else if (styleId == STYLE_UNJOINED) {
        self.styleUnJoinButton.selected = YES;
    }
    else if (styleId == STYLE_JOINED) {
        self.styleJoinButton.selected = YES;
    }
    else if (styleId == STYLE_DISLEXIE) {
        self.styleDislexButton.selected = YES;
    }
}

- (void) changeSelectedColor: (int)colorId {
    self.colorBlackButton.selected = NO;
    self.colorBlueButton.selected = NO;
    self.colorGreenButton.selected = NO;
    self.colorRedButton.selected = NO;
    self.colorAltButton.selected = NO;
    
    if (colorId == COLOR_BLACK) {
        self.colorBlackButton.selected = YES;
    }
    else if (colorId == COLOR_BLUE) {
        self.colorBlueButton.selected = YES;
    }
    else if (colorId == COLOR_GREEN) {
        self.colorGreenButton.selected = YES;
    }
    else if (colorId == COLOR_RED) {
        self.colorRedButton.selected = YES;
    }
    else if (colorId == COLOR_ALTERNATE ) {
        self.colorAltButton.selected = YES;
    }
}

- (void) shakeInvalidFields: (UIView *) viewContainer {
    
    [viewContainer shake:6 withDelta:8 speed:0.07];
}

#pragma mark - Scroll To Page

- (void)setActiveFooter:(int)footerId {
    
    self.bottomViewForNext.hidden = YES;
    self.bottomViewForBackNext.hidden = YES;
    self.bottomViewForCancelSave.hidden = YES;
    
    switch(footerId) {
        case FOTTER_FOR_NEXT:
            self.bottomViewForNext.hidden = NO;
            break;
        case FOOTER_FOR_BACKNEXT:
            self.bottomViewForBackNext.hidden = NO;
            break;
        case FOOTER_FOR_CANCELSAVE:
            self.bottomViewForCancelSave.hidden = NO;
            break;
        default:
            break;
            
    }
}

- (void)goBack {
    [self scrollToPage:self.nCurrentPage-1 withAnimation:YES];
}

- (void)goNext {
    if (self.fWizardMode == YES && self.nCurrentPage == SETTING_WIZARD_COLOR) {
        
        // Save profile
        TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
        TEWSettingsManager * settingsManager = [TEWSettingsManager sharedInstance];
        BOOL active = NO;
        
        if (profileManager.activeProfile == nil) {
            active = YES;
        }
        
        [profileManager createNewProfileWithName:settingsManager.modelSettingInfo.name WithAvatar:settingsManager.modelSettingInfo.avatar WithRegion:settingsManager.modelSettingInfo.region WithStyle:settingsManager.modelSettingInfo.style WithColor:settingsManager.modelSettingInfo.color WithSound:settingsManager.modelSettingInfo.sound WithActive:active];

        // Reload profiles
        [profileManager loadProfiles];
        
        // Go to round selection screen
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TEWSettingWizardVC * vc = [storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_ROUNDSELECT"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        [self scrollToPage:self.nCurrentPage+1 withAnimation:YES];
    }
}

- (void)scrollToPage:(NSInteger)nPage withAnimation:(BOOL)animated {
    
    if (nPage < 0) return;
    if (nPage > 3) return;
    
    self.nCurrentPage = (int)nPage;
    
    float pageWidth = [self.scrollView frame].size.width;
    [self.scrollView setContentOffset:CGPointMake(self.nCurrentPage * pageWidth, 0) animated:animated];
    
    if (self.fWizardMode == YES) {
        switch(self.nCurrentPage) {
            case SETTING_WIZARD_ACCOUNT:
                [self setActiveFooter:FOTTER_FOR_NEXT];
                break;
            case SETTING_WIZARD_REGION:
                [self setActiveFooter:FOOTER_FOR_BACKNEXT];
                break;
            case SETTING_WIZARD_STYLE:
                [self setActiveFooter:FOOTER_FOR_BACKNEXT];
                break;
            case SETTING_WIZARD_COLOR:
                [self setActiveFooter:FOOTER_FOR_BACKNEXT];
                break;
            default:
                break;
        }
    }
    else {
        [self setActiveFooter:FOOTER_FOR_CANCELSAVE];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
    NSLog(@"scrollViewDidEndDecelerating");
}

- (void)setIndicatorForCurrentPage {
    [self.pageControl setCurrentPage:self.nCurrentPage];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setIndicatorForCurrentPage];
}

#pragma mark - Bottom panel Back/Next/Finish button action

- (IBAction)onTouchBackButton:(id)sender {
    NSLog(@"onTouchBackButton");
    
    [self goBack];
}

- (IBAction)onTouchNextButton:(id)sender {
    NSLog(@"onTouchNextButton");
    
    if ([self checkMandatoryFields] == YES) {
        if (self.nCurrentPage == SETTING_WIZARD_ACCOUNT) {
            [TEWSettingsManager sharedInstance].modelSettingInfo.name = self.userNameText.text;
        }
        else if (self.nCurrentPage == SETTING_WIZARD_REGION) {
            //
        }
        else if (self.nCurrentPage == SETTING_WIZARD_STYLE) {
            //
        }
        else if (self.nCurrentPage == SETTING_WIZARD_COLOR) {
            
            if ([self.soundSwitch isOn]) {
                [TEWSettingsManager sharedInstance].modelSettingInfo.sound = YES;
            }
            else {
                [TEWSettingsManager sharedInstance].modelSettingInfo.sound = NO;
            }
        }
        
        [self goNext];
    }
}

- (IBAction)onTouchCancelButton:(id)sender {
    NSLog(@"onTouchCancelButton");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onTouchSaveButton:(id)sender {
    NSLog(@"onTouchSaveButton");
    
    if ([self checkMandatoryFields] == YES) {
        if (self.nCurrentPage == SETTING_WIZARD_ACCOUNT) {
            [TEWSettingsManager sharedInstance].modelSettingInfo.name = self.userNameText.text;
        }
        else if (self.nCurrentPage == SETTING_WIZARD_REGION) {
            //
        }
        else if (self.nCurrentPage == SETTING_WIZARD_STYLE) {
            //
        }
        else if (self.nCurrentPage == SETTING_WIZARD_COLOR) {
            
            if ([self.soundSwitch isOn]) {
                [TEWSettingsManager sharedInstance].modelSettingInfo.sound = YES;
            }
            else {
                [TEWSettingsManager sharedInstance].modelSettingInfo.sound = NO;
            }
        }
        
        // Save profile
        TEWProfileManager * profileManager = [TEWProfileManager sharedInstance];
        TEWSettingsManager * settingsManager = [TEWSettingsManager sharedInstance];
        
        [profileManager updateActiveProfileWithName:settingsManager.modelSettingInfo.name WithAvatar:settingsManager.modelSettingInfo.avatar WithRegion:settingsManager.modelSettingInfo.region WithStyle:settingsManager.modelSettingInfo.style WithColor:settingsManager.modelSettingInfo.color WithSound:settingsManager.modelSettingInfo.sound];
        
        // Reload profiles
        [profileManager loadProfiles];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Wizard 1 Animal button action

- (IBAction)onTouchAnimalButton:(UIControl *)sender {
    NSLog(@"onTouchAnimalButton %ld", (long)sender.tag);
    
    [self changeSelectedAnimal: (long)sender.tag];
}

#pragma mark - Wizard 2 Radio button action

- (IBAction)onSelectRegionButton:(UIControl *)sender {
    NSLog(@"onSelectRegionButton %ld", (long)sender.tag);    
    
    TEWSettingsManager * settingManager = [TEWSettingsManager sharedInstance];
    
    if (sender.tag == 1) {
        settingManager.modelSettingInfo.region = REGION_NA;
    }
    else if (sender.tag == 2) {
        settingManager.modelSettingInfo.region = REGION_UK;
    }
    else if (sender.tag == 3) {
        settingManager.modelSettingInfo.region = REGION_AU;
    }    
}

#pragma mark - Wizard 3 Radio button action

- (IBAction)onSelectStyleButton:(UIControl *)sender {
    NSLog(@"onSelectStyleButton %ld", (long)sender.tag);
    
    TEWSettingsManager * settingManager = [TEWSettingsManager sharedInstance];
    
    if (sender.tag == 1) {
        settingManager.modelSettingInfo.style = STYLE_STANDARD;
    }
    else if (sender.tag == 2) {
        settingManager.modelSettingInfo.style = STYLE_UNJOINED;
    }
    else if (sender.tag == 3) {
        settingManager.modelSettingInfo.style = STYLE_JOINED;
    }
    else if (sender.tag == 4) {
        settingManager.modelSettingInfo.style = STYLE_DISLEXIE;
    }
}

#pragma mark - Wizard 4 Radio button action
- (IBAction)onSelectColorButton:(UIControl *)sender {
    NSLog(@"onSelectColorButton %ld", (long)sender.tag);
    
    TEWSettingsManager * settingManager = [TEWSettingsManager sharedInstance];
    
    if (sender.tag == 1) {
        settingManager.modelSettingInfo.color = COLOR_BLACK;
    }
    else if (sender.tag == 2) {
        settingManager.modelSettingInfo.color = COLOR_BLUE;
    }
    else if (sender.tag == 3) {
        settingManager.modelSettingInfo.color = COLOR_GREEN;
    }
    else if (sender.tag == 4) {
        settingManager.modelSettingInfo.color = COLOR_RED;
    }
    else if (sender.tag == 5) {
        settingManager.modelSettingInfo.color = COLOR_ALTERNATE;
    }
}

#pragma mark - navigation

- (IBAction)onTouchNavBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
