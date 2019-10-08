//
//  Person.h
//  ocLanguage
//
//  Created by meikai on 2019/10/8.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person2 : NSObject

@property NSString *name;
@property NSInteger age;

+(id)personWithName:(NSString *)name andAge:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
