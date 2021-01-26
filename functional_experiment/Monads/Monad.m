//
//  Monad.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "Monad.h"

@implementation Monad

#pragma mark Abstract methods

+ (instancetype)unit:(id)value {
    return nil;
}

- (instancetype)bind:(MonadBindBlock)block {
    return nil;
}

@end
