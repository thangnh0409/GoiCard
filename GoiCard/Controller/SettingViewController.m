//
//  SettingViewController.m
//  GoiCard
//
//  Created by thangnh on 9/29/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "SettingViewController.h"
#import "ListWordViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)getListWordButtonClick:(id)sender {
    ListWordViewController *listWordVC = [[ListWordViewController alloc]initWithNibName:@"ListWordViewController" bundle:nil];
    [self.navigationController pushViewController:listWordVC animated:YES];
}

- (IBAction)timeSettingBtnClick:(id)sender {
}
@end
