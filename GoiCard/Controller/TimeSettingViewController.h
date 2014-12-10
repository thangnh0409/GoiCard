//
//  TimeSettingViewController.h
//  GoiCard
//
//  Created by thangnh on 12/5/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSettingViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIButton *doneBtn;
@property (strong, nonatomic) IBOutlet UIButton *wordSettingBtn;
@property (strong, nonatomic) IBOutlet UIButton *timeSettingBtn;

- (IBAction)numWordSetting:(id)sender;
- (IBAction)timeSetting:(id)sender;
- (IBAction)doneButtonClick:(id)sender;
- (IBAction)backButtonClick:(id)sender;
@end
