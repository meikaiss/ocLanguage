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
#import "Person2.h"

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
        testDictionary();
        testNSNumber();
        testDate();
        testException();
        textDocument();
        predicate();

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

int testDictionary(){
    NSArray* arr1 = @[@"1", @"2", @"3"];

    //添加元素
    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:arr1 forKey:@"zhang"];
    
    NSArray* arr2 = @[@"a", @"b", @"c"];
    NSDictionary* dict2 = [[NSDictionary alloc] initWithObjectsAndKeys: arr1, @"numArr",
                           arr2, @"wordArr", nil];

    //获取 所有 key
    NSArray* allKeys = [dict2 allKeys];
    NSLog(@"%@", allKeys);
    
    //获取 所有 value
    NSArray* allValues = [dict2 allValues];
    NSLog(@"%@", allValues);
    
    //通过 key获取 value
    NSArray* getByKey = [dict2 objectForKey:@"wordArr"];
    NSLog(@"\n获取到指定key的对象为 %@", getByKey);
    
    //简写的字典语法
    NSDictionary* dict3 = @{@"zhangsan":arr1, @"lisi":arr2};
    NSLog(@"%@", dict3);
    
    
    NSMutableDictionary* md1 = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"activity",@"service", nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"android",@"iOS", nil];
    [md1 setObject:array1 forKey:@"module"];
    [md1 setObject:array2 forKey:@"lang"];
    
    //快速遍历
    for (NSString* key in md1) {
        NSArray* value= [md1 objectForKey:key];
        NSLog(@"%@", value);
    }
    
    return 0;
}

int testNSNumber(){
    
    //封包
    NSNumber *intNumber = [NSNumber numberWithInt:3];
    NSNumber *floatNumber = [NSNumber numberWithFloat:9.8f];
    NSArray *array = @[intNumber,floatNumber];
    
    //解包
    int value = [intNumber intValue];
    float values = [floatNumber floatValue];
    NSString *str = [intNumber stringValue];
    
    //优化语法
    NSNumber *intNumbers = @12;
    
    NSRange rang = {1,20,30};
    NSValue* v = [NSValue valueWithRange:rang];
    NSLog(@"%@", v);
    
    NSNull *n1 = [NSNull null];
    NSNull *n2 = [NSNull null];
    NSArray *nullArray = @[n1,n2];
    NSLog(@"nullArray =%@",nullArray);
    
    
    
    return 0;
}

int testDate(){
    
    NSDate* date = [NSDate date];//当前时间点
    NSLog(@"%@", date);
    
    NSDate* date1 = [[NSDate alloc] init];
    NSLog(@"%@", date1);
    
    //在当前时间加上10s,如果是减去一个时间，直接使用负值就可以了
    NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:10];
    NSLog(@"%@", date2);
    
    NSDate *date3 = [NSDate dateWithTimeIntervalSince1970:1];//参数为时间戳的大小
    NSLog(@"%@", date3);
    
    //创建一个日期，然后拿到时间戳
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSince1970];
    interval = [now timeIntervalSinceNow];//到当前时间的一个差值
    NSLog(@"%ld", interval);

    //日期的比较
    //通过调用日期对象的compare，或者通过两个日期之间的差值判断
    NSComparisonResult result = [date1 compare:date2];
    if(result == NSOrderedAscending){
        //大于
        NSLog(@"入参比 调用者 大");
    }else if(result == NSOrderedDescending){
        //小于
        NSLog(@"入参比 调用者 小");
    }else{
        //等于
        NSLog(@"入参比 调用者 相等");
    }
    
    //下面的方法是从格林时区开始添加和减去一个时区值(格林时区为0)
    //[NSTimeZone timeZoneForSecondsFromGMT:0];
     
    //通过打印可以得到具体的时区
    NSArray *array = [NSTimeZone knownTimeZoneNames];//获取所有的时区
    for(NSString *str in array){
        NSLog(@"%@",str);
    }
    
    //日期格式化
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy哈MM-dd HH:mm:ss"];
    NSString *str = [dateFormatter stringFromDate:date];
    NSLog(@"%@",str);
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"America/New_York"];
    [dateFormatter setTimeZone:timeZone];
    
    //将字符串转化成日期对象
    NSString *strs = @"2013年12月14日 16:31:08";
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    date1 = [dateFormatter dateFromString:strs];
    
    return 0;
}

int testException(){

    @try{
        NSInteger a = 1/0;
    }@catch(NSException* exception){
        NSLog(@"%@", exception);
    }@finally{
        NSLog(@"完成");
    }
    
    
    return 0;
}

int textDocument(){
    
    //第一种形式：归档对象
    //对象----》文件
     NSArray *array0 = [NSArray arrayWithObjects:@"zhang",@"wangwu",@"lisi",nil];
     NSString *filePath0 = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
     
     BOOL success = [NSKeyedArchiver archiveRootObject:array0 toFile:filePath0];
     if(success){
         NSLog(@"保存成功");
     }
    
    //解归档
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",array);
    
    {
        // 对多个对象 归档
        //第二种方式
        //第一种方式的缺陷是一个对象归档成一个文件
        //但是第二种方式，多个对象可以归档成一个文件
         NSArray *array = [NSArray arrayWithObjects:@"zhangsan",@"lisi", nil];
         NSMutableData *data = [NSMutableData data];
         NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
         //编码
         [archiver encodeObject:array forKey:@"array"];
         [archiver encodeInt:100 forKey:@"scope"];
         [archiver encodeObject:@"jack" forKey:@"name"];
         
         //完成编码，将上面的归档数据填充到data中，此时data中已经存储了归档对象的数据
         [archiver finishEncoding];
         //[archiver release];
         
         NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
         BOOL success = [data writeToFile:filePath atomically:YES];
         if(success){
             NSLog(@"归档成功");
         }
    }
    
    {
        
         NSString* filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
          //读取归档数据
          NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
          //创建解归档对象，对data中的数据进行解归档
          NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
          //解归档
          NSArray *array = [unarchiver decodeObjectForKey:@"array"];
          NSLog(@"array的key对应的内容为:%@",array);
          
          int value = [unarchiver decodeObjectForKey:@"scope"];
          NSLog(@"scope的key对应的内容为:%d",value); //???这里为什么没有取出来？
        
    }
 
    return 0;
}

int predicate(){
    
    NSArray *personArr =[NSArray arrayWithObjects:
                         [Person2 personWithName:@"1" andAge:10],
                         [Person2 personWithName:@"2" andAge:20],
                         [Person2 personWithName:@"3" andAge:30],
                         [Person2 personWithName:@"4" andAge:40],
                         [Person2 personWithName:@"5" andAge:50],
                         [Person2 personWithName:@"50" andAge:50],
                         [Person2 personWithName:@"6" andAge:60],
                         [Person2 personWithName:@"116" andAge:60],
                         [Person2 personWithName:@"767" andAge:70],
                         [Person2 personWithName:@"8s" andAge:80],
                         [Person2 personWithName:@"9s" andAge:90],
                         nil];
    
    NSLog(@"源数组=%@", personArr);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<%d", 50];
    NSArray* filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name = '3' && age<%d", 50];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);

    predicate = [NSPredicate predicateWithFormat:@"self.name IN {'2', '3'} || self.age IN { 70,80}"];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name BEGINSWITH '5'"];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name ENDSWITH '6'"];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name CONTAINS '6'"];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name LIKE '*s'"];
    filterArray = [personArr filteredArrayUsingPredicate:predicate];
    NSLog(@"过滤后的数组=%@", filterArray);
    
    return 0;
}
