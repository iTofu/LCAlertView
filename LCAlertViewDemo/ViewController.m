//
//  ViewController.m
//  LCAlertViewDemo
//
//  Created by Leo on 16/4/19.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import "ViewController.h"
#import "LCAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"Block Properties" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(100.0f, 100.0f, 200.0f, 30.0f);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setTitle:@"Quick Method" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(100.0f, 200.0f, 200.0f, 30.0f);
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setTitle:@"Text Input" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Clicked) forControlEvents:UIControlEventTouchUpInside];
    btn3.frame = CGRectMake(100.0f, 300.0f, 200.0f, 30.0f);
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn4 setTitle:@"Text Input (UIAlertView)" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4Clicked) forControlEvents:UIControlEventTouchUpInside];
    btn4.frame = CGRectMake(100.0f, 400.0f, 200.0f, 30.0f);
    [self.view addSubview:btn4];
}

#pragma mark Block Properties
/**
 *  Block Properties
 */
- (void)btn1Clicked {
    LCAlertView *alertView = [[LCAlertView alloc] initWithTitle:@"LCAlertView" message:@"Block Properties" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"1", @"2", @"3", nil];
    
    alertView.clickedButtonAtIndexBlock = ^(LCAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
    };
    
    alertView.cancelBlock = ^(LCAlertView *alertView) {
        NSLog(@"cancel");
    };
    
    // You should set `willPresentAlertViewBlock` before `- (void)show;`
    // 设置 willPresentAlertViewBlock 一定要放在 `- (void)show;`方法之前
    alertView.willPresentAlertViewBlock = ^(LCAlertView *alertView) {
        NSLog(@"willPresentAlertView");
    };
    
    alertView.didPresentAlertViewBlock = ^(LCAlertView *alertView) {
        NSLog(@"didPresentAlertView");
    };
    
    alertView.willDismissWithButtonIndexBlock = ^(LCAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"willDismissWithButtonIndexBlock: %d", (int)buttonIndex);
    };
    
    alertView.didDismissWithButtonIndexBlock = ^(LCAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
    };
    
    [alertView show];
}

#pragma mark Quick Method
/**
 *  Quick Method
 */
- (void)btn2Clicked {
    LCAlertView *alertView = [[LCAlertView alloc] initWithTitle:@"LCAlertView" message:@"Quick Method" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"1", @"2", @"3"] clickedButtonAtIndex:^(LCAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
    }];
    
    [alertView show];
}

#pragma mark Text Input
/**
 *  Text Input
 */
- (void)btn3Clicked {
    LCAlertView *alertView = [[LCAlertView alloc] initWithTitle:@"LCAlertView" message:@"Text Input" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    // You should set `shouldEnableFirstOtherButtonBlock` before `- (void)show;`
    // 设置 shouldEnableFirstOtherButtonBlock 一定要放在 `- (void)show;`方法之前
    __weak typeof(alertView) weakAlertView = alertView;
    alertView.shouldEnableFirstOtherButtonBlock = ^(LCAlertView *alertView) {
        BOOL should = [weakAlertView textFieldAtIndex:0].text.length > 0;
        return should;
    };
    
    [alertView show];
}

#pragma mark Text Input (UIAlertView)
/**
 *  Text Input (UIAlertView)
 */
- (void)btn4Clicked {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"Text Input" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertView show];
}

#pragma mark - UIAlertView Delegate

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    return [alertView textFieldAtIndex:0].text.length > 0;
}

@end
