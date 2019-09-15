//
//  Car.m
//  ocLanguage
//
//  Created by meikai on 2019/9/13.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)run:(float)t{
    
}

/**
 
 不在头文件中定义的方法，可以实现只能在此类内部访问，外部include的文件不能访问
 
 */
-(void) privateFun{
    
}

-(void)setBrand:(NSString*)brand{
    _brand = brand;
}

-(void)setColor:(NSString *)color{
    _color = color;
}

-(void)brake{
    NSLog(@"刹车啦");
}

-(void)quicken{
    NSLog(@"加速啦");
}

@end
