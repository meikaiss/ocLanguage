//
//  Taxi.m
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "Taxi.h"

/**
 实现类的头文件中不需要再导入car的头文件，因为实现类的头文件已经导入过
 */

@implementation Taxi

-(void)setCompany:(NSString*)company{
    _company = company;
}

-(void)printTick{
    [super brake];
    [self brake];
    NSLog(@"%@出租车打印了发票，公司为：%@，颜色为%@", _brand, _company, _color);
}

@end
