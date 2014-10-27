//
//  ListWordViewController.m
//  GoiCard
//
//  Created by thangnh on 10/16/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "ListWordViewController.h"
#import "DBManager.h"

#define NOT_STUDY       1
#define FORGET          2
#define REMEMBER        0

@interface ListWordViewController ()
{
    NSMutableArray *_arrNotStudy;
    NSMutableArray *_arrForget;
    NSMutableArray *_arrRemember;
}

@end

@implementation ListWordViewController

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
    [self getData];
    [_tbWordList reloadData];
}

- (void)getData
{
    _arrRemember = [[DBManager getInstance] getAllWordByLevel:REMEMBER];
    _arrNotStudy = [[DBManager getInstance] getAllWordByLevel:NOT_STUDY];
    _arrForget = [[DBManager getInstance] getAllWordByLevel:FORGET];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == REMEMBER) {
        return _arrRemember.count;
    }else if (section == NOT_STUDY){
        return _arrNotStudy.count;
    }else
        return _arrForget.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case REMEMBER:
            return @"覚えた";
        case NOT_STUDY:
            return @"勉強しません";
        case FORGET:
            return @"覚えない";
        default:
            break;
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    header.tintColor = [UIColor grayColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SimpleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    switch (indexPath.section) {
        case REMEMBER:
            cell.textLabel.text = [_arrRemember objectAtIndex:indexPath.row];
            break;
        case NOT_STUDY:
            cell.textLabel.text = [_arrNotStudy objectAtIndex:indexPath.row];
            break;
        case FORGET:
            cell.textLabel.text = [_arrForget objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.contentView.backgroundColor = [UIColor clearColor];
//    cell.backgroundColor = [UIColor clearColor];
//    cell.backgroundView.backgroundColor = [UIColor clearColor];
//    tableView.backgroundView.backgroundColor = [UIColor clearColor];

}
#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20.0f;
}
@end
