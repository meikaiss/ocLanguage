//
//  NSString+Extension.h
//  ocLanguage
//
//  Created by meikai on 2019/9/18.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//类目名是可以随便取的，例如这里的123
//一个类是可以定义多个类目的。而且类目的作用可以沿袭到子类，就是父类的类目中的方法子类依然可以使用super关键字进行调用的。
@interface NSString(Extension123)

- (BOOL)validateEmail;

//覆盖NSString中的intValue方法
- (NSInteger)intValue;


@end

NS_ASSUME_NONNULL_END
