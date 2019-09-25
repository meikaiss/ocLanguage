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
        testNSString();
        testNSArray();
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

int testNSString(){
    NSString* string1 = @"meikai1";
    NSString* string2 = [[NSString alloc] initWithString:@"meikai2"];
    
    //占位符，可以实现拼接字符串
    NSString* string3 = [[NSString alloc] initWithFormat:@"hello %@", string1];
    //用类的静态方法来创建对象
    NSString* string4 = [NSString stringWithString:@"hello"];
    
    // isEqualTo 用来比较两个字符串的内容是否相同
    NSString* compare1 = @"123";
    NSString* compare2 = @"123abc";
    if ([compare1 isEqualTo:compare2]) {
        NSLog(@"%@、%@两个字符串的内容是相等的", compare1, compare2);
    }else{
        NSLog(@"%@、%@两个字符串的内容是不相等的", compare1, compare2);
    }
    
    //@"abcd"是在常量区中分配的内存，compare3和compare4是在栈中分配的内存
    NSString* compare3 = @"abcd";
    NSString* compare4 = @"abcd";
    if (compare3 == compare4) {
        //因系统的内存优化，导致compare3和compare4的地址相同
        NSLog(@"compare3和compare4的内存地址是相同的");
    }else{
        NSLog(@"compare3和compare4的内存地址是不相同的");
    }
    
    NSString* compare5 = [[NSString alloc] initWithString:@"abcdef"];
    NSString* compare6 = [[NSString alloc] initWithString:@"abcdef"];
    if (compare5 == compare6) {
        //仍然是在栈中分配的内存
        NSLog(@"compare5和compare6的内存地址是相同的");
    }else{
        NSLog(@"compare5和compare6的内存地址是不相同的");
    }
    
    // ==到底是比较什么？字符串的内存到底分配在哪里了？ 待解释...
    NSString* compare7 = [[NSString alloc] initWithFormat:@"abc%@",@"def"];
    NSString* compare8 = [[NSString alloc] initWithFormat:@"abc%@",@"def"];
    if(compare7 == compare8){
        NSLog(@"compare7和compare8的内存地是相同的");
    }else{
        NSLog(@"compare7和compare8的内存地是不相同的");
    }
    
    NSString *string9 = @"zhangsan";
    NSString *string10 = @"ZAHNGSAN";
    //区分大小写判断是否相等
    NSComparisonResult result = [string9 caseInsensitiveCompare:string10];
    if(result == NSOrderedSame){
        NSLog(@"%@和%@的内容是相同的，区分大小写", string9, string10);
    }else{
        NSLog(@"%@和%@的内容是不相同的，区分大小写", string9, string10);
    }

    //比较两个字符串的大小
    result = [string9 compare:string10];
    if(result == NSOrderedAscending){
        //升序
    }else if(result == NSOrderedDescending){
        //降序
    }else if(result == NSOrderedSame){
        //相同
    }
    
    NSString* s1 = @"meikai";
    NSMutableString* mutableString1 = [[NSMutableString alloc] initWithString:@"meikai"];
    if ([s1 isEqualTo:mutableString1]) {
        NSLog(@"字符串的内容 相同");
    }else{
        NSLog(@"字符串的内容 不相同");
    }
    
    if (s1 == mutableString1) {
        NSLog(@"字符串的地址 相同");
    }else{
        NSLog(@"字符串的地址 不相同");
        
    }
    [mutableString1 appendString:@" is a code man"];
    NSLog(@"%@", mutableString1);
       
    return 0;
}



int testNSArray(){
    
    // nil 表示结束，不会计入数组长度
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"hello",@"android",@"iOS", nil];
    NSLog(@"%@",array1);
 
    NSArray *array2 = [NSArray arrayWithArray:array1];
    NSLog(@"%@",array2);
    
    NSString *str1 = [array1 objectAtIndex:2];
    NSLog(@"%@",str1);
    
    NSUInteger count = [array1 count];
    NSLog(@"数组的长度为 %d",count);
    
    NSArray *array7 = @[@"s1",@"s2",@"s3"];
    NSLog(@"%@",array7);
    
    //NSArray类是不可变的，NSMutableArray类是可变的
    NSMutableArray *mArray1 = [[NSMutableArray alloc] initWithObjects:@"s1",@"s2",@"s3", nil];
   
    return 0;
}
