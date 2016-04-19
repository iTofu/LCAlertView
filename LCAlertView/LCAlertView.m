//
//  LCAlertView.m
//  LCAlertViewDemo
//
//  Created by Leo on 16/4/19.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//

#import "LCAlertView.h"

@interface LCAlertView () <UIAlertViewDelegate>

@end

@implementation LCAlertView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    if (self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil]) {
        self.delegate = self;
        
        NSMutableArray *argsArray = [[NSMutableArray alloc] init];
        va_list params; // 定义一个指向个数可变的参数列表指针
        va_start(params,otherButtonTitles); // va_start 得到第一个可变参数地址
        id arg;
        if (otherButtonTitles) {
            // 将第一个参数添加到array
            id prev = otherButtonTitles;
            [argsArray addObject:prev];
            // va_arg 指向下一个参数地址
            // 这里是问题的所在 网上的例子，没有保存第一个参数地址，后边循环，指针将不会在指向第一个参数
            while ((arg = va_arg(params,id))){
                if (arg){
                    [argsArray addObject:arg];
                    [self addButtonWithTitle:arg];
                }
            }
            // 置空
            va_end(params);
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles clickedButtonAtIndex:(ClickedButtonAtIndexBlock)clickedButtonAtIndexBlock {
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
        self.clickedButtonAtIndexBlock = clickedButtonAtIndexBlock;
        for (NSString *btnTitle in otherButtonTitles) {
            [self addButtonWithTitle:btnTitle];
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles didDismissWithButtonIndex:(DidDismissWithButtonIndexBlock)didDismissWithButtonIndexBlock {
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
        self.didDismissWithButtonIndexBlock = didDismissWithButtonIndexBlock;
        for (NSString *btnTitle in otherButtonTitles) {
            [self addButtonWithTitle:btnTitle];
        }
    }
    return self;
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.clickedButtonAtIndexBlock) {
        self.clickedButtonAtIndexBlock((LCAlertView *)alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.cancelBlock) {
        self.cancelBlock((LCAlertView *)alertView);
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
    if (self.willPresentAlertViewBlock) {
        self.willPresentAlertViewBlock((LCAlertView *)alertView);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    if (self.didPresentAlertViewBlock) {
        self.didPresentAlertViewBlock((LCAlertView *)alertView);
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.willDismissWithButtonIndexBlock) {
        self.willDismissWithButtonIndexBlock((LCAlertView *)alertView, buttonIndex);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.didDismissWithButtonIndexBlock) {
        self.didDismissWithButtonIndexBlock((LCAlertView *)alertView, buttonIndex);
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    if (self.shouldEnableFirstOtherButtonBlock) {
        return self.shouldEnableFirstOtherButtonBlock((LCAlertView *)alertView);
    }
    return YES;
}

@end
