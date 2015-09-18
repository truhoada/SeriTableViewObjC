//
//  SearchTable.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "SearchTable.h"

@interface SearchTable () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation SearchTable {
    UISearchBar *searchBar;
    UISearchController *searchController;
    SearchResultController *searchResultController;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayAnimals = @[@"Bear", @"Black Swan", @"Buffalo", @"Camel", @"Cockatoo", @"Dog", @"Donkey", @"Emu", @"Giraffe", @"Greater Rhea", @"Hippopotamus", @"Horse", @"Lion", @"Llama", @"Manatus", @"Meerkat", @"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear", @"Rhinoceros", @"Seagull", @"Tasmania Devil", @"Whale", @"Whale Shark", @"Wombat"];
    
    searchResultController = [[SearchResultController alloc] init];
    
    //**** Gán tableView của searchResultsController vào ViewController này
    searchResultController.tableView.delegate = self;
    searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultController];
    searchController.searchResultsUpdater = self;
    [searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = searchController.searchBar;
    
    searchController.delegate = self;
    searchController.dimsBackgroundDuringPresentation = false;
    searchController.searchBar.delegate = self;
    
    //This is line is very important. Without it, app will hang !
    self.definesPresentationContext = true;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *animal = self.arrayAnimals[indexPath.row];
    cell.textLabel.text = animal;
    cell.imageView.image = [UIImage imageNamed:[self getImageFileName:animal]];
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchControllerr {
    //Lấy ra tập các ký tự trắng, space
    NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet];
    
    //Loại bỏ các ký tự trắng ở hai đầu
    NSString *strippedString = [searchControllerr.searchBar.text stringByTrimmingCharactersInSet:whitespaceCharacterSet];
    
    //Hàm này sẽ tìm kiếm các phần tử mảng có chứa strippedString
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",strippedString];
    NSArray *filterArrayStrippedString = [self.arrayAnimals filteredArrayUsingPredicate:predicate];
    
    //Gọi ra TableViewController hiển thị kết quả
    SearchResultController *resultsController = (SearchResultController*)searchControllerr.searchResultsController;
    
    //Truyền đoạn từ khoá tìm kiếm vào cho nó
    resultsController.searchText = strippedString;
    
    //Truyền kết quả tìm kiếm vào
    resultsController.arrayAnimals = filterArrayStrippedString;
    
    //Refresh Data TableView
    [resultsController.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.detailViewController = [[DetailViewController alloc] init];
    
    if (tableView == self.tableView) {
        self.detailViewController.animal = self.arrayAnimals[indexPath.row];
    } else {
        self.detailViewController.animal = searchResultController.arrayAnimals[indexPath.row];
    }
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}


@end
















