//
//  SettingEntry.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "SettingEntry.h"

@implementation SettingEntry

- (instancetype) initWithNoncheckImage: (UIImage*) nonCheckImage
                        withCheckImage: (UIImage*) checkImage
                     withNonCheckTitle: (NSString*) nonCheckTitle
                         andCheckTitle: (NSString*) checkTitle {
    self.nonCheckImage = nonCheckImage;
    self.checkImage = checkImage;
    self.nonCheckTitle = nonCheckTitle;
    self.checkTitle = checkTitle;
    
    return self;
}

- (instancetype) isChecked: (BOOL) checked {
    self.checked = checked;
    return self;
}


@end
