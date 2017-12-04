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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Basic Example";
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    switch (indexPath.row) {
        case 1: {
            cell.textLabel.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
        case 2: {
            cell.textLabel.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
        default: {
            cell.textLabel.text = [NSString stringWithFormat:@"Section: (%ld) Row: (%ld)", indexPath.section, indexPath.row];
            return cell;
        }
    }
}

- (UITableViewCell *) expandableCellForSection:(NSInteger)section inTableView:(ExpyTableView *)tableView{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderTableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Section: (%ld) Row: 0", section];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"DID SELECT row: (%ld), section: (%ld)", indexPath.row, indexPath.section);
}
@end

