//
//  Person.m
//  oc
//
//  Created by meikai on 2019/9/10.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name{
    _name = name;
}

- (void)setAge:(NSInteger)age{
    _age = age;
}

- (NSString *)name{
    return _name;
}

- (NSInteger)age{
    return _age;
}


@end
