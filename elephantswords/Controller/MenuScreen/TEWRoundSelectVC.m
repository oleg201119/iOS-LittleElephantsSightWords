//
//  TEWRoundSelectVC.m
//  elephantswords
//
//  Created by star on 4/28/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWRoundSelectVC.h"
#import "TEWRoundVC.h"
#import "TEWSettingVC.h"
#import "TEWRoundManager.h"
#import "TEWRotationManager.h"

#import "Global.h"

@interface TEWRoundSelectVC ()

@property (weak, nonatomic) IBOutlet UIView *round0View;
@property (weak, nonatomic) IBOutlet UIView *round1View;
@property (weak, nonatomic) IBOutlet UIView *round2View;
@property (weak, nonatomic) IBOutlet UIView *round3View;
@property (weak, nonatomic) IBOutlet UIView *round4View;

@end

@implementation TEWRoundSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self initScrollContent];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.    
}


#pragma mark - initialize

- (void)initScrollContent {
    
    self.round0View.layer.cornerRadius = self.round1View.frame.size.width / 2;
    self.round0View.layer.masksToBounds = YES;
    self.round0View.clipsToBounds = YES;
    self.round0View.layer.borderWidth = 2;
    self.round0View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;

    self.round1View.layer.cornerRadius = self.round1View.frame.size.width / 2;
    self.round1View.layer.masksToBounds = YES;
    self.round1View.clipsToBounds = YES;
    self.round1View.layer.borderWidth = 2;
    self.round1View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.round2View.layer.cornerRadius = self.round2View.frame.size.width / 2;
    self.round2View.layer.masksToBounds = YES;
    self.round2View.clipsToBounds = YES;
    self.round2View.layer.borderWidth = 2;
    self.round2View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.round3View.layer.cornerRadius = self.round3View.frame.size.width / 2;
    self.round3View.layer.masksToBounds = YES;
    self.round3View.clipsToBounds = YES;
    self.round3View.layer.borderWidth = 2;
    self.round3View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.round4View.layer.cornerRadius = self.round4View.frame.size.width / 2;
    self.round4View.layer.masksToBounds = YES;
    self.round4View.clipsToBounds = YES;
    self.round4View.layer.borderWidth = 2;
    self.round4View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
}

#pragma mark - Round button

- (IBAction)onTouchRoundButton:(UIControl *)sender {
    
    UIView * view = nil;
    
    if (sender.tag == 0) {
        [TEWRoundManager sharedInstance].roundNo = TEW_ROUND_0;
        view = self.round0View;
    }
    else if (sender.tag == 1) {
        [TEWRoundManager sharedInstance].roundNo = TEW_ROUND_1;
        view = self.round1View;
    }
    else if (sender.tag == 2) {
        [TEWRoundManager sharedInstance].roundNo = TEW_ROUND_2;
        view = self.round2View;
    }
    else if (sender.tag == 3) {
        [TEWRoundManager sharedInstance].roundNo = TEW_ROUND_3;
        view = self.round3View;
    }
    else if (sender.tag == 4) {
        [TEWRoundManager sharedInstance].roundNo = TEW_ROUND_4;
        view = self.round4View;
    }
    
    view.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    // Go to the round screen
    [TEWRotationManager sharedInstance].animate = YES;
    
    [self performSegueWithIdentifier:@"SEGUE_FROM_ROUNDSELECT_TO_ROUND" sender:nil];
}


- (IBAction)onTouchDown:(UIControl *)sender {
    
    UIView * view = nil;
    
    if (sender.tag == 0) {
        view = self.round0View;
    }
    else if (sender.tag == 1) {
        view = self.round1View;
    }
    else if (sender.tag == 2) {
        view = self.round2View;
    }
    else if (sender.tag == 3) {
        view = self.round3View;
    }
    else if (sender.tag == 4) {
        view = self.round4View;
    }
    
    view.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
}

- (IBAction)onTouchDragEnter:(UIControl *)sender {
    
    UIView * view = nil;
    
    if (sender.tag == 0) {
        view = self.round0View;
    }
    else if (sender.tag == 1) {
        view = self.round1View;
    }
    else if (sender.tag == 2) {
        view = self.round2View;
    }
    else if (sender.tag == 3) {
        view = self.round3View;
    }
    else if (sender.tag == 4) {
        view = self.round4View;
    }
    
    view.layer.borderColor = TEWUICOLOR_THEMECOLOR_GREEN.CGColor;
}

- (IBAction)onTouchDragExit:(UIControl *)sender {
    UIView * view = nil;
    
    if (sender.tag == 0) {
        view = self.round0View;
    }
    else if (sender.tag == 1) {
        view = self.round1View;
    }
    else if (sender.tag == 2) {
        view = self.round2View;
    }
    else if (sender.tag == 3) {
        view = self.round3View;
    }
    else if (sender.tag == 4) {
        view = self.round4View;
    }
    
    view.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
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
