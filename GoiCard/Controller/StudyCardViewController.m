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

@interface StudyCardViewController ()
{
    Card *_card;
    NSMutableArray *_arrCards;
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
    if (_arrCards.count > 0) {
        _card = [_arrCards objectAtIndex:0];
        [self loadingCard];
    }
    
    UIGestureRecognizer *gestureRecognizer = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(nextCard:)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)loadingCard
{
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
}

- (IBAction)settingButtonClick:(id)sender {
    SettingViewController *settingVC = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)nextCard:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"get next card");
}
@end
