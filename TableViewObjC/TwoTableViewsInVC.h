//
//  TwoTableViewsInVC.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoTableViewsInVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableViewA;
@property (nonatomic, strong) UITableView *tableViewB;



@end
