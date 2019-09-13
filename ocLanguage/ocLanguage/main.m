//
//  main.m
//  ocLanguage
//
//  Created by meikai on 2019/9/10.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        test();
        
    }
    return 0;
}

int test(){
    
    Boolean enable = true;
    NSLog(@"boolean值打印:%d", enable);
    
    
    Person *person = [[Person alloc] init];
    person = [person initWithName:@"梅凯" withAge:30];
    
    NSLog(@"对象的名字是:%@", person.name);
    NSLog(@"对象的年龄是:%ld", person.age);
    
    return 0;
}
