//
//  TextCellNode.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/4.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "TextCellNode.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@implementation TextCellNode
{
    ASTextNode2 *_textNode;
}

- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        _textNode = [ASTextNode2 new];
        _textNode.attributedText = [[NSAttributedString alloc] initWithString:text];
        
        [self addSubnode:_textNode];
    }
    return self;
}

- (void)layout {
    [super layout];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *headerStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [headerStack setChild:_textNode];
    return headerStack;
}

@end
