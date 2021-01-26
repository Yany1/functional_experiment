//
//  ViewController.m
//  functional_experiment
//
//  Created by yanyihu on 2021/1/26.
//

#import "ViewController.h"
#import "Optional.h"
#import "NSArray+MonadOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNumber *one = @(1);
    NSNumber *two = @(2);
    Optional *opOne = [Optional mo_unit:one];
    Optional *opTwo = [Optional mo_unit:two];
    Optional *opNil = [Optional mo_unit:nil];
    
    NSLog(@"Normal add: %@ + %@ = %@", one, two, [self add:one and:two]);
    NSLog(@"Normal add: %@ + %@ = %@", one, nil, [self add:one and:nil]);
    NSLog(@"Normal add: %@ + %@ = %@", nil, two, [self add:nil and:two]);
    NSLog(@"Optional add: %@ + %@ = %@", opOne.value, opTwo.value, [self addWithOptional:opOne and:opTwo].value);
    NSLog(@"Optional add: %@ + %@ = %@", opNil.value, opTwo.value, [self addWithOptional:opNil and:opTwo].value);
    NSLog(@"Optional add: %@ + %@ = %@", opOne.value, opNil.value, [self addWithOptional:opOne and:opNil].value);
    
    MonadBindBlock optionalNagation = ^Optional * (NSNumber *value) {
        return [Optional mo_unit:@((-1) * [value floatValue])];
    };
    
    // unit是bind的左单位元
    Optional *lhs = [[Optional mo_unit:@(3.14)] mo_bind:optionalNagation];
    Optional *rhs = optionalNagation(@(3.14));
    NSLog(@"left identity: %@ == %@", lhs.value, rhs.value);
    
    // unit也是bind的右单位元
    lhs = [opOne mo_bind:^id<MonadOperation>(id value) {
        return [Optional mo_unit:value];
    }];
    rhs = opOne;
    NSLog(@"right identity: %@ == %@", lhs.value, rhs.value);
    
    NSArray *array = @[@(1), @(2), @(3)];
    
    NSArray *mappedArray = [array mo_map:^id(id value) {
        return @([value intValue] + 1);
    }];
    
    NSArray *flatMappedArray = [[array mo_flatMap:^NSArray *(id value) {
        return @[@([value intValue] + 1)];
    }] mo_flatMap:^NSArray *(id value) {
        return [value intValue] % 2 ? @[value] : @[];
    }];
    
    NSLog(@"mapped array: %@", mappedArray);
    NSLog(@"flat mapped array: %@", flatMappedArray);
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
    return [lhs mo_bind:^Optional * (id value) {
        return [rhs mo_bind:^Optional * (id value) {
            return [Optional mo_unit:@([lhs.value floatValue] + [rhs.value floatValue])];
        }];
    }];
}

@end
