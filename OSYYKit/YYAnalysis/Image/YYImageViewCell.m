//
//  YYImageViewCell.m
//  OSYYKit
//
//  Created by Macx on 2018/1/24.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "YYImageViewCell.h"

@implementation YYImageViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (_imageViewCellCallBack) {
        _imageViewCellCallBack(sender.tag);
    }
}


@end
