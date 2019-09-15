//
//  Taxi.h
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Taxi : Car{
    NSString* _company;
}

-(void)setCompany:(NSString*)company;

//打印发票
-(void)printTick;

@end

NS_ASSUME_NONNULL_END
