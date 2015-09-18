//
//  AnimalVC.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface AnimalVC : UITableViewController
@property (nonatomic) NSArray *arrayAnimals;
@property (nonatomic, retain) DetailViewController *detailViewController;

- (NSString*) getImageFileName: (NSString*) animal;


@end
