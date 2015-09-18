//
//  RandomPass.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "RandomPass.h"

@interface RandomPass ()

@end

@implementation RandomPass {
    int rowCount;
    NSMutableArray *arrayPass;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    rowCount = 100;
    arrayPass = [[NSMutableArray alloc] init];
    for (int i=0; i<rowCount; i++) {
        [arrayPass addObject:[self randomPassMinLen:6 andMaxLen:10]];
    }
    
}

- (NSString*) randomPassMinLen: (int) minLen andMaxLen: (int) maxLen {
    NSString *stringAZ = @"abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRSTUV0123456789*^%$#@-+";
    int len = minLen + arc4random_uniform(maxLen - minLen);
    NSString *result = @"";
    for (int i=0; i<len; i++) {
        int ranIndex = arc4random_uniform((int)stringAZ.length);
        NSString *str = [stringAZ substringWithRange:NSMakeRange(ranIndex, 1)];
        result = [result stringByAppendingString:str];
    }
    return result;
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayPass.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [arrayPass objectAtIndex:indexPath.row];
    return cell;
    
}


@end
