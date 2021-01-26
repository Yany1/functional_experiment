//
//  Array.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "Array.h"

@implementation Array

+ (instancetype)unit:(NSArray *)value {
    Array *array = [[Array alloc] init];
    array.array = value;
    return array;
}

- (instancetype)bind:(MonadBindBlock)block {
    return [Array unit:block(self.array)];
}

@end
