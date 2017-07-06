//
//  TEWPurchaseVC.m
//  elephantswords
//
//  Created by star on 6/19/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWPurchaseVC.h"
#import "TEWSettingVC.h"
#import "TEWRotationManager.h"
#import "TEWPurchaseManager.h"

#import "Global.h"

#import <StoreKit/StoreKit.h>

@interface TEWPurchaseVC () <SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (weak, nonatomic) IBOutlet UIView *all400View;
@property (weak, nonatomic) IBOutlet UIView *to100View;
@property (weak, nonatomic) IBOutlet UIView *to200View;
@property (weak, nonatomic) IBOutlet UIView *to300View;
@property (weak, nonatomic) IBOutlet UIView *to400View;

@end

@implementation TEWPurchaseVC

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - initialize

- (void)initScrollContent {
    
    self.to100View.layer.cornerRadius = self.to100View.frame.size.width / 2;
    self.to100View.layer.masksToBounds = YES;
    self.to100View.clipsToBounds = YES;
    self.to100View.layer.borderWidth = 2;
    self.to100View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.to200View.layer.cornerRadius = self.to200View.frame.size.width / 2;
    self.to200View.layer.masksToBounds = YES;
    self.to200View.clipsToBounds = YES;
    self.to200View.layer.borderWidth = 2;
    self.to200View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.to300View.layer.cornerRadius = self.to300View.frame.size.width / 2;
    self.to300View.layer.masksToBounds = YES;
    self.to300View.clipsToBounds = YES;
    self.to300View.layer.borderWidth = 2;
    self.to300View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.to400View.layer.cornerRadius = self.to400View.frame.size.width / 2;
    self.to400View.layer.masksToBounds = YES;
    self.to400View.clipsToBounds = YES;
    self.to400View.layer.borderWidth = 2;
    self.to400View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
    
    self.all400View.layer.cornerRadius = self.all400View.frame.size.width / 2;
    self.all400View.layer.masksToBounds = YES;
    self.all400View.clipsToBounds = YES;
    self.all400View.layer.borderWidth = 2;
    self.all400View.layer.borderColor = TEWUICOLOR_THEMECOLOR_YELLOW.CGColor;
}

#pragma mark - navigation

- (IBAction)onTouchBackButton:(id)sender {
    // Back
    [TEWRotationManager sharedInstance].animate = YES;
    
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark - purchase

- (IBAction)onTouchAll400Button:(id)sender {
    NSLog(@"User requests to purchase all 400 words");
    
    if([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PRODUCT_ID_ALL400]];
        productsRequest.delegate = self;
        [productsRequest start];
    }
    else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (IBAction)onTouchTo100Button:(id)sender {
    NSLog(@"User requests to purchase 1-100 word list");
    
    if([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PRODUCT_ID_TO100]];
        productsRequest.delegate = self;
        [productsRequest start];
    }
    else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (IBAction)onTouchTo200Button:(id)sender {
    NSLog(@"User requests to purchase 101-200 word list");
    
    if([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PRODUCT_ID_TO200]];
        productsRequest.delegate = self;
        [productsRequest start];
    }
    else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (IBAction)onTouchTo300Button:(id)sender {
    NSLog(@"User requests to purchase 201-300 word list");
    
    if([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PRODUCT_ID_TO300]];
        productsRequest.delegate = self;
        [productsRequest start];
    }
    else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (IBAction)onTouchTo400Button:(id)sender {
    NSLog(@"User requests to purchase 301-400 word list");
    
    if([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PRODUCT_ID_TO400]];
        productsRequest.delegate = self;
        [productsRequest start];
    }
    else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (IBAction)onTouchRestoreButton:(id)sender {
    NSLog(@"User requests to restore purchase");
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

#pragma mark - payment

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    
    SKProduct *validProduct = nil;
    int count = (int)[response.products count];
    
    if(count > 0){
        validProduct = [response.products objectAtIndex:0];
        NSLog(@"Products Available!");
        [self purchase:validProduct];
    }
    else if(!validProduct){
        NSLog(@"No products available");
        //this is called if your product id is not valid, this shouldn't be called unless that happens.
    }
}

- (void)purchase:(SKProduct *)product {
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    NSLog(@"received restored transactions: %lu", (unsigned long)queue.transactions.count);
    
    for(SKPaymentTransaction *transaction in queue.transactions){
        if(transaction.transactionState == SKPaymentTransactionStateRestored){
            //called when the user successfully restores a purchase
            NSLog(@"Transaction state -> Restored");

            NSString *productID = transaction.payment.productIdentifier;
            
            if([productID isEqualToString:PRODUCT_ID_ALL400] == YES) {
                
            }
            
            if([productID isEqualToString:PRODUCT_ID_TO100] == YES) {
                
            }
            
            if([productID isEqualToString:PRODUCT_ID_TO200] == YES) {
                
            }
            
            if([productID isEqualToString:PRODUCT_ID_TO300] == YES) {
                
            }
            
            if([productID isEqualToString:PRODUCT_ID_TO400] == YES) {
                
            }
            
            [self didPurchaseItem:productID];
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            break;
        }
    }   
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    
    for(SKPaymentTransaction *transaction in transactions){
        //if you have multiple in app purchases in your app,
        //you can get the product identifier of this transaction
        //by using transaction.payment.productIdentifier
        //
        //then, check the identifier against the product IDs
        //that you have defined to check which product the user
        //just purchased
        
        NSString *productID = transaction.payment.productIdentifier;
        
        switch(transaction.transactionState){
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"Transaction state -> Purchasing");
                break;
                
            case SKPaymentTransactionStatePurchased:
                //this is called when the user has successfully purchased the package (Cha-Ching!)
                [self didPurchaseItem:productID];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                break;
                
            case SKPaymentTransactionStateRestored:
                NSLog(@"Transaction state -> Restored");
                //add the same code as you did from SKPaymentTransactionStatePurchased here
                [self didPurchaseItem:productID];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                //called when the transaction does not finish
                if(transaction.error.code == SKErrorPaymentCancelled) {
                    NSLog(@"Transaction state -> Cancelled");
                }
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateDeferred:
                break;
        }
    }
}

- (void)didPurchaseItem:(NSString *)productId {
    
    [[TEWPurchaseManager sharedInstance] setPurchasedItem:productId];
}

@end
