//
//  Poster.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Poster : NSObject
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) float score;

- (instancetype) initImage: (UIImage*) image;

- (instancetype) initWithTitle: (NSString*) title withImagePath: (NSString*) imagePath andScore: (float) score;

@end
