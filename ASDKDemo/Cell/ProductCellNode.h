//
//  ProductCellNode.h
//  ASDKDemo
//
//  Created by bdkj on 2018/4/8.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "ProductModel.h"

@interface ProductCellNode : ASCellNode

- (instancetype)initWithProduct:(ProductModel *)product;

@end
