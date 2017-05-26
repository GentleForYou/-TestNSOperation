//
//  ViewController.m
//  NSOperationTest
//
//  Created by 出神入化 on 15/8/7.
//  Copyright © 2015年 出神入化. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"1212");
    NSLog(@"4324324");
    // Do any additional setup after loading the view, typically from a nib.
    //1.创建NSInvocationOperation对象
//        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    //2.开始执行
//    [operation start];
    
//    //1.创建NSBlockOperation对象
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    //2.开始任务
//    [operation start];
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    for (int i = 0; i < 5; i++) {
//        [operation addExecutionBlock:^{
//            NSLog(@"%@", [NSString stringWithFormat:@"%d", i]);
//        }];
//    }
//    [operation start];
    
    
    //创建主队列
//    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
//    NSOperationQueue *opertainQeue = [[NSOperationQueue alloc] init];
//    NSBlockOperation *opertain = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    for (int i = 0; i < 5; i++) {
//        [opertain addExecutionBlock:^{
//            NSLog(@"第%d次打印 %@", i ,[NSThread currentThread]);
//        }];
//    }
//    [opertainQeue addOperation:opertain];
    
//    //1.任务一：下载图片
//    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"下载图片 - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    //2.任务二：打水印
//    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"打水印   - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    //3.任务三：上传图片
//    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"上传图片 - %@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1.0];
//    }];
//    //4.设置依赖
//    [operation2 addDependency:operation1];      //任务二依赖任务一
//    [operation3 addDependency:operation2];      //任务三依赖任务二
//    //5.创建队列并加入任务
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperations:@[operation3, operation2, operation1] waitUntilFinished:NO];
    
//    
//    NSBlockOperation *opertain1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"线程--%@,下载图片", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1];
//    }];
//    
//    NSBlockOperation *opertain2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"线程--%@,打水印", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1];
//    }];
//    
//    NSBlockOperation *opertain3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"线程--%@,上传图片", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1];
//    }];
//    
//    [opertain2 addDependency:opertain1];
//    [opertain3 addDependency:opertain2];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperations:@[opertain1, opertain2, opertain3] waitUntilFinished:NO];
    //GCD
   __block NSInteger lastTicket = 100;
//    //需要一个全局变量queue，要让所有线程的这个操作都加到一个queue中
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_sync(queue, ^{
//        NSInteger ticket = lastTicket;
//        [NSThread sleepForTimeInterval:0.1];
//        NSLog(@"%ld - %@",ticket, [NSThread currentThread]);
//        ticket -= 1;
//        lastTicket = ticket;
//    });
    //NSOperation & NSOperationQueue
    //重点：1. 全局的 NSOperationQueue, 所有的操作添加到同一个queue中
    //       2. 设置 queue 的 maxConcurrentOperationCount 为 1
    //       3. 如果后续操作需要Block中的结果，就需要调用每个操作的waitUntilFinished，阻塞当前线程，一直等到当前操作完成，才允许执行后面的。waitUntilFinished 要在添加到队列之后！
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSInteger ticket = lastTicket;
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%ld - %@",ticket, [NSThread currentThread]);
        ticket -= 1;
        lastTicket = ticket;
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    [operation waitUntilFinished];
//    //后续要做的事
    //延时3秒  并传递参数123
//    [self performSelector:@selector(run) withObject:@"123" afterDelay:3];
    //回主线程
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
