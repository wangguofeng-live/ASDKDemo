//
//  ImageCellNode.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/4.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ImageCellNode.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@implementation ImageCellNode
{
    ASTextNode2 *_textNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textNode = [ASTextNode2 new];
        
        [self addSubnode:_textNode];
    }
    return self;
}

@end
