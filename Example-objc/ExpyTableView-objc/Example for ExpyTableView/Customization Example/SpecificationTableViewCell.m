//
//  SpecificationTableViewCell.m
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import "SpecificationTableViewCell.h"

@implementation SpecificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) showSeparator {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    });
}

- (void) hideSeparator {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.separatorInset = UIEdgeInsetsMake(0, [UIScreen mainScreen].bounds.size.width, 0, 0);
    });
}
@end
