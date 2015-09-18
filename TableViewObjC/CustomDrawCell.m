//
//  CustomDrawCell.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "CustomDrawCell.h"

@interface CustomDrawCell ()

@end

@implementation CustomDrawCell {
    NSMutableArray *arrayData;
    NSString *STOCK;
    NSString *VALUES;
    int DAYS;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    STOCK = @"STOCK";
    VALUES = @"VALUES";
    DAYS = 9;
    [self initData];
}

- (void) initData {
    NSArray *stockKeys = @[@"Apple", @"Microsoft", @"Google", @"FaceBook", @"Tesla"];
    arrayData = [[NSMutableArray alloc] init];
    
    for (NSString *stockKey in stockKeys) {
        NSMutableDictionary *stock = [[NSMutableDictionary alloc] init];
        [stock setObject:stockKey forKey:STOCK];
        [stock setObject:[self generateStockValue:DAYS] forKey:VALUES];
        [arrayData addObject:stock];
    }
}

- (NSArray*) generateStockValue: (int) day {
    NSMutableArray *stockValues = [[NSMutableArray alloc] init];
    for (int i=0; i<day; i++) {
        [stockValues addObject:[NSNumber numberWithInt:arc4random_uniform(80)]];
    }
    return  stockValues;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *stock = arrayData[indexPath.row];
    cell.textLabel.text = stock[STOCK];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *stock = arrayData[indexPath.row];
    ChartLayer *chartView = [[ChartLayer alloc] init];
    [chartView initWithData:stock[VALUES] andFrame:cell.bounds];
    
    [cell.layer addSublayer:chartView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end





