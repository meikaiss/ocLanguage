//
//  Car.h
//  ocLanguage
//
//  Created by meikai on 2019/9/13.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Car : NSObject{
    
    //属性要定义在类后的大括号内
    //默认的修饰符是@private
//@public,@protected,@private,@package,这个和Java中是相同的
@public float _capcity; //油量

    
}

//类的方法要定义在类后的大括号外
-(void)run:(float)t;

@end


