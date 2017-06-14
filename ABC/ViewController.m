//
//  ViewController.m
//  ABC
//
//  Created by 张浩 on 2017/6/10.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBingXingAsyncABC];

}
//串行同步
-(void)createABC{
    dispatch_queue_t queueSeriod = dispatch_queue_create("Seriod", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d A",[NSThread currentThread],i);
        });
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d B",[NSThread currentThread],i);
        });
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d C",[NSThread currentThread],i);
        });
    }
}
//串行异步
-(void)createAsyncABC{
    dispatch_queue_t queueSeriod = dispatch_queue_create("Seriod", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d A",[NSThread currentThread],i);
        });
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d B",[NSThread currentThread],i);
        });
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d C",[NSThread currentThread],i);
        });
    }
}

//并行同步
-(void)createBingXingSyncABC{
    dispatch_queue_t queueSeriod = dispatch_queue_create("Seriod", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 100; i++) {
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d A",[NSThread currentThread],i);
        });
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d B",[NSThread currentThread],i);
        });
        dispatch_sync(queueSeriod, ^{
            NSLog(@"%@---%d C",[NSThread currentThread],i);
        });
    }
}
//并行同步
-(void)createBingXingAsyncABC{
    dispatch_queue_t queueSeriod = dispatch_queue_create("Seriod", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d A",[NSThread currentThread],i);
        });
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d B",[NSThread currentThread],i);
        });
        dispatch_async(queueSeriod, ^{
            NSLog(@"%@---%d C",[NSThread currentThread],i);
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
