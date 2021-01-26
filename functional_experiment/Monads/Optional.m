//
//  Optional.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "Optional.h"

@implementation Optional

+ (instancetype)unit:(id)value {
    if (!value) {
        return nil;
    }
    
    Optional *optional = [[Optional alloc] init];
    optional.value = value;
    return optional;
}

- (instancetype)bind:(MonadBindBlock)block {
    if (self.value) {
        return block(self.value);
    }
    return nil;
}

@end
