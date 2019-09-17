//
//  PrinterMan.m
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "PrinterMan.h"

@implementation PrinterMan

-(void)doPrint:(Printer*)printer{
    NSLog(@"此PrinterMan正在使用的打印机类型为:");
    [printer print];
}

@end
