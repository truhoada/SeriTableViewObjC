//
//  VictoriaModel.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/8/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VictoriaModel : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) UIImage *thumbPhoto;

- (instancetype) initWithName: (NSString*) name andThumbPhoto: (NSString*) thumbPhoto;

@end
