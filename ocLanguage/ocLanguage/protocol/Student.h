//
//  Student.h
//  ocLanguage
//
//  Created by meikai on 2019/9/23.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WithProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject<WithProtocol>

-(void)study;

@end

NS_ASSUME_NONNULL_END
