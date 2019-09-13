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

// id类型等同于 void *
-(id)initWithName:(NSString *)name withAge:(NSInteger)age{
    //固定写法，可以背下来哦~~
    
    //调用父类的初始化方法
    self = [super init];
    
    if(self != nil){
        _name = name;
        _age = age;
    }
    
    return self;
}

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
