//
//  AppCell.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/18/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabelName;
@property (weak, nonatomic) IBOutlet UILabel *detailTextLabelAuthor;

@end
