//
//  STNextViewController.m
//  STInterViewProject
//
//  Created by song on 2021/3/16.
//  Copyright © 2021 Knowin. All rights reserved.
//

#import "STNextViewController.h"
#import "STTimerTest.h"
#import "STAnimation.h"
#import <objc/runtime.h>
#import "STGCD.h"
#import "STKVCTest.h"

@interface STNextViewController ()

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)STTimerTest *timer;

@end

@implementation STNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self testExample];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)testExample {
    [self testKVC];
}

- (void)testTimer {
    self.timer = [[STTimerTest alloc]init];
    [self.timer testTimerLocal];
}

- (void)testCategory {
    STAnimation *animation = [[STAnimation alloc]init];
    [animation printName];
}

- (void)testTaggedPoint {
    dispatch_queue_t queue = dispatch_queue_create("testTaggedPoint", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abcdefghi"];
        });
    }
}

- (void)testGCD {
    STGCD *gcd = [[STGCD alloc]init];
}

- (void)testKVC {
    STKVCTest *kvc = [[STKVCTest alloc]init];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
