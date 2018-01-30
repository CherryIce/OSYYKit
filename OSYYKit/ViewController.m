//
//  ViewController.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "ViewController.h"

#import "YYModelViewController.h"
#import "YYCacheViewController.h"
#import "YYImageViewController.h"
#import "YYWebImageViewController.h"
#import "YYTextViewController.h"
#import "YYKeyboardManagerViewController.h"
#import "YYDispatchQueuePoolViewController.h"
#import "YYAsyncLayerViewController.h"
#import "YYCategoriesViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,copy) NSArray * dataArr;

@end

static NSString * CellId = @"UITableViewCell";

/**
 * 建议框架一个个导入,不需要直接导入YYKit,否则坑会有些许问题
 YYModel — 高性能的 iOS JSON 模型框架。
 YYCache — 高性能的 iOS 缓存框架。
 YYImage — 功能强大的 iOS 图像框架。
 YYWebImage — 高性能的 iOS 异步图像加载框架。
 YYText — 功能强大的 iOS 富文本框架。
 YYKeyboardManager — iOS 键盘监听管理工具。
 YYDispatchQueuePool — iOS 全局并发队列管理工具。
 YYAsyncLayer — iOS 异步绘制与显示的工具。
 YYCategories — 功能丰富的 Category 类型工具库。
 **/

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

- (void) initUI
{
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
    _dataArr = @[@"YYModel",@"YYCache",@"YYImage",@"YYWebImage",@"YYText",@"YYKeyboardManager",@"YYDispatchQueuePool",@"YYAsyncLayer",@"YYCategories"];
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self.navigationController pushViewController:[[YYModelViewController alloc] init] animated:true];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[[YYCacheViewController alloc] init] animated:true];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[YYImageViewController alloc] init] animated:true];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[YYWebImageViewController alloc] init] animated:true];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:[[YYTextViewController alloc] init] animated:true];
        }
            break;
        case 5:
        {
            [self.navigationController pushViewController:[[YYKeyboardManagerViewController alloc] init] animated:true];
        }
            break;
        case 6:
        {
            [self.navigationController pushViewController:[[YYDispatchQueuePoolViewController alloc] init] animated:true];
        }
            break;
        case 7:
        {
            [self.navigationController pushViewController:[[YYAsyncLayerViewController alloc] init] animated:true];
        }
            break;
        case 8:
        {
            [self.navigationController pushViewController:[[YYCategoriesViewController alloc] init] animated:true];        }
            break;
        default:
            break;
    }
}

@end
