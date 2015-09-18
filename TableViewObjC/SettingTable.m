//
//  SettingTable.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "SettingTable.h"

@interface SettingTable ()

@end

@implementation SettingTable {
    NSMutableArray *arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingEntry *data1 = [[SettingEntry alloc] initWithNoncheckImage:[UIImage imageNamed:@"wifioff"] withCheckImage:[UIImage imageNamed:@"wifion"] withNonCheckTitle:@"Wifi is off" andCheckTitle:@"Wifi is on"];
    SettingEntry *data2 = [[SettingEntry alloc] initWithNoncheckImage:[UIImage imageNamed:@"localstore"] withCheckImage:[UIImage imageNamed:@"cloud"] withNonCheckTitle:@"Store data locally" andCheckTitle:@"Store data on cloud"];
    
    arrayData = [[NSMutableArray alloc] initWithObjects:data1, data2, nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    SettingEntry *dataItem = arrayData[indexPath.row];
    if (dataItem.checked) {
        cell.textLabel.text = dataItem.checkTitle;
    } else {
        cell.textLabel.text = dataItem.nonCheckTitle;
    }
    
    CustomCheck *accessoryView = [[CustomCheck alloc] initWithNonCheck:dataItem.nonCheckImage andCheck:dataItem.checkImage];
    [accessoryView isChecked:dataItem.checked];
    
    cell.accessoryView = accessoryView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self toggleCheck:indexPath];
}

- (void) toggleCheck: (NSIndexPath*) indexPath {
    SettingEntry *item = arrayData[indexPath.row];
    item.checked = !item.checked;
    
    UITableViewCell *cell;
    if (cell == nil) {
        cell =  [self.tableView cellForRowAtIndexPath:indexPath];
    }
    
    CustomCheck *accessoryView = [[CustomCheck alloc] initWithNonCheck:item.nonCheckImage andCheck:item.checkImage];
    [accessoryView isChecked:item.checked];
    
    if (item.checked) {
        cell.textLabel.text = item.checkTitle;
    } else {
        cell.textLabel.text = item.nonCheckTitle;
    }
    
    cell.accessoryView = accessoryView;
}

@end
