//
//  DemoModel.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/9.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel

- (instancetype)initWihtTitle:(NSString *)title className:(NSString *)className
{
    self = [super init];
    if (self) {
        self.title = title;
        self.className = className;
    }
    return self;
}

@end
