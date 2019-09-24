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
#import "protocol/Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        test();
        
        print();
        
        extension();
        
        test22();
        objectFun();
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


int test22(){
    Student* student = [[Student alloc] init];
    
    [student study];
    [student finishTask];
    
    return 0;
}

int objectFun(){
    
    NSObject* nsObj1 = [[NSObject alloc] init];
    NSObject* nsObj2 = [[NSObject alloc] init];
    
    //isEqual判断两个指针是否指向同一个对象
    if ([nsObj1 isEqual:nsObj2]) {
        NSLog(@"nsObj1和nsObj2 是同一个对象");
    }else{
        NSLog(@"nsObj1和nsObj2 是不同对象");
    }
    
    
    // == 判断两个指针是否指向同一个对象
    if ( nsObj1 == nsObj2) {
        NSLog(@"nsObj1和nsObj2 是同一个对象");
    }else{
        NSLog(@"nsObj1和nsObj2 是不同对象");
    }
    
    Boolean isFrom = [nsObj1 isMemberOfClass:[NSObject class]];
    NSLog(@"是否为某个类，%d", isFrom);
    
    Boolean isKind = [nsObj1 isKindOfClass:[NSObject class]];
    NSLog(@"是否为某个类的子类，%d", isKind);
    
    //respondsToSelector的作用： 在.m文件中有此方法才会返回YES，在.m中没有则返回NO
    Student* stu = [[Student alloc]init];
    Boolean hasFun = [stu respondsToSelector:@selector(finishTask)];
    NSLog(@"是否实现了此方法，%d", hasFun);
    Boolean hasFun2 = [stu respondsToSelector:@selector(finishTask123)];
    NSLog(@"是否实现了此方法，%d", hasFun2);
    
    //执行此stu对象中，名称为finishTask的方法
    [stu performSelector:@selector(finishTask)];
    
    return 0;
}
