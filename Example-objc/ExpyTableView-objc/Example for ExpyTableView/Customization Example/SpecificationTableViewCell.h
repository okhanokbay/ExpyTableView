//
//  SpecificationTableViewCell.h
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecificationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelSpecification;
- (void) showSeparator ;
- (void) hideSeparator ;

@end
