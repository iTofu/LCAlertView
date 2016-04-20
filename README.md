# LCAlertView

[![Travis](https://img.shields.io/travis/iTofu/LCAlertView.svg?style=flat)](https://travis-ci.org/iTofu/LCAlertView)
[![CocoaPods](https://img.shields.io/cocoapods/v/LCAlertView-ObjC.svg)](http://cocoadocs.org/docsets/LCAlertView-ObjC)
[![CocoaPods](https://img.shields.io/cocoapods/l/LCAlertView-ObjC.svg)](https://raw.githubusercontent.com/iTofu/LCAlertView/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LCAlertView-ObjC.svg)](http://cocoadocs.org/docsets/LCAlertView-ObjC)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)

🍭 Using UIAlertView with Block!

![LCAlertView](https://raw.githubusercontent.com/iTofu/LCAlertView/master/LCAlertView01.PNG)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````

Welcome to **[My Blog](http://LeoDev.me)**: http://LeoDev.me ✨

[**中文介绍**](https://github.com/iTofu/LCAlertView/blob/master/README-zh_CN.md)



## Introduction

Now you could using UIAlertView with Block!

Fascinating? Yeah! So, just star this project now! ⭐️



## Installation

LCAlertView is available on [CocoaPods](https://cocoapods.org/). Just add the following to your project Podfile:

````ruby
pod "LCAlertView-ObjC"  # Podfile
````



## Non-CocoaPods Installation

Just drag the LCAlertView folder into your project.



## Usage

* Use by including the following import:

  ````objc
  #import "LCAlertView.h"
  ````

* Demo code:

  ````objc
  // 1. Class method
  LCAlertView *alertView = [LCAlertView title:@"LCAlertView" message:@"Quick Method" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"1", @"2"] clickedButtonAtIndex:^(LCAlertView *alertView, NSInteger buttonIndex) {
      NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
  }];

  // 2. Instance method
  LCAlertView *alertView = [[LCAlertView alloc] initWithTitle:@"LCAlertView" message:@"Quick Method" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"1", @"2", @"3"] clickedButtonAtIndex:^(LCAlertView *alertView, NSInteger buttonIndex) {
      NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
  }];

  // show alertView
  [alertView show];
  ````

* You could also using properties:

  ````objc
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
  ````



## Example

![LCAlertView](https://raw.githubusercontent.com/iTofu/LCAlertView/master/LCAlertView02.PNG)
---
![LCAlertView](https://raw.githubusercontent.com/iTofu/LCAlertView/master/LCAlertView03.PNG)
---
![LCAlertView](https://raw.githubusercontent.com/iTofu/LCAlertView/master/LCAlertView04.PNG)



## Release

### V 1.0.1

* Add some quick class methods.


### V 1.0.0

* Initial Commit! First Release! Wonderful Start!



## Support

* If you have any question, just [commit a issue](https://github.com/LeoGod/LCAlertView/issues/new)! Thx!

* Mail: devtip@163.com

* Blog: http://LeoDev.me



### License

[MIT License](http://opensource.org/licenses/MIT)
