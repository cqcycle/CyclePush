//
//  CycleJPushHelp.h
//  CDSBZX
//
//  Created by dihuijun on 17/2/28.
//  Copyright © 2017年 Cycle. All rights reserved.
//

#ifndef CycleJPushHelp_h
#define CycleJPushHelp_h

#ifdef __OBJC__
/**屏幕宽度和高度*/
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
//代码块self的弱应用
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


#import "JPUSHService.h"
#import "CycleJpush3.h"

#import <AdSupport/AdSupport.h>


#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
//appkey1
static NSString const *appKey = @"";
static NSString const *channel = @"App Store";
static NSString const *isProduction = 0;
//static BOOL const *isProduction = FALSE;



#endif

#endif /* CycleJPushHelp_h */
