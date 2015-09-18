//
//  MultiSelection.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "MultiSelection.h"

@interface MultiSelection ()

@end

@implementation MultiSelection {
    NSMutableArray *arrayData;
    UIBarButtonItem *backBarButtonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onEdit)];
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
    arrayData = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i=0; i<20; i++) {
        Person *personData = [[Person alloc] init];
        [arrayData addObject:personData];
    }
}

- (void) onEdit {
    if (self.tableView.editing) {
        [self.tableView setEditing:false animated:YES];
        self.navigationItem.leftBarButtonItem = backBarButtonItem;
        
    } else {
        [self.tableView setEditing:true animated:YES];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(onDelete)];
    }
}

- (void) onDelete {
    NSArray *selectedRows;
    selectedRows = self.tableView.indexPathsForSelectedRows;
    if (selectedRows.count > 0) {
        NSMutableIndexSet *indicesOfItemsToDelete = [[NSMutableIndexSet alloc] init];
        for (NSIndexPath *selectedIndex in selectedRows) {
            [indicesOfItemsToDelete addIndex: selectedIndex.row];
        }
        [arrayData removeObjectsAtIndexes:indicesOfItemsToDelete];
        [self.tableView deleteRowsAtIndexPaths:selectedRows withRowAnimation:UITableViewRowAnimationAutomatic];
    }
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    Person *personData = [[Person alloc] init];
    personData = arrayData[indexPath.row];
    cell.textLabel.text = personData.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", personData.age];
    
    return cell;
}


@end
