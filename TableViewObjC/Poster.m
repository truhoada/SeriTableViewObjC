//
//  Poster.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "Poster.h"

@implementation Poster

- (instancetype) initImage: (UIImage*) image {
    self.image = image;
    return self;
}

- (instancetype) initWithTitle: (NSString*) title withImagePath: (NSString*) imagePath andScore: (float) score{
    self.title = title;
    self.score = score;
    self.image = [UIImage imageNamed:imagePath];
    return self;
}



@end
