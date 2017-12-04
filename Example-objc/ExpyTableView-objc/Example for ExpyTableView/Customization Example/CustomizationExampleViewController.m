//
//  CustomizationExampleViewController.m
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import "CustomizationExampleViewController.h"

@interface CustomizationExampleViewController ()

@end

@implementation CustomizationExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sampleData = @[@[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"],
                      @[@"iPhone SE (3 Items)", @"64 GB Memory", @"4 inches", @"Apple A9, 64 bit"],
                      @[@"iPhone 6 (3 Items)", @"128 GB Memory", @"4.7 inches", @"Apple A8, 64 bit"],
                      @[@"iPhone 7 Plus (4 Items)", @"256 GB Memory", @"5.5 inches", @"Apple A10 Fusion(64 bit)", @"Force Touch: Yes"]];

    self.expandableTableView.dataSource = self;
    self.expandableTableView.delegate = self;
    
    self.expandableTableView.rowHeight = UITableViewAutomaticDimension;
    self.expandableTableView.estimatedRowHeight = 44;
    
    //Alter the animations as you want
    self.expandableTableView.expandingAnimation = UITableViewRowAnimationFade;
    self.expandableTableView.collapsingAnimation = UITableViewRowAnimationFade;
    
    self.expandableTableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationItem.title = @"iPhones";
    
    //If your app only works in portrait mode, you don't have to add this. https://github.com/okhanokbay/ExpyTableView/issues/3
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) orientationDidChange {
    switch ([UIDevice currentDevice].orientation) {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationLandscapeRight:
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationPortraitUpsideDown:
            [self.expandableTableView reloadRowsAtIndexPaths:[self.expandableTableView indexPathsForVisibleRows] withRowAnimation:UITableViewRowAnimationNone];
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source

- (BOOL) canExpandWithSection:(NSInteger)section inTableView:(ExpyTableView *)tableView{
    return true;
}

- (UITableViewCell*) expandableCellForSection:(NSInteger)section inTableView:(ExpyTableView *)tableView{
    PhoneNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhoneNameTableViewCell"];
    cell.labelPhoneName.text = sampleData[section][0];
    cell.layoutMargins = UIEdgeInsetsZero;
    [cell showSeparator];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sampleData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sampleData[section] count] + 1; // +1 here is for BuyTableViewCell
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        BuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyTableViewCell"];
        cell.layoutMargins = UIEdgeInsetsZero;
        [cell showSeparator];
        return cell;
    } else {
        SpecificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecificationTableViewCell"];
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.labelSpecification.text = (sampleData[indexPath.section])[indexPath.row];
        [cell hideSeparator];
        return cell;
    }

}

#pragma mark - Table view delegate

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (section % 3 == 0) ? @"iPhone Models" : nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"DID SELECT row: (%ld), section: (%ld)", indexPath.row, indexPath.section);
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(ExpyTableView *)tableView expyState:(enum ExpyState)state changeForSection:(NSInteger)section{
    switch (state) {
        case ExpyStateWillExpand:
            NSLog(@"WILL EXPAND");
            break;
        case ExpyStateWillCollapse:
            NSLog(@"WILL COLLAPSE");
            break;
        case ExpyStateDidExpand:
            NSLog(@"DID EXPAND");
            break;
        case ExpyStateDidCollapse:
            NSLog(@"DID COLLAPSE");
            break;
}

@end
