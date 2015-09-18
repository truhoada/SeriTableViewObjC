//
//  VictoriaSecret.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "VictoriaSecret.h"

@interface VictoriaSecret ()

@end

@implementation VictoriaSecret {
    NSMutableArray *arrayVictoriaModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    VictoriaModel *kateUpton = [[VictoriaModel alloc] initWithName:@"Kate Upton" andThumbPhoto:@"KateUpton0.jpg"];
    VictoriaModel *adrianaLima = [[VictoriaModel alloc] initWithName:@"Adriana Lima" andThumbPhoto:@"AdrianaLima0.jpg"];
    
    arrayVictoriaModel = [[NSMutableArray alloc] initWithObjects:kateUpton, adrianaLima, nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayVictoriaModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    VictoriaModel *victoriaModel = arrayVictoriaModel[indexPath.row];
    cell.textLabel.text = victoriaModel.name;
    cell.imageView.image = victoriaModel.thumbPhoto;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


@end










