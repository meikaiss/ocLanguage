//
//  Truck.m
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import "Truck.h"

@implementation Truck

-(void)setWeight:(float) maxWeight{
    _maxWeight = maxWeight;
}

-(void)brake{
    [super brake];
    NSLog(@"货车类中的brake方法");
}


-(void)unload{
    [super brake]; //父类先完成自己的刹车动作
    [self brake]; //子类再完成自己的刹车动作
    
    NSLog(@"Truck类中的先刹车，后卸货，重量：%.1f吨，品牌：，颜色：", _maxWeight,_brand,_color);

}

@end
