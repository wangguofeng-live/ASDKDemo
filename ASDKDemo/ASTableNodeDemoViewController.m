//
//  ASTableNodeDemoViewController.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/4.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ASTableNodeDemoViewController.h"
#import "TextCellNode.h"

@interface ASTableNodeDemoViewController ()
<
ASTableDataSource,
ASTableDelegate
>

@property (nonatomic, strong)ASTableNode *tableNode;

@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation ASTableNodeDemoViewController

- (instancetype)init
{
    _tableNode = [ASTableNode new];
    self = [super initWithNode:_tableNode];
    if (self) {
        self.navigationItem.title = @"TableNode";
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
        _tableNode.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _tableNode.leadingScreensForBatching = 2.0;  // overriding default of 2.0
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 100; i++) {
        [self.dataSource addObject:@(i)];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - ASTableDataSource methods
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    return self.dataSource.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id text = self.dataSource[indexPath.item];
    
    ASCellNodeBlock block = ^ASCellNode *() {
        TextCellNode *cellNode = [[TextCellNode alloc] initWithText:text];
        return cellNode;
    };
    return block;
}

#pragma mark - ASTableDelegate methods

#pragma mark - Geter
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
