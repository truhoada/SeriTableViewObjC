//
//  AnimalVC.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "AnimalVC.h"

@interface AnimalVC ()

@end

@implementation AnimalVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
   
}

- (NSString*) getImageFileName: (NSString*) animal {
    NSString *imageFileName = [animal.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFileName = [imageFileName stringByAppendingFormat:@".jpg"];
    return imageFileName;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayAnimals.count;
}


@end
