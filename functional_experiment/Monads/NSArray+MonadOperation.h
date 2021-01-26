//
//  NSArray+MonadOperation.h
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "MonadOperation.h"

@interface NSArray (MonadOperation) <MonadOperation>

+ (NSArray *)mo_unit:(id)value;

- (NSArray *)mo_bind:(NSArray * (^)(id value))block;

- (NSArray *)mo_flatMap:(NSArray * (^)(id value))block;

// 非单子方法
- (NSArray *)mo_map:(id (^)(id value))block;

@end
