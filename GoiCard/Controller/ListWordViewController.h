//
//  ListWordViewController.h
//  GoiCard
//
//  Created by thangnh on 10/16/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListWordViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tbWordList;

- (IBAction)backButtonClick:(id)sender;
@end
