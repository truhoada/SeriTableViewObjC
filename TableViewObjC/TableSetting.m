//
//  TableSetting.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/9/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "TableSetting.h"

@interface TableSetting ()

@end

@implementation TableSetting {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cellIdentifier = @"AirplaneCell";
        
        AirplaneCell *cell1 = (AirplaneCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell1 == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil];
            cell1 = (AirplaneCell*)[nib objectAtIndex:0];
        }
        
        return cell1;
        
    } else {
        static NSString* cellIdentifier2 = @"BluetoothCell";
        
        BluetoothCell *cell2 = (BluetoothCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (cell2 == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier2 owner:nil options:nil];
            cell2 = (BluetoothCell*)[nib objectAtIndex:0];
        }
        
        return cell2;
    }
    
}


@end
