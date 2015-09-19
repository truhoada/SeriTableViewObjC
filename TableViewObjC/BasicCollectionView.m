//
//  BasicCollectionView.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/19/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "BasicCollectionView.h"

@interface BasicCollectionView ()

@end

@implementation BasicCollectionView {
    NSArray *arrayImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayImage = [NSArray arrayWithObjects:@"image1.png", @"image2.png", @"image3.png", @"image4.png", @"image5.png", @"image6.png",@"image7.png",@"image8.png",@"image9.png", nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayImage.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [UIImage imageNamed:[arrayImage objectAtIndex:indexPath.row]];
    [cell.layer setBorderWidth:1];
    [cell.layer setBorderColor:[UIColor redColor].CGColor];
    [cell.layer setCornerRadius:30];
    
    return cell;
}



@end
