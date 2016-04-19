//
//  LCAlertView.h
//  LCAlertViewDemo
//
//  Created by Leo on 16/4/19.
//  Copyright © 2016年 http://LeoDev.me. All rights reserved.
//
//  Mail: mailto:devtip@163.com
//  Blog: http://LeoDev.me
//
//  V 1.0.0


#import <UIKit/UIKit.h>

@class LCAlertView;


#pragma mark - Block

typedef void (^ClickedButtonAtIndexBlock)(LCAlertView *alertView, NSInteger buttonIndex);
typedef void (^CancelBlock)(LCAlertView *alertView);
typedef void (^WillPresentAlertViewBlock)(LCAlertView *alertView);
typedef void (^DidPresentAlertViewBlock)(LCAlertView *alertView);
typedef void (^WillDismissWithButtonIndexBlock)(LCAlertView *alertView, NSInteger buttonIndex);
typedef void (^DidDismissWithButtonIndexBlock)(LCAlertView *alertView, NSInteger buttonIndex);
typedef BOOL (^ShouldEnableFirstOtherButtonBlock)(LCAlertView *alertView);


@interface LCAlertView : UIAlertView


#pragma mark - Block Properties

@property (nonatomic, copy) ClickedButtonAtIndexBlock         clickedButtonAtIndexBlock;
@property (nonatomic, copy) CancelBlock                       cancelBlock;
@property (nonatomic, copy) WillPresentAlertViewBlock         willPresentAlertViewBlock;
@property (nonatomic, copy) DidPresentAlertViewBlock          didPresentAlertViewBlock;
@property (nonatomic, copy) WillDismissWithButtonIndexBlock   willDismissWithButtonIndexBlock;
@property (nonatomic, copy) DidDismissWithButtonIndexBlock    didDismissWithButtonIndexBlock;
@property (nonatomic, copy) ShouldEnableFirstOtherButtonBlock shouldEnableFirstOtherButtonBlock;


#pragma mark - Quick Methods

/**
 *  Initialize an alert view
 *
 *  @param title                     title
 *  @param message                   message
 *  @param cancelButtonTitle         cancelButtonTitle
 *  @param otherButtonTitles         otherButtonTitles
 *  @param clickedButtonAtIndexBlock clickedButtonAtIndexBlock
 *
 *  @return alert view
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
         clickedButtonAtIndex:(ClickedButtonAtIndexBlock)clickedButtonAtIndexBlock;

/**
 *  Initialize an alert view
 *
 *  @param title                     title
 *  @param message                   message
 *  @param cancelButtonTitle         cancelButtonTitle
 *  @param otherButtonTitles         otherButtonTitles
 *  @param didDismissWithButtonIndexBlock didDismissWithButtonIndexBlock
 *
 *  @return alert view
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
    didDismissWithButtonIndex:(DidDismissWithButtonIndexBlock)didDismissWithButtonIndexBlock;

@end
