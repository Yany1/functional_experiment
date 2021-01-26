//
//  Optional.h
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import "MonadOperation.h"

@interface Optional : NSObject <MonadOperation>

@property (nonatomic, strong) id value;

+ (id<MonadOperation>)unit:(id)value;

- (id<MonadOperation>)bind:(MonadBindBlock)block;

@end
