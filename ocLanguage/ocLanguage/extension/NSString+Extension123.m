//
//  NSString+Extension.m
//  ocLanguage
//
//  Created by meikai on 2019/9/18.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "NSString+Extension123.h"

@implementation NSString (Extension123)

- (BOOL)validateEmail{
    
    NSRange nsRange = [self rangeOfString:@"@"];
    if (nsRange.location == NSNotFound) {
        return NO;
    }
    
    return YES;
}

- (NSInteger)intValue{
    NSLog(@"扩展的同签名方法会覆盖原有方法,intValue");
    return 0;
}

@end
