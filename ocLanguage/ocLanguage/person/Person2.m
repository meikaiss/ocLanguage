//
//  Person.m
//  ocLanguage
//
//  Created by meikai on 2019/10/8.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "Person2.h"

@implementation Person2

+(id)personWithName:(NSString *)name andAge:(NSInteger)age{
    
    Person2* person = [[Person2 alloc] init];
    person.name = name;
    person.age = age;
    
    return person;
}

-(NSString *)description{
    NSString *s = [NSString stringWithFormat:@"name=%@, age=%ld", _name, _age];
    
    return s;
}

@end
