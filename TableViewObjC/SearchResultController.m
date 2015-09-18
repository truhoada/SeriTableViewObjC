//
//  SearchResultController.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "SearchResultController.h"

@interface SearchResultController ()

@end

@implementation SearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *animal = self.arrayAnimals[indexPath.row];
    NSString *searchStr = self.searchText;
    
    //NSMutableAttributedString là chuỗi có thể định dạng hiển thị: màu chữ, màu nền, font chữ, kích thước, bold, italic, underline, stroke...
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:animal];
    NSRange range = [animal rangeOfString:searchStr options:NSCaseInsensitiveSearch];
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
    cell.textLabel.attributedText = attributedText;
    
    cell.imageView.image = [UIImage imageNamed:[self getImageFileName:animal]];
    
    return cell;
}


@end
