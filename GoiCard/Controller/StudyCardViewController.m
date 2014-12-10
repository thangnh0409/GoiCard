//
//  StudyCardViewController.m
//  GoiCard
//
//  Created by thangnh on 9/29/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "StudyCardViewController.h"
#import "SettingViewController.h"
#import "Card.h"
#import "DBManager.h"
#import "Constant.h"

@interface StudyCardViewController () <UIAlertViewDelegate>
{
    Card *_card;
    NSMutableArray *_arrCards;
    int _cardIndex;
}

@end

@implementation StudyCardViewController

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
    
    _arrCards = [[DBManager getInstance] getCardsWithLevel:self.level];
//    NSLog(@"NUM CARDS: %d", _arrCards.count);
    if (_arrCards.count > 0) {
        _card = [_arrCards objectAtIndex:0];
        _cardIndex = 0;
        [self loadingCard];
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)loadingCard
{
    CATransition *animation = [CATransition animation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.duration = 1.0f;
    if (arc4random() % 2 == 0) {
        animation.type = kCATransitionMoveIn;
        [self.lbWord.layer addAnimation:animation forKey:@"kCATransitionMoveIn"];
    }else{
        animation.type = kCATruncationMiddle;
        [self.lbWord.layer addAnimation:animation forKey:@"kCATruncationMiddle"];
    }
    
    self.lbWord.text = _card.wordKanji;
    
    self.lbHiragana.text = _card.wordHira;
    self.lbMean.text = _card.meanVi;
    self.lbExample.text = _card.example;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)flipBtnFontCardClick:(id)sender{
    [UIView transitionWithView:self.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [self.view addSubview:self.backCardView];
                    }
                    completion:^(BOOL finished){
                    }
     ];

}

- (IBAction)flipBackCardClick:(id)sender {
    [UIView transitionWithView:self.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self.backCardView removeFromSuperview];
                    }
                    completion:^(BOOL finished){
                    }
     ];

}

- (IBAction)forgetButtonClick:(id)sender {
    // set level = 2 when not remember word
    [[DBManager getInstance] updateCardStatus: NOT_REMEMBER andCardId:_card.cardId];
    [self nextCard];
}

- (IBAction)rememberButtonClick:(id)sender {
    [[DBManager getInstance] updateCardStatus: REMEMBER andCardId:_card.cardId];
}

- (IBAction)settingButtonClick:(id)sender {
    SettingViewController *settingVC = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)getNextCard:(id)sender {
    NSLog(@"Get next card!");
    [self nextCard];
}

- (void)nextCard
{
    //get next card
    _cardIndex ++;
    if (_arrCards.count > _cardIndex) {
        _card = [_arrCards objectAtIndex:_cardIndex];
        [self loadingCard];
    }else{
        //Show finish study screen
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"おめでとう!" message:@"完成して、またね" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - Touch event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
