//
//  ViewController.m
//  ASDKDemo
//
//  Created by bdkj on 2018/3/30.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "DemoModel.h"

@interface ViewController ()
<
ASTableDataSource,
ASTableDelegate
>

@property (nonatomic, strong)ASTableNode *tableNode;

@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (instancetype)init
{
    _tableNode = [ASTableNode new];
    self = [super initWithNode:_tableNode];
    if (self) {
        self.title = @"Demo List";
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
        _tableNode.backgroundColor = [UIColor blueColor];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.title = @"Demo List";
    _tableNode = [ASTableNode new];
    _tableNode.dataSource = self;
    _tableNode.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.dataSource addObject:CDM(@"Text ", @"ASTableNodeDemoViewController")];
    
    [self.view addSubnode:_tableNode];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableNode.frame = self.view.bounds;
}

#pragma mark - ASTableDataSource methods

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoModel *obj = self.dataSource[indexPath.item];
    
    ASCellNodeBlock block = ^ASCellNode *() {
        ASTextCellNode *cellNode = [[ASTextCellNode alloc] init];
        cellNode.textInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        cellNode.text = obj.title;
        return cellNode;
    };
    return block;
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableNode deselectRowAtIndexPath:indexPath animated:YES];
    
    DemoModel *obj = self.dataSource[indexPath.item];
    [self.navigationController pushViewController:[NSClassFromString(obj.className) new] animated:YES];
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
