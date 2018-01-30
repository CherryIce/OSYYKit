//
//  YYImageViewCell.h
//  OSYYKit
//
//  Created by Macx on 2018/1/24.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYImageViewCell : UITableViewCell

@property (nonatomic,copy) void (^imageViewCellCallBack)(NSInteger index);

@end
