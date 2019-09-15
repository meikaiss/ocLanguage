//
//  Truck.h
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Truck : Car{
    float _maxWeight;//最大载重量
}

-(void)setWeight:(float) maxWeight;

/**
 * 当父类中也有此签名的方法时，会覆盖父类的方法，优先调用子类的方法
 */
-(void)brake;


//卸货
-(void)unload;


@end

NS_ASSUME_NONNULL_END
