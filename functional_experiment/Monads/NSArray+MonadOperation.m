//
//  NSArray+MonadOperation.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "NSArray+MonadOperation.h"

@implementation NSArray (MonadOperation)

+ (NSArray *)mo_unit:(id)value {
    if (value) {
        return @[value];
    }
    return nil;
}

- (NSArray *)mo_bind:(NSArray * (^)(id value))block {
    if (self.count > 0) {
        return block(self[0]);
    }
    return nil;
}

- (NSArray *)mo_flatMap:(NSArray *(^)(id))block {
    if (self.count == 0) {
        return nil;
    }
    if (self.count == 1) {
        return [self mo_bind:block];
    }
    return [[self mo_bind:block]
            arrayByAddingObjectsFromArray:[[self subarrayWithRange:NSMakeRange(1, self.count - 1)]
                                           mo_flatMap:block]];
}

- (NSArray *)mo_map:(id (^)(id value))block {
     NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.count];
     for (int i = 0; i < self.count; i++) {
         [newArray addObject:block(self[i])];
     }
     return newArray;
 }
 

@end
