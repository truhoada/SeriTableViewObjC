//
//  AccessoryTable.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/9/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "AccessoryTable.h"
#import "CustomCheck.h"

@interface AccessoryTable ()

@end

@implementation AccessoryTable {
    NSMutableArray *arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TableData1" ofType:@"plist"];
    arrayData = [[NSMutableArray alloc] initWithContentsOfFile:path];
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
    
    NSDictionary *dictItems = arrayData[indexPath.row];
    cell.textLabel.text = dictItems[@"text"];
    
    //2. khởi tạo custom accessoryView
    CustomCheck *accessoryView = [[CustomCheck alloc] initWithNonCheck:[UIImage imageNamed:@"circle"] andCheck:[UIImage imageNamed:@"circlecheck"]];
    [accessoryView isChecked:[dictItems[@"checked"] boolValue]];
    
    //3. hứng tương tác đa chạm
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAccessoryTap:)];
    [accessoryView addGestureRecognizer:tap];
    
    //4. gán vào UITableViewCell.accessoryView
    cell.accessoryView = accessoryView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self toggleCheck:indexPath];
}

- (void) toggleCheck: (NSIndexPath*) indexPath {
    NSMutableDictionary *item = arrayData[indexPath.row];
    if ([item[@"checked"] isEqual:@YES]) {
        item[@"checked"] = @NO;
    } else {
        item[@"checked"] = @YES;
    }
    
    UITableViewCell *cell;
    if (cell == nil) {
        cell =  [self.tableView cellForRowAtIndexPath:indexPath];
    }
    
    CustomCheck *accessoryView = [[CustomCheck alloc] initWithNonCheck:[UIImage imageNamed:@"circle"] andCheck:[UIImage imageNamed:@"circlecheck"]];
    [accessoryView isChecked:[item[@"checked"] boolValue]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAccessoryTap:)];
    [accessoryView addGestureRecognizer:tap];
    cell.accessoryView = accessoryView;
}

- (void) onAccessoryTap: (UITapGestureRecognizer*) tap {
    CGPoint tapLocation = [tap locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:tapLocation];
    NSLog(@"%ld",(long)indexPath.row);
    [self toggleCheck:indexPath];
}

/*
 The delegate usually responds to the tap on the disclosure button (the accessory view) by displaying a new view related to the selected row. This method is not called when an accessory view is set for the row at indexPath.
 */
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
}

@end







