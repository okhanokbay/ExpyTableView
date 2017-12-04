//
//  PhoneNameTableViewCell.h
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpyTableView-Swift.h"

@interface PhoneNameTableViewCell : UITableViewCell  <ExpyTableViewHeaderCell>

@property (weak, nonatomic) IBOutlet UILabel *labelPhoneName;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewArrow;
- (void) showSeparator ;
- (void) hideSeparator ;
@end
