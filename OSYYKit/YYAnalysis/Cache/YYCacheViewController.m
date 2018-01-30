//
//  YYCacheViewController.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "YYCacheViewController.h"

#import <YYCache.h>

@interface YYCacheViewController ()

@end

@implementation YYCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

/** 同步缓存 */
- (void) synchronizeCache
{
    //模拟数据
    NSString *value = @" data for synchronize cache ";
    //模拟一个key
    //同步方式
    NSString * key = @"key";
    YYCache  * yyCache = [YYCache cacheWithName:@"synchronizeCache"];
    //根据key写入缓存value
    [yyCache setObject:value forKey:key];
    //判断缓存是否存在
    BOOL isContains=[yyCache containsObjectForKey:key];
    NSLog(@"containsObject : %@", isContains?@"YES":@"NO");
    //根据key读取数据
    id vuale=[yyCache objectForKey:key];
    NSLog(@"value : %@",vuale);
    //根据key移除缓存
    [yyCache removeObjectForKey:key];
    //移除所有缓存
    [yyCache removeAllObjects];
}

/** 异步缓存 */
- (void) asynchronizeCache
{
    //模拟数据
    NSString * value = @" data for synchronize cache ?";
    //模拟一个key
    //异步方式
    NSString * key = @"key";
    YYCache *yyCache=[YYCache cacheWithName:@"asynornizeCache"];
    //根据key写入缓存value
    [yyCache setObject:value forKey:key withBlock:^{
        NSLog(@"setObject sucess");
    }];
    //判断缓存是否存在
    [yyCache containsObjectForKey:key withBlock:^(NSString * _Nonnull key, BOOL contains) {
        NSLog(@"containsObject : %@", contains?@"YES":@"NO");
    }];
    
    //根据key读取数据
    [yyCache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        NSLog(@"objectForKey : %@",object);
    }];
    
    //根据key移除缓存
    [yyCache removeObjectForKey:key withBlock:^(NSString * _Nonnull key) {
        NSLog(@"removeObjectForKey %@",key);
    }];
    //移除所有缓存
    [yyCache removeAllObjectsWithBlock:^{
        NSLog(@"removeAllObjects sucess");
    }];
    
    //移除所有缓存带进度
    [yyCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
        NSLog(@"removeAllObjects removedCount :%d  totalCount : %d",removedCount,totalCount);
    } endBlock:^(BOOL error) {
        if(!error){
            NSLog(@"removeAllObjects sucess");
        }else{
            NSLog(@"removeAllObjects error");
        }
    }];
}

- (void) terminalRemoveSomeCahce
{
    YYCache *yyCache = [YYCache cacheWithName:@"LRU"];
    [yyCache.memoryCache setCountLimit:50];//内存最大缓存数据个数
    [yyCache.diskCache setCostLimit:10*1024];//磁盘最大缓存开销
    [yyCache.diskCache setCountLimit:50];//磁盘最大缓存数据个数
    [yyCache.diskCache setAutoTrimInterval:60];//设置磁盘lru动态清理频率 默认 60秒
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

@end
