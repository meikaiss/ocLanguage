//
//  main.m
//  ocLanguage
//
//  Created by meikai on 2019/9/10.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Taxi.h"
#import "Truck.h"
#import "status/Printer.h"
#import "status/BlackPrinter.h"
#import "status/ColorPrinter.h"
#import "status/PrinterMan.h"

#import "NSString+Extension123.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        test();
        
        print();
        
        extension();
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
    
    Taxi *taxi = [[Taxi alloc] init];
    [taxi setBrand:@"东风A60"];
    [taxi setCompany:@"武汉明珠"];
    [taxi setColor:@"白色"];
    [taxi printTick];
    
    
    Truck* truck = [[Truck alloc] init];
    [truck setWeight:25.0];
    [truck setBrand:@"现代"];
    [truck setColor:@"蓝色"];
    
    [truck unload];
    
    
    return 0;
}


int print(){
    
    Printer* printer = [[Printer alloc] init];
    
    ColorPrinter* colorPrinter = [[ColorPrinter alloc] init];
    BlackPrinter* blackPrinter = [[BlackPrinter alloc] init];
    
    PrinterMan* printerMan = [[PrinterMan alloc] init];
    [printerMan doPrint:(colorPrinter)];
    [printerMan doPrint:(blackPrinter)];
    
    return 0;
}


int extension(){
    NSString *s = @"123456@qq.com";
    BOOL isEmail = [s validateEmail];
    if(isEmail){
        NSLog(@"有效邮箱");
    }else{
        NSLog(@"无效邮箱");
    }
    
    //调用的是我们类目中的intValue方法
    NSInteger i = [s intValue];
    NSLog(@"intValue is %i",i);
    
    
    return 0;
}
