//
//  StudyCardViewController.h
//  GoiCard
//
//  Created by thangnh on 9/29/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudyCardViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lbWord;

- (IBAction)flipBtnFontCardClick:(id)sender;
- (IBAction)flipBackCardClick:(id)sender;
- (IBAction)forgetButtonClick:(id)sender;
- (IBAction)rememberButtonClick:(id)sender;
- (IBAction)settingButtonClick:(id)sender;
- (IBAction)backButtonClick:(id)sender;
- (IBAction)getNextCard:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *backCardView;
@property (nonatomic, assign) int level;
//back card view

@property (strong, nonatomic) IBOutlet UILabel *lbHiragana;
@property (strong, nonatomic) IBOutlet UILabel *lbMean;
@property (strong, nonatomic) IBOutlet UILabel *lbExample;
@end
