//
//  TEWSettingWizardVC.h
//  elephantswords
//
//  Created by star on 4/25/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DLRadioButton/DLRadioButton.h>

#define SETTING_WIZARD_ACCOUNT              0
#define SETTING_WIZARD_REGION               1
#define SETTING_WIZARD_STYLE                2
#define SETTING_WIZARD_COLOR                3

@interface TEWSettingWizardVC : UIViewController

// Wizard mode
@property (atomic) BOOL fWizardMode;

// Allow back
@property (atomic) BOOL fAllowBack;

// Page number
@property (atomic) int nCurrentPage;

- (void)configureWizardMode:(BOOL)wizardMode allowBack: (BOOL)allowBack pageIndex: (int) pageIndex;

@end
