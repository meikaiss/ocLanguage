//
//  WithProtocol.h
//  ocLanguage
//
//  Created by meikai on 2019/9/23.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WithProtocol <NSObject>

@required
-(void) finishTask;

@optional
-(void) dontLate;

@end

NS_ASSUME_NONNULL_END
