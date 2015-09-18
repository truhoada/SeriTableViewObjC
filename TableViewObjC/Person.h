//
//  Person.h
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) int age;

-(instancetype) initWithName: (NSString*) name
                      andAge: (int) age;


@end
