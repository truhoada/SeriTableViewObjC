//
//  Person.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "Person.h"

@implementation Person
static NSArray *firstNames;
static NSArray *lastNames;

- (instancetype) initWithName:(NSString *)name andAge:(int)age {
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    return self;
}

- (id) init {
    static dispatch_once_t dispatch_Once;
    dispatch_once (&dispatch_Once, ^ {
        firstNames = @[@"Adams", @"John", @"Blake", @"Jack", @"Anna", @"Marry", @"Mariana", @"Henry", @"Madonna", @"Elvis", @"Jacko", @"Kenedy"];
        lastNames = @[@"Tale", @"Johnson", @"Nickson", @"Ducati", @"Monster", @"Vancuver", @"Montoya", @"Garcia", @"Malinois", @"Francesco", @"Cudicini", @"Philips", @"Mecina"];
    });
    if (self = [super init]) {
        _name = [NSString stringWithFormat:@"%@ %@",
                 firstNames[arc4random()%[firstNames count]],
                 lastNames[arc4random()%[lastNames count]]];
        
        _age = 4+ arc4random()%80;
    }
    return self;
    
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ - %d", _name, _age];
}

@end
