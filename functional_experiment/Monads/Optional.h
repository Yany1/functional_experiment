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

+ (Optional *)mo_unit:(id)value;

- (Optional *)mo_bind:(Optional * (^)(id value))block;

@end
