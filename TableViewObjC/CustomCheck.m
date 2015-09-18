//
//  CustomCheck.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/9/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "CustomCheck.h"

@implementation CustomCheck {

}


- (instancetype) initWithNonCheck: (UIImage*) nonCheck andCheck: (UIImage*) check {
    self = [super initWithFrame:CGRectMake(0, 0, check.size.width, check.size.height)];
    if (self) {
        self.nonCheckImage = nonCheck;
        self.checkImage = check;
        self.image = nonCheck;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype) isChecked: (BOOL) checked {
    if (checked) {
        self.image = self.checkImage;
    } else {
        self.image = self.nonCheckImage;
    }
    return self;
}


@end
