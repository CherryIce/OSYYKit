//
//  AnalysisModel.h
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <YYKit.h>

@class Author,Shadow;

@interface AnalysisModel : NSObject

@property (nonatomic,copy) NSArray<Shadow*> *shadows;

@property NSDate   *birthday;

@property (nonatomic,copy) NSString *updateTime;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSInteger Id;

@property Author * author;

@end

@interface Author : NSObject

@property NSString *name;

@property NSUInteger pages;

@end

@interface Shadow : NSObject<NSCoding, NSCopying>

@property (nonatomic, copy) NSString *count;

@end

