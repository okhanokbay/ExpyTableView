//
//  PhoneNameTableViewCell.m
//  ExpyTableView-objc
//
//  Created by Lorenzo Primiterra on 04/12/17.
//  Copyright © 2017 Lorenzo Primiterra. All rights reserved.
//

#import "PhoneNameTableViewCell.h"
#define DegreesToRadians(x) (M_PI * x / 180.0)

@implementation PhoneNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) changeState:(enum ExpyState)state cellReuseStatus:(BOOL)cellReuse{
    switch (state) {
        case ExpyStateWillExpand:
            NSLog(@"WILL EXPAND");
            [self hideSeparator];
            [self arrowDownAnimated:!cellReuse];
            break;
        case ExpyStateWillCollapse:
            NSLog(@"WILL COLLAPSE");
            [self arrowRightAnimated:!cellReuse];
            break;
        case ExpyStateDidExpand:
            NSLog(@"DID EXPAND");
            break;
        case ExpyStateDidCollapse:
            [self showSeparator];
            NSLog(@"DID COLLAPSE");
            break;
        default:
            break;
    }
    
}

- (void) arrowDownAnimated:(BOOL)animated{
    [UIView animateWithDuration:(animated ? 0.3 : 0) animations:^{
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        rotationTransform = CGAffineTransformRotate(rotationTransform, DegreesToRadians(90));
        self.imageViewArrow.transform = rotationTransform;
    }];
}

- (void) arrowRightAnimated:(BOOL)animated{
    [UIView animateWithDuration:(animated ? 0.3 : 0) animations:^{
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        rotationTransform = CGAffineTransformRotate(rotationTransform, DegreesToRadians(0));
        self.imageViewArrow.transform = rotationTransform;
    }];
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
