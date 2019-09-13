//
//  Person.h
//  oc
//
//  Created by meikai on 2019/9/10.
//  Copyright © 2019 meikai. All rights reserved.
//

#ifndef Person_h
#define Person_h

@interface Person: NSObject{
    /**
     在{}中定义属性，包括实例变量、全局变量
     只能定义，不能m赋值；定义即声明
     */
    NSString * _name;  //默认值nil
    NSInteger _age;  //默认值0
}

//自定义初始化方法，必须以init开头
-(id)initWithName:(NSString *)name withAge:(NSInteger)age;

//定义属性的set赋值方法
- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger )age;

//定义属性的 get访问方法
- (NSString  *)name;
- (NSInteger)age;





@end

#endif /* Person_h */
