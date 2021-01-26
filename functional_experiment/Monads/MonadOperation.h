//
//  MonadOperation.h
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

@protocol MonadOperation;

/// 单子运算符的绑定所用的block类型
/// @param value 被包裹的值
/// @return 返回一个单子运算符
typedef id<MonadOperation> (^MonadBindBlock)(id value);

@protocol MonadOperation <NSObject>

/// 返回一个包裹了value的Monad（单子运算符）对象
/// @param value 被包裹的值对象
+ (id<MonadOperation>)mo_unit:(id)value;

/// 为单子运算符绑定一个函数
/// @param block 被绑定的block函数
- (id<MonadOperation>)mo_bind:(MonadBindBlock)block;

@end
