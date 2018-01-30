//
//  AnalysisModel.m
//  OSYYKit
//
//  Created by Macx on 2018/1/19.
//  Copyright © 2018年 胡斌. All rights reserved.
//

#import "AnalysisModel.h"

@implementation AnalysisModel

////使用了黑名单，将来会剔除黑名单中的属性
//+ (NSArray *)modelPropertyBlacklist {
//    return @[@"blackListTest"];
//}

//白名单使用比较极端，只有白名单中的可以通过。    正常情况使用黑马单即可。
//+ (NSArray *)modelPropertyWhitelist {
//    return @[@"name"];
//}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"shadows" : [Shadow class]};
}

//----------start       把 json 中的birthday转换成_birthday      此处只执行一次。
// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。NO则返回 nil。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *timestamp = dic[@"birthday"];
    if (![timestamp isKindOfClass:[NSNumber class]]) return NO;
    _birthday = [NSDate dateWithTimeIntervalSince1970:timestamp.floatValue];
    return YES;
}

//此处在字典中会多一个 birthday = 1555534592;
// 当 Model 转为 JSON 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    if (!_birthday) return NO;
    dic[@"birthday"] = @(_birthday.timeIntervalSince1970);
    return YES;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id" : @[@"id",@"ID"]};
}

@end

@implementation Author

@end

@implementation Shadow

- (void)encodeWithCoder:(NSCoder *)aCoder { [self modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self modelCopy]; }
- (NSUInteger)hash { return [self modelHash]; }
- (BOOL)isEqual:(id)object { return [self modelIsEqual:object]; }
- (NSString *)description { return [self modelDescription]; }

@end
