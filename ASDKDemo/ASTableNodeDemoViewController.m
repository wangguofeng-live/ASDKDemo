//
//  ASTableNodeDemoViewController.m
//  ASDKDemo
//
//  Created by bdkj on 2018/4/4.
//  Copyright © 2018年 bdkj. All rights reserved.
//

#import "ASTableNodeDemoViewController.h"
#import "ProductCellNode.h"

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
- (void)awakeFromNib {
    [super awakeFromNib];
    
    _tableNode = [ASTableNode new];
    _tableNode.dataSource = self;
    _tableNode.delegate = self;
}

- (void)loadView
{
    [super loadView];
    
    _tableNode.leadingScreensForBatching = 2.0;  // overriding default of 2.0
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubnode:_tableNode];
    self.tableNode.frame = self.view.bounds;
    
    for (int i = 0; i < 100; i++) {
        ProductModel *productModel = [ProductModel new];
        productModel.productImageUrl = @"https://ss0.baidu.com/9rkZbzqaKgQUohGko9WTAnF6hhy/pacific/1147952599.jpg";
        productModel.productName = @(i).description;
        [self.dataSource addObject:productModel];
    }
    
    [self.tableNode reloadData];
    
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

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id obj = self.dataSource[indexPath.item];
    
    ASCellNodeBlock block = ^ASCellNode *() {
        ProductCellNode *cellNode = [[ProductCellNode alloc] initWithProduct:obj];
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
