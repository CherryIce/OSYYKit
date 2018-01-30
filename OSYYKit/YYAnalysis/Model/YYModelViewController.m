//
//  YYModelViewController.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "YYModelViewController.h"

#import "OSModelCell.h"

@interface YYModelViewController ()

@end

@implementation YYModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    OSModelCell  * cell = [[NSBundle mainBundle] loadNibNamed:@"OSModelCell" owner:nil options:nil].lastObject;
    cell.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 130);
    cell.center = self.view.center;
    [self.view addSubview:cell];
    
    NSDictionary * dictionary = [self setAnalysisDictionary];
    
    AnalysisModel * model = [AnalysisModel modelWithDictionary:dictionary];
    
    cell.model = model;
}

- (NSDictionary *) setAnalysisDictionary {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"OsModel" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
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
