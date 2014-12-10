//
//  TimeSettingViewController.m
//  GoiCard
//
//  Created by thangnh on 12/5/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "TimeSettingViewController.h"
#import "Constant.h"

@interface TimeSettingViewController (){
    NSArray *_pickerWordCountData;
    NSArray *_pickerTimeData;
    NSArray *_wordValue;
    NSArray *_timeValue;
    BOOL timePicker;
    BOOL wordPicker;
}

@end

@implementation TimeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _pickerWordCountData = [NSArray arrayWithObjects:@"5 từ", @"10 từ", @"15 từ", @"tất cả", nil];
    _wordValue = [NSArray arrayWithObjects:@"5", @"10", @"15", @"1000", nil];
    _pickerTimeData = [NSArray arrayWithObjects:@"10 min", @"20 min", nil];
    _timeValue = [NSArray arrayWithObjects:@"", @"", nil];
    [_doneBtn setHidden:YES];
    [_picker setHidden:YES];
    [_picker reloadAllComponents];
    NSString *numWord = [[NSUserDefaults standardUserDefaults] valueForKey:NUM_WORD_SETTING];
    [_wordSettingBtn setTitle:[NSString stringWithFormat:@"%@ từ", numWord] forState:0];
    NSString *time = [[NSUserDefaults standardUserDefaults] valueForKey:TIME_SETTING];
    [_timeSettingBtn setTitle:[NSString stringWithFormat:@"%@ phút", time] forState:0];
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

- (IBAction)numWordSetting:(id)sender {
    [_picker setHidden: NO];
    [_doneBtn setHidden:NO];
    timePicker = NO;
    [_picker reloadAllComponents];
}

- (IBAction)timeSetting:(id)sender {
    [_picker setHidden: NO];
    [_doneBtn setHidden:NO];
    timePicker = YES;
    [_picker reloadAllComponents];
}

- (IBAction)doneButtonClick:(id)sender {
    [_doneBtn setHidden:YES];
    [_picker setHidden:YES];
    
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - picker datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (timePicker) {
        return _pickerTimeData.count;
    }else
        return _pickerWordCountData.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (timePicker) {
        return _pickerTimeData[row];
    }else
        return _pickerWordCountData[row];
}
#pragma mark - picker delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (timePicker) {
        [[NSUserDefaults standardUserDefaults] setValue:[_timeValue objectAtIndex:row] forKey:TIME_SETTING];
    }else{
        [[NSUserDefaults standardUserDefaults]setValue:[_wordValue objectAtIndex:row] forKey:NUM_WORD_SETTING];
    }
}
@end
