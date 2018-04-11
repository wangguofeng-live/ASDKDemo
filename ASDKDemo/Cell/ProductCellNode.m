//
//  ProductCellNode.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/8.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ProductCellNode.h"

@implementation ProductCellNode
{
    ProductModel *_productModel;
    
    ASNetworkImageNode *_productImageNode;
    ASTextNode *_productNameNode;
    ASTextNode *_descriptionNode;
}

- (instancetype)initWithProduct:(ProductModel *)product
{
    self = [super init];
    if (self) {
        _productModel = product;
        
        _productImageNode = [[ASNetworkImageNode alloc] init];
        _productImageNode.URL = [NSURL URLWithString:_productModel.productImageUrl];
        _productImageNode.backgroundColor = [UIColor lightGrayColor];
        _productImageNode.forcedSize = CGSizeMake(150, 150);
        
        _productNameNode = [[ASTextNode alloc] init];
        _productNameNode.maximumNumberOfLines = 1;
        _productNameNode.attributedText = [[NSAttributedString alloc] initWithString:_productModel.productName];
        
        _descriptionNode = [[ASTextNode alloc] init];
        _descriptionNode.maximumNumberOfLines = 1;
        _descriptionNode.attributedText = [[NSAttributedString alloc] initWithString:_productModel.productName];
        
        self.automaticallyManagesSubnodes = YES;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    // when the username / location text is too long,
    // shrink the stack to fit onscreen rather than push content to the right, offscreen
    ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec horizontalStackLayoutSpec];
    nameLocationStack.style.flexShrink = 1.0;
    nameLocationStack.style.flexGrow = 1.0;
    
    // if fetching post location data from server,
    // check if it is available yet and include it if so
//    if (_productNameNode.attributedText) {
        nameLocationStack.children = @[_productNameNode, _descriptionNode];
//    } else {
//        nameLocationStack.children = @[_usernameNode];
//    }
    
    // horizontal stack
//    ASStackLayoutSpec *headerStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
//                                                                                 spacing:40
//                                                                          justifyContent:ASStackLayoutJustifyContentStart
//                                                                              alignItems:ASStackLayoutAlignItemsCenter
//                                                                                children:@[nameLocationStack, _postTimeNode]];
    
    // inset the horizontal stack
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 10, 20, 10) child:nameLocationStack];
    
}

@end
