//
//  BasicExampleViewController.h
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpyTableView-Swift.h"

@interface FirstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelFirst;
@end

@interface SecondTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelSecond;
@end

@interface ThirdTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelThird;
@end

@interface HeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelHeader;
@end

@interface BasicExampleViewController : UIViewController <ExpyTableViewDelegate, ExpyTableViewDataSource>

@property (nonatomic, strong) IBOutlet ExpyTableView *expandableTableView;


@end
