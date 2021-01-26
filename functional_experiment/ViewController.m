//
//  ViewController.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "ViewController.h"

#import "Optional.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNumber *one = @(1);
    NSNumber *two = @(2);
    Optional *opOne = [Optional unit:one];
    Optional *opTwo = [Optional unit:two];
    Optional *opNil = [Optional unit:nil];
    
    NSLog(@"Normal add: %@ + %@ = %@", one, two, [self add:one and:two]);
    NSLog(@"Normal add: %@ + %@ = %@", one, nil, [self add:one and:nil]);
    NSLog(@"Optional add: %@ + %@ = %@", opOne.value, opTwo.value, [self addWithOptional:opOne and:opTwo].value);
    NSLog(@"Optional add: %@ + %@ = %@", opNil.value, opTwo.value, [self addWithOptional:opNil and:opTwo].value);
    NSLog(@"Optional add: %@ + %@ = %@", opOne.value, opNil.value, [self addWithOptional:opOne and:opNil].value);
}

- (NSNumber *)add:(NSNumber *)lhs and:(NSNumber *)rhs {
    if (lhs == nil) {
        return nil;
    }
    if (rhs == nil) {
        return nil;
    }
    return @(lhs.floatValue + rhs.floatValue);
}

- (Optional *)addWithOptional:(Optional *)lhs and:(Optional *)rhs {
//    return [lhs bind:^Monad * (id value) {
//        return [rhs bind:^Monad * (id value) {
//            return [Optional unit:@([lhs.value floatValue] + [rhs.value floatValue])];
//        }];
//    }];
    
    return [[lhs bind:^Monad *(id value) {
        return [Optional unit:value];
    }] bind:^Monad *(id value) {
        return [Optional unit:@([lhs.value floatValue] + [rhs.value floatValue])];
    }];
}

@end
