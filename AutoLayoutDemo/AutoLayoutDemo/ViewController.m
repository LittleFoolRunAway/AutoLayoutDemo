//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by dingxin on 17/3/24.
//  Copyright © 2017年 dingxin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import "Masonry.h"

#import "MyObject.h"

@interface ViewController ()
{
    Person *_hostP;
    
    UIView *_redV;
    UIView *_yellowV;
    UIView *_blueV;
    
    UIView *_purperV;
    
    BOOL flag;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self testNoBackTask];
////
////    
//    [self testBackTask];
    
//    _hostP = [[Person alloc] init];
//    _hostP.name = @"Tom";
//    _hostP.age = @"12";
//    [_hostP setValue:@(0000) forKey:@"tel"];
//    
//    [_hostP addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    [_hostP addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
//    [_hostP addObserver:self forKeyPath:@"tel" options:NSKeyValueObservingOptionNew context:nil];
//    
//    
//    
//    _hostP.name = @"Lily";
//    
//    [_hostP setValue:@"Jack" forKey:@"name"];
//    
//    [_hostP setValue:@"10" forKey:@"age"];
//    
//    [_hostP setValue:@"20" forKey:@"age"];
//    
//    [_hostP setValue:@(18611875773) forKey:@"tel"];
    
    _redV = [[UIView alloc] init];
    _redV.backgroundColor = [UIColor redColor];
    _redV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_redV];
    
    
    NSLayoutConstraint *redLeftLC = [NSLayoutConstraint constraintWithItem:_redV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:redLeftLC];
    
    NSLayoutConstraint *redBottomLC = [NSLayoutConstraint constraintWithItem:_redV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:redBottomLC];
    
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:_redV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [_redV addConstraint:redWidth];
    
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:_redV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [_redV addConstraint:redHeight];
    
    
    _yellowV = [[UIView alloc] init];
    _yellowV.backgroundColor = [UIColor yellowColor];
    _yellowV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_yellowV];
    
    
    NSLayoutConstraint *yellowLeftLC = [NSLayoutConstraint constraintWithItem:_yellowV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_redV attribute:NSLayoutAttributeRight multiplier:1.0 constant:20];
    [self.view addConstraint:yellowLeftLC];
    
    NSLayoutConstraint *yellowBottomLC = [NSLayoutConstraint constraintWithItem:_yellowV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:yellowBottomLC];
    
    NSLayoutConstraint *yellowWidth = [NSLayoutConstraint constraintWithItem:_yellowV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_redV attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:yellowWidth];
    
    NSLayoutConstraint *yellowHeight = [NSLayoutConstraint constraintWithItem:_yellowV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_redV attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:yellowHeight];
    
    
    
    
    _blueV = [[UIView alloc] init];
    _blueV.backgroundColor = [UIColor blueColor];
    _blueV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_blueV];

    //创建第一个约束，左边间距，由于是想要与黄色有20的间距，那么参照参数“toItem”就应该填redView
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:_blueV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_yellowV attribute:NSLayoutAttributeRight multiplier:1.0f constant:20.0f];
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:blueLeft];
    //现在我们已经可以确定自己水平方向的位置了，还差垂直方向的位置，现在我们来创建第二个约束，参照物依然是黄色方块，需求是要离self.view底部20间距，这不是正好和黄色一样么，那么我们可以直接与黄色方块底部对齐就行了
    NSLayoutConstraint *blueBottom = [NSLayoutConstraint constraintWithItem:_blueV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-20];//与黄色方块底部对齐，倍数1.0f.差值0.0f
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:blueBottom];
    //剩下两个约束差不多，我就一并描述了，它们都以redView为参照，与其等宽等高
    NSLayoutConstraint *blueW = [NSLayoutConstraint constraintWithItem:_blueV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:50.0];
    [self.view addConstraint:blueW];
    
    NSLayoutConstraint *blueH = [NSLayoutConstraint constraintWithItem:_blueV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:50.0f];
    [self.view addConstraint:blueH];
    
    
    //对蓝色View添加约束，约束蓝色view与红色View的间距为20
    NSLayoutConstraint *blueAnotherLeft = [NSLayoutConstraint constraintWithItem:_blueV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_redV attribute:NSLayoutAttributeRight multiplier:1.0f constant:20];
    UILayoutPriority priority = 250;//设置优先级
    blueAnotherLeft.priority = priority;
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:blueAnotherLeft];
    
    
    _purperV = [[UIView alloc] init];
    _purperV.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_purperV];
    [_purperV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_blueV.mas_right).offset(20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.width.equalTo(_redV.mas_width);
        make.height.equalTo(_redV.mas_height);
    }];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.text = @"Test";
    [_purperV addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(_purperV.mas_centerX);
        make.center.mas_equalTo(_purperV);
    }];
    
    
//    [self arcTest];
    
//    NSLog(@"\n---------MainThread  \nTime: %@    \nfunc: %s   \nCurrent \nNSThread:%@ \n\n", [NSDate date], __FUNCTION__, [NSThread currentThread]);
    
    
//    [self testSynInSerialQueue];
//    [self testAsynInSeriaQueue];
    
//    [self testSynInConcurrentQueue];
//    [self testAsynInConcurrentQueue];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //先把蓝色方块从父视图上移除
    [_yellowV removeFromSuperview];
    //动画更新界面
    [UIView animateWithDuration:1.0f animations:^{
        [self.view layoutIfNeeded];
    }];
    
    [self animateTest];
    
    
    flag = !flag;
    
    if (flag) {
        [self weakStrongBlockTest];
    }else{
        [self weakStrongBlockTest2];
    }
    
}

//-(void)viewDidLayoutSubviews
//{
////    [super viewDidLayoutSubviews];
//}

-(void)animateTest
{
    NSValue *lastAnimtTarValue = nil;
    
    CABasicAnimation *lastAnimation = (CABasicAnimation *)[_purperV.layer animationForKey:@"rota"];
    if (lastAnimation) {
        lastAnimtTarValue = lastAnimation.toValue;
    }
    
    CABasicAnimation *rotaAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotaAnimation.fromValue = [NSValue valueWithCATransform3D:_purperV.layer.presentationLayer.transform];
    CATransform3D lastTarTransf = lastAnimtTarValue ? [lastAnimtTarValue CATransform3DValue]: CATransform3DIdentity;
    
    rotaAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(lastTarTransf, M_PI_2, 0, 0, 1)];
//        rotaAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(<#CGFloat angle#>, <#CGFloat x#>, <#CGFloat y#>, <#CGFloat z#>)];
    rotaAnimation.duration = 1;
    rotaAnimation.beginTime = CACurrentMediaTime()+2;
    
    rotaAnimation.fillMode = kCAFillModeForwards;
//    rotaAnimation.autoreverses = NO;
    rotaAnimation.removedOnCompletion = NO;
    
    [_purperV.layer addAnimation:rotaAnimation forKey:@"rota"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testNoBackTask
{
    NSLog(@"NoBackTask Begin");
    dispatch_queue_t workQueue = dispatch_queue_create("workQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (1) {
            NSLog(@"NO BackTask  Time: %@   func: %s\n Count:%d", [NSDate date], __FUNCTION__, i);
            i++;
            sleep(1);
        }
    });
}

-(void)testBackTask
{
    __block UIBackgroundTaskIdentifier bkTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithName:@"DBOperatorTask" expirationHandler:^{
        //
        if (bkTaskId != UIBackgroundTaskInvalid) {
            NSLog(@"DBOperatorTask expired: %ld", (long)bkTaskId);
            [[UIApplication sharedApplication] endBackgroundTask:bkTaskId];
            bkTaskId = UIBackgroundTaskInvalid;
        }
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //
        NSLog(@"BackTask Begin :%ld", bkTaskId);
        
        int i = 0;
        while (i<30) {
            NSLog(@"Time: %@   func: %s\n Count:%d", [NSDate date], __FUNCTION__, i);
            i++;
            sleep(1);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bkTaskId != UIBackgroundTaskInvalid) {
                NSLog(@"DBOperatorTask finished: %ld", (long)bkTaskId);
                [[UIApplication sharedApplication] endBackgroundTask:bkTaskId];
                bkTaskId = UIBackgroundTaskInvalid;
            }

        });
    });
    
//    [[UIApplication sharedApplication] endBackgroundTask:bkTaskId];
//    bkTaskId = UIBackgroundTaskInvalid;
}


-(void)dealloc
{
//    @try {
//        [_hostP removeObserver:self forKeyPath:@""];
//    } @catch (NSException *exception) {
//        //
//    } @finally {
//        //
//    }
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
////    if ([keyPath isEqualToString:@""]) {
//        //
//        NSLog(@"keyPath: %@   old value: %@   new value：%@", keyPath, [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
////    }else{
////        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
////    }
//}
-(void)arcTest
{
//    NSString *testStr = @"124";
//
//    NSLog(@"testStr retainCount:%ld", CFGetRetainCount((__bridge CFTypeRef)testStr));
//    NSLog(@"testStr:%@, addredd:%p  pAddress:%p", testStr, testStr, &testStr);
//    
//    __strong NSString * strongStr = testStr;
//    NSLog(@"testStr retainCount:%ld", CFGetRetainCount((__bridge CFTypeRef)testStr));
//    NSLog(@"strong :%@, address:%p  pAddress:%p", strongStr, strongStr, &strongStr);
//    
//    
//    __strong NSString *sstrongStr = strongStr;
//    NSLog(@"sstrong :%@, address:%p  pAddress:%p", sstrongStr, sstrongStr, &sstrongStr);
    
    
    
    Person *personObj = [[Person alloc] init];
    personObj.name = @"Tom";
    personObj.age = @"18";

    NSLog(@"personObj:%@, addredd:%p  pAddress:%p", personObj, personObj, &personObj);

//    @autoreleasepool {
//        Person __autoreleasing * autoRPerson = personObj;
//    }
    
//    Person * __strong *personP = &personObj;
    
    
    __weak Person *weakPerson = personObj;
    NSLog(@"weakPerson:%@, addredd:%p  pAddress:%p", weakPerson, weakPerson, &weakPerson);
//    __strong Person *strongPersonObj = personObj;
//    NSLog(@"strongPersonObj:%@, addredd:%p  pAddress:%p", strongPersonObj, strongPersonObj, &strongPersonObj);
//    
//    __strong Person *sstrongPersonObj = strongPersonObj;
//    NSLog(@"sstrongPersonObj:%@, addredd:%p  pAddress:%p", sstrongPersonObj, sstrongPersonObj, &sstrongPersonObj);
//    
//    strongPersonObj = nil;
//    NSLog(@"personObj:%@, addredd:%p  pAddress:%p", personObj, personObj, &personObj);
//    NSLog(@"strongPersonObj:%@, addredd:%p  pAddress:%p", strongPersonObj, strongPersonObj, &strongPersonObj);
//    NSLog(@"sstrongPersonObj:%@, addredd:%p  pAddress:%p", sstrongPersonObj, sstrongPersonObj, &sstrongPersonObj);
//    
//    sstrongPersonObj = nil;
//    NSLog(@"personObj:%@, addredd:%p  pAddress:%p", personObj, personObj, &personObj);
//    NSLog(@"strongPersonObj:%@, addredd:%p  pAddress:%p", strongPersonObj, strongPersonObj, &strongPersonObj);
//    NSLog(@"sstrongPersonObj:%@, addredd:%p  pAddress:%p", sstrongPersonObj, sstrongPersonObj, &sstrongPersonObj);
    
    void *p = 0;
    
    {
        id personId = [[Person alloc] init];
        
        p = (__bridge_retained void *)personId;
    }
    
    NSLog(@"class = %@", [(__bridge_transfer id)p class]);
    
    
    
}


//串行
-(void)testSynInSerialQueue
{
    dispatch_queue_t workQueue = dispatch_queue_create("SerialWorkQueue0", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(workQueue, ^{
        //
        int i = 0;
        while (i<5) {
            NSLog(@"\n---------SynInSerialQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
    dispatch_sync(workQueue, ^{
        //
        int i = 10;
        while (i<15) {
            NSLog(@"\n---------SynInSerialQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
}

-(void)testAsynInSeriaQueue
{
    dispatch_queue_t workQueue = dispatch_queue_create("SerialWorkQueue1", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (i<10) {
            NSLog(@"\n---------AsynInSeriaQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (i<10) {
            NSLog(@"\n=========AsynInSeriaQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
}


//并行
-(void)testSynInConcurrentQueue
{
    dispatch_queue_t workQueue = dispatch_queue_create("ConcurrentWorkQueue0", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (i<5) {
            NSLog(@"\n---------SynInConcurrentQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
    
    NSLog(@"\n+++++++++MainThread  \nTime: %@    \nfunc: %s   \nCurrent \nNSThread:%@ \n\n", [NSDate date], __FUNCTION__, [NSThread currentThread]);
    
    dispatch_sync(workQueue, ^{
        //
        int i = 0;
        while (i<5) {
            NSLog(@"\n=========SynInConcurrentQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
}

-(void)testAsynInConcurrentQueue
{
    dispatch_queue_t workQueue = dispatch_queue_create("ConcurrentWorkQueue1", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (i<5) {
            NSLog(@"\n---------SynInConcurrentQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
    
    NSLog(@"\n++++++++++MainThread  \nTime: %@    \nfunc: %s   \nCurrent \nNSThread:%@ \n\n", [NSDate date], __FUNCTION__, [NSThread currentThread]);
    
    dispatch_async(workQueue, ^{
        //
        int i = 0;
        while (i<5) {
            NSLog(@"\n==========SynInConcurrentQueue  \nTime: %@   \nfunc: %s    \nCount:%d   \nCurrent NSThread:%@\n\n", [NSDate date], __FUNCTION__, i, [NSThread currentThread]);
            i++;
            sleep(1);
        }
    });
}



-(void)weakStrongBlockTest
{
    MyObject *obj = [[MyObject alloc]init];
    obj.text = @"my-object";
    TLog(@"obj", obj);
    
    __weak MyObject *weakObj = obj;
    TLog(@"weakObj-0", weakObj);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong MyObject *strongObj = weakObj;
        TLog(@"weakObj - block", weakObj);
        TLog(@"strongObj - block", strongObj);
        
        sleep(3);
        
        TLog(@"weakObj - block", weakObj);
        TLog(@"strongObj - block", strongObj);
    });
    NSLog(@"------ sleep 1s");
    sleep(1);
    obj = nil;
    TLog(@"weakObj-1", weakObj);
    NSLog(@"------ sleep 5s");
    sleep(5);
    TLog(@"weakObj-2", weakObj);
}


-(void)weakStrongBlockTest2
{
    MyObject *obj = [[MyObject alloc]init];
    obj.text = @"==my-object2";
    TLog(@"==obj", obj);
    
    __weak MyObject *weakObj = obj;
    TLog(@"==weakObj-0", weakObj);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        __strong MyObject *strongObj = weakObj;
        TLog(@"==weakObj - block", weakObj);
//        TLog(@"==strongObj - block", strongObj);
        
        sleep(3);
        
        TLog(@"==weakObj - block", weakObj);
//        TLog(@"==strongObj - block", strongObj);
    });
    NSLog(@"==------ sleep 1s");
    sleep(1);
    obj = nil;
    TLog(@"==weakObj-1", weakObj);
    NSLog(@"==------ sleep 5s");
    sleep(5);
    TLog(@"==weakObj-2", weakObj);
}



@end
