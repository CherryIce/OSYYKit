//
//  OSModelCell.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "OSModelCell.h"

@implementation OSModelCell
{
    __weak IBOutlet UILabel *authorname;
    __weak IBOutlet UILabel *authorpages;
    __weak IBOutlet UILabel *birthday;
    __weak IBOutlet UILabel *userid;
    __weak IBOutlet UILabel *username;
    __weak IBOutlet UILabel *shadow1;
    __weak IBOutlet UILabel *shadow2;
    __weak IBOutlet UILabel *shadow3;
    __weak IBOutlet UILabel *updateTime;
}

- (void)setModel:(AnalysisModel *)model
{
    _model = model;
    authorname.text = model.author.name;
    authorpages.text = [NSString stringWithFormat:@"%zd",model.author.pages];
    birthday.text = [NSString stringWithFormat:@"%@",[self timeUnit:model.birthday dateFormat:@"YYYY-MM-dd"]];
    userid.text = [NSString stringWithFormat:@"%zd",model.Id];
    username.text = model.name;
    
    for (int i = 0; i< model.shadows.count ; i++) {
        Shadow * shadow = model.shadows[i];
        switch (i) {
            case 0:
                shadow1.text = shadow.count;
                break;
            case 1:
                shadow2.text = shadow.count;
                break;
            case 2:
                shadow3.text = shadow.count;
                break;
            default:
                break;
        }
    }
    
    updateTime.text = [NSString stringWithFormat:@"%@",model.updateTime];;
}

/** 转换时间戳 dateFormat:@"YYYY-MM-dd"  date:NSDate */
- (NSString *) timeUnit:(NSDate *) date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:dateFormat];
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    return [formatter stringFromDate:date];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
