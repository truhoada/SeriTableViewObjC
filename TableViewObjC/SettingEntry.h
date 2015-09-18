//
//  SettingEntry.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingEntry : NSObject
@property (nonatomic, retain) UIImage *nonCheckImage;
@property (nonatomic, retain) UIImage *checkImage;
@property (nonatomic, assign) NSString *nonCheckTitle;
@property (nonatomic, assign) NSString *checkTitle;
@property (nonatomic, assign) BOOL checked;

- (instancetype) initWithNoncheckImage: (UIImage*) nonCheckImage
                        withCheckImage: (UIImage*) checkImage
                     withNonCheckTitle: (NSString*) nonCheckTitle
                         andCheckTitle: (NSString*) checkTitle;

- (instancetype) isChecked: (BOOL) checked;

@end
