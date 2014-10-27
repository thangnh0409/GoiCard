//
//  AddCardViewController.m
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "AddCardViewController.h"
#import "Card.h"
#import "DBManager.h"

@interface AddCardViewController ()
{
    Card *_card;
}

@end

@implementation AddCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _card = [[Card alloc]init];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonClick:(id)sender {
    _card.wordKanji = self.tfKanji.text;
    _card.wordHira = self.tfHiragana.text;
    _card.example = self.tvExample.text;
    _card.meanVi = self.tfMean.text;
    if ([_card.wordKanji isEqualToString:@""] || [_card.wordHira isEqualToString:@""] || [_card.example isEqualToString:@""] || [_card.meanVi isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Please input value!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        BOOL success = [[DBManager getInstance] addCard:_card];
        if (success) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"新カドーを追加うことを完成です!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            self.tfHiragana.text = @"";
            self.tfKanji.text = @"";
            self.tfMean.text = @"";
            self.tvExample.text = @"";
        }
    }
    
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setAnimationBeginInputTextWithPadding:(int)padding{
    [UIView animateWithDuration:0.3f animations:^{
        CGRect frame = self.mainView.frame;
        frame.origin.y -= padding;
        [self.mainView setFrame:frame];
    } completion:^(BOOL finished) {
        
    }];

}
- (void)setAnimationEndInputTextWithPadding:(int)padding
{
    [UIView animateWithDuration:0.4f animations:^{
        CGRect frame = self.mainView.frame;
        frame.origin.y += padding;
        [self.mainView setFrame:frame];
    } completion:^(BOOL finished) {
        
    }];

}
#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.tfMean) {
        [self setAnimationBeginInputTextWithPadding:25];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField == self.tfMean) {
        [self setAnimationEndInputTextWithPadding:25];
    }
    return YES;
}
#pragma mark - Text View delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        return [textView resignFirstResponder];
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self setAnimationBeginInputTextWithPadding:100];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self setAnimationEndInputTextWithPadding:100];
    return YES;
}
@end
