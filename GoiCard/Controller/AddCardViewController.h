//
//  AddCardViewController.h
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCardViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UITextField *tfKanji;
@property (strong, nonatomic) IBOutlet UITextField *tfHiragana;
@property (strong, nonatomic) IBOutlet UITextField *tfMean;
@property (strong, nonatomic) IBOutlet UITextView *tvExample;
- (IBAction)addButtonClick:(id)sender;
- (IBAction)backButtonClick:(id)sender;
@end
