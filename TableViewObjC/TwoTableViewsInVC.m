//
//  TwoTableViewsInVC.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "TwoTableViewsInVC.h"

@interface TwoTableViewsInVC ()

@end

@implementation TwoTableViewsInVC {
    NSArray *arrayFruits;
    NSArray *arrayThings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize mainViewSize = self.view.bounds.size;
    arrayFruits = @[@"Banana", @"Orange", @"Lemon"];
    arrayThings = @[@"Clock", @"Guitar", @"Tivi", @"Wash Machine"];
    
    self.tableViewA = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainViewSize.width, mainViewSize.height*0.5)
                                                   style:UITableViewStylePlain];
    
    self.tableViewB = [[UITableView alloc] initWithFrame:CGRectMake(0, mainViewSize.height*0.5, mainViewSize.width, mainViewSize.height*0.5)
                                                   style:UITableViewStylePlain];
    
    self.tableViewA.delegate = self;
    self.tableViewA.dataSource = self;
    self.tableViewB.delegate = self;
    self.tableViewB.dataSource = self;
    
    [self.view addSubview:self.tableViewA];
    [self.view addSubview:self.tableViewB];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableViewA) {
        return [arrayFruits count];
    } else {
        return [arrayThings count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    if (tableView == self.tableViewA) {
        cell.textLabel.text = [arrayFruits objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [arrayThings objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor grayColor];
    }
    
    return cell;
}


@end















