//
//  ViewController.m
//  ASDKDemo
//
//  Created by bdkj on 2018/3/30.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ViewController ()

@property (nonatomic, strong)ASTableNode *tableNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)viewWillLayoutSubviews {
    
}

-(ASTableNode *)tableNode {
    if (!_tableNode) {
        _tableNode = [[ASTableNode alloc] init];
    }
    return _tableNode;
}


@end
