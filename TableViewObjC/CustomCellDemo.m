//
//  CustomCellDemo.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "CustomCellDemo.h"

@interface CustomCellDemo ()

@end

@implementation CustomCellDemo {
    NSMutableArray *arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Poster *data1 = [[Poster alloc] initWithTitle:@"Clint Eastwood" withImagePath:@"clint.jpg" andScore:6.3];
    Poster *data2 = [[Poster alloc] initWithTitle:@"Kill Bill" withImagePath:@"kill-bill.jpg" andScore:5];
    Poster *data3 = [[Poster alloc] initWithTitle:@"Marilyn Monroe" withImagePath:@"marilyn.jpg" andScore:8];
    Poster *data4 = [[Poster alloc] initWithTitle:@"Taxi Driver" withImagePath:@"taxi-driver.jpg" andScore:7.4];
    Poster *data5 = [[Poster alloc] initWithTitle:@"Pulp Finction" withImagePath:@"pulp-fiction.jpg" andScore:9];
    
    arrayData = [[NSMutableArray alloc] initWithObjects:data1, data2, data3, data4, data5, nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil];
        cell = (CustomCell*)[nib objectAtIndex:0];
    }
    
    Poster *data = [[Poster alloc] init];
    data = arrayData[indexPath.row];
    cell.labelTitle.text = data.title;
    cell.labelScore.text = [NSString stringWithFormat:@"%.1f", data.score];
    cell.imgThumb.image = data.image;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}


@end









