//
//  CustomCheck.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/9/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCheck : UIImageView
@property (nonatomic, assign) UIImage *nonCheckImage;
@property (nonatomic, assign) UIImage *checkImage;

- (instancetype) initWithNonCheck: (UIImage*) nonCheck andCheck: (UIImage*) check;

- (instancetype) isChecked: (BOOL) checked;

@end
