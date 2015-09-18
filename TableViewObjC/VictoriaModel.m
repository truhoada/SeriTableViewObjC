//
//  VictoriaModel.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "VictoriaModel.h"

@implementation VictoriaModel
- (instancetype) initWithName:(NSString *)name andThumbPhoto:(NSString *)thumbPhoto {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.thumbPhoto = [UIImage imageNamed:thumbPhoto];
    }
    return self;
}

@end
