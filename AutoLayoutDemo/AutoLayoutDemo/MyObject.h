//
//  MyObject.h
//  AutoLayoutDemo
//
//  Created by dingxin on 2017/5/4.
//  Copyright © 2017年 dingxin. All rights reserved.
//

#import <Foundation/Foundation.h>


#define TLog(prefix,Obj) {NSLog(@"变量内存地址：%p, 变量值：%p, 指向对象值：%@, --> %@",&Obj,Obj,Obj,prefix);}

@interface MyObject : NSObject

@property (nonatomic, strong) NSString *text;

@end
