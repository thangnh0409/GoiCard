//
//  MainMenuViewController.m
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "MainMenuViewController.h"
#import "StudyCardViewController.h"
#import "AddCardViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notStudyButtonClick:(id)sender {
    StudyCardViewController *studyCardVC = [[StudyCardViewController alloc]initWithNibName:@"StudyCardViewController" bundle:nil];
    [self.navigationController pushViewController:studyCardVC animated:YES];
}

- (IBAction)notRememberButtonClick:(id)sender {
}

- (IBAction)addNewCardButtonClick:(id)sender {
    AddCardViewController *addCardVC = [[AddCardViewController alloc]initWithNibName:@"AddCardViewController" bundle:nil];
    [self.navigationController pushViewController:addCardVC animated:YES];
}
@end
