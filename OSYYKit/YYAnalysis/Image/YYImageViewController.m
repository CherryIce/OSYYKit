//
//  YYImageViewController.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "YYImageViewController.h"

#import <YYImage.h>

#import "YYImageViewCell.h"
#import "UIView+Rect.h"

@interface YYImageViewController ()

@end

@implementation YYImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initUI];
}

- (void) initUI
{
    YYImageViewCell * cell = [[NSBundle mainBundle] loadNibNamed:@"YYImageViewCell" owner:nil options:nil].lastObject;
    cell.frame = CGRectMake(0, self.navigationController.navigationBar.bounds.size.height + 20, [UIScreen mainScreen].bounds.size.width, 170);
    [self.view addSubview:cell];
    
    cell.imageViewCellCallBack = ^(NSInteger index) {
        [self loadUIWithIndex:index];
    };
}

- (void) loadUIWithIndex:(NSInteger) index
{
    switch (index) {
        case 1:
        {
            [self changeWithImageNamed:[YYImage imageNamed:@"niconiconi"]];
        }
            break;
        case 2:
        {
            [self changeWithImageNamed:[YYImage imageNamed:@"pia"]];
        }
            break;
        case 3:
        {
            UIImage *sheet = [UIImage imageNamed:@"fav02l-sheet"];
            NSMutableArray *contentRects = [NSMutableArray new];
            NSMutableArray *durations = [NSMutableArray new];
            

            // 8 * 12 sprites in a single sheet image
            CGSize size = CGSizeMake(sheet.size.width / 8, sheet.size.height / 12);
            for (int j = 0; j < 12; j++) {
                for (int i = 0; i < 8; i++) {
                    CGRect rect;
                    rect.size = size;
                    rect.origin.x = sheet.size.width / 8 * i;
                    rect.origin.y = sheet.size.height / 12 * j;
                    [contentRects addObject:[NSValue valueWithCGRect:rect]];
                    [durations addObject:@(1 / 60.0)];
                }
            }
            YYSpriteSheetImage *sprite = [[YYSpriteSheetImage alloc] initWithSpriteSheetImage:sheet contentRects:contentRects frameDurations:durations loopCount:0];
            [self changeWithImageNamed:sprite];
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        default:
            break;
    }
}

/** 不同按钮动画 */
- (void) changeWithImageNamed:(UIImage *) image
{
    for (UIView * view in self.view.subviews) {
        if (![view isKindOfClass:[YYImageViewCell class]]) {
            [view removeFromSuperview];
        }
    }
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    imageView.centerX = self.view.width / 2;
    imageView.top = [(UIView *)[self.view.subviews lastObject] bottom] + 30;
    imageView.width = image.size.width;
    imageView.height = image.size.height;
    [self.view addSubview:imageView];
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
