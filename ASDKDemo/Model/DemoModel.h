//
//  DemoModel.h
//  ASDKDemo
//
//  Created by bdkj on 2018/4/9.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CDM(arg1,arg2) [[DemoModel alloc] initWihtTitle:arg1 className:arg2]

@interface DemoModel : NSObject

- (instancetype)initWihtTitle:(NSString *)title className:(NSString *)className;

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *className;

@end
