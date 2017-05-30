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

#import "UIColor+HexString.h"
#import "Global.h"

@interface TEWRoundSelectVC ()
@property (weak, nonatomic) IBOutlet UIView *round0View;
@property (weak, nonatomic) IBOutlet UIView *round1View;
@property (weak, nonatomic) IBOutlet UIView *round2View;
@property (weak, nonatomic) IBOutlet UIView *round3View;
@property (weak, nonatomic) IBOutlet UIView *round4View;

// Round number
@property (atomic) int nRoundNo;

@end

@implementation TEWRoundSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self initScrollContent];
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
    TEWRoundVC * vc = [segue destinationViewController];
    vc.nRoundNo = self.nRoundNo;
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
    NSLog(@"onTouchRoundButton %ld", (long)sender.tag);
    
    if (sender.tag == 0) {
        self.nRoundNo = ROUND_0;
    }
    else if (sender.tag == 1) {
        self.nRoundNo = ROUND_1;
    }
    else if (sender.tag == 2) {
        self.nRoundNo = ROUND_2;
    }
    else if (sender.tag == 3) {
        self.nRoundNo = ROUND_3;
    }
    else if (sender.tag == 4) {
        self.nRoundNo = ROUND_4;
    }
    
    
    // Go to the round screen
    [self performSegueWithIdentifier:@"SEGUE_FROM_ROUNDSELECT_TO_ROUND" sender:nil];
    
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
