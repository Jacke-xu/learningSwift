//
//  ViewController.m
//  testSwift
//
//  Created by 范云飞 on 2018/8/17.
//  Copyright © 2018年 范云飞. All rights reserved.
//

#import "ViewController.h"
#import "testSwift-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark ----------------- @objc ------------------------
    testSwiftObj * testswiftobj = [[testSwiftObj alloc]init];
    [testswiftobj testPrint];
    
    
    
#pragma mark ----------------- dynamic ----------------------
    DynamicSwiftClass * dynamicSwiftClass = [[DynamicSwiftClass alloc]init];
    NSLog(@"%ld", (long)dynamicSwiftClass.first);
    
    [dynamicSwiftClass dynamicFunc];
    
    
#pragma mark ----------------- @nonobjc ---------------------
    testNonobjcClass * testnonobjcclass = [[testNonobjcClass alloc]init];
    //No visible @interface for 'testNonobjcClass' declares the selector 'show'
//    [testnonobjcclass show];
    
#pragma mark ----------------- @objcMembers -----------------------
    
    nonobjcClass * nonobjcclass = [[nonobjcClass alloc]init];
    [nonobjcclass fuck];
    
    [nonobjcclass sayhello];
    
    subClass * subclass = [[subClass alloc]init];
    [subclass bar];
    [subclass bar1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
