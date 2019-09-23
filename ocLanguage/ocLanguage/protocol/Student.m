//
//  Student.m
//  ocLanguage
//
//  Created by meikai on 2019/9/23.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "Student.h"

@implementation Student

#pragma mark -WithProtocol
-(void)finishTask{
    NSLog(@"这是协议中的方法，类似java中的接口");
}


-(void)study{
#warning 代码过几天再补充，类似todod
    NSLog(@"类自有的方法");
}

@end
