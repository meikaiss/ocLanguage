//
//  PrinterMan.h
//  ocLanguage
//
//  Created by meikai on 2019/9/15.
//  Copyright © 2019 meikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorPrinter.h"
#import "BlackPrinter.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrinterMan : NSObject{
    
    NSString* _name;
    
    
    
}

-(void)doPrint:(Printer*)printer;

@end

NS_ASSUME_NONNULL_END
