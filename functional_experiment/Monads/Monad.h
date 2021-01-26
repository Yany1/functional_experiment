//
//  Monad.h
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import <Foundation/Foundation.h>

@class Monad;

/// 单子运算符的绑定所用的block类型
/// @param value 被包裹的值
/// @return 返回一个单子运算符
typedef Monad * (^MonadBindBlock)(id value);

/// 单子运算符
@interface Monad : NSObject

/// 返回一个包裹了value的Monad（单子运算符）对象
/// @param value 被包裹的值对象
+ (instancetype)unit:(id)value;

/// 为单子运算符绑定一个函数
/// @param block 被绑定的block函数
- (instancetype)bind:(MonadBindBlock)block;

@end
