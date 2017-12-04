//
//  CustomizationExampleViewController.h
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpyTableView-Swift.h"

@interface CustomizationExampleViewController : UIViewController <ExpyTableViewDelegate, ExpyTableViewDataSource>

@property (nonatomic, strong) IBOutlet ExpyTableView *expandableTableView;

@end
