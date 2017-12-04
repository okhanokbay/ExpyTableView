//
//  BasicExampleViewController.m
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import "BasicExampleViewController.h"

@interface BasicExampleViewController ()

@end

@implementation BasicExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.expandableTableView.dataSource = self;
    self.expandableTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1: {
            FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
            cell.labelFirst.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
        case 2: {
            SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCell"];
            cell.labelSecond.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
        default: {
            ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThirdTableViewCell"];
            cell.labelThird.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
    }
}

- (UITableViewCell *) expandableCellForSection:(NSInteger)section inTableView:(ExpyTableView *)tableView{
    HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderTableViewCell"];
    cell.labelHeader.text = [NSString stringWithFormat:@"Section: (%ld) Row: 0", section];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"DID SELECT row: (%ld), section: (%ld)", indexPath.row, indexPath.section);
}
@end

