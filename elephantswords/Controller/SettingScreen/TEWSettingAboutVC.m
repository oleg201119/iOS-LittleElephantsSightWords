//
//  TEWSettingAboutVC.m
//  elephantswords
//
//  Created by star on 4/30/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWSettingAboutVC.h"

@interface TEWSettingAboutVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TEWSettingAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

#pragma mark - init

- (void) initScreen {
    self.containerView.layer.cornerRadius = 10.0f;
}

#pragma mark - navigation

- (IBAction)onTouchNavBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
