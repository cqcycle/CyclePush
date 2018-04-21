//
//  CycleJpush3.h
//  CDSBZX
//
//  Created by dihuijun on 17/2/28.
//  Copyright © 2017年 Cycle. All rights reserved.
//   JPush极光推送3.0版本

#import "AppDelegate.h"
#import "CycleJPushHelp.h"
@interface CycleJpush3 : AppDelegate
/**
 *  初始化SDK
 */
+ (void)CycleJPushWithOptions:(NSDictionary *)launchOptions addDelegate:(id<JPUSHRegisterDelegate>)delegate andAppKey:(NSString *)myappkey andChannel:(NSString *)mychannel andIsProduction:(NSString *)myisProduction;



/**   如果需要本地储存推送的消息   */
//@property (nonatomic, strong) NSMutableArray *pushMessages;

/**   储存 */
+(void)cycleArchivePushMessages:(NSMutableArray *)pushMessages;
/**   取出*/
+ (NSMutableArray *)pushmessages;
@end
