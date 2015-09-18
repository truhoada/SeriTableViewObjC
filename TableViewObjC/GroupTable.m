//
//  GroupTable.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "GroupTable.h"

@interface GroupTable ()

@end

@implementation GroupTable {
    NSMutableArray *arrayDataItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DataItems *fruits = [[DataItems alloc] initWithTitle:@"fruits" andData:@[@"Banana", @"Orange", @"Lemon"]];
    DataItems *things = [[DataItems alloc] initWithTitle:@"things" andData:@[@"Clock", @"Guitar", @"Tivi", @"Wash Machine"]];
    DataItems *girls = [[DataItems alloc] initWithTitle:@"girls" andData:@[@"Miranda Kerr", @"Kate Upton", @"Adriana Lima", @"Rosie Huntington-Whiteley"]];
    arrayDataItems = [[NSMutableArray alloc] initWithObjects:fruits,things,girls, nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [arrayDataItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DataItems *items = arrayDataItems[section];
    return items.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    DataItems *items = arrayDataItems[indexPath.section];
    cell.textLabel.text = items.data[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DataItems *items = arrayDataItems[section];
    return items.title;
}

@end









