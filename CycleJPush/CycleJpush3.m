//
//  CycleJpush3.m
//  CDSBZX
//
//  Created by dihuijun on 17/2/28.
//  Copyright © 2017年 Cycle. All rights reserved.
//

#import "CycleJpush3.h"

#define CycleFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"cyclepushmessages.data"]
static NSMutableArray *_pushMessages;
@implementation CycleJpush3
/**
 *  初始化
 */
+ (void)CycleJPushWithOptions:(NSDictionary *)launchOptions addDelegate:(id<JPUSHRegisterDelegate>)delegate andAppKey:(NSString *)myappkey andChannel:(NSString *)mychannel andIsProduction:(NSString *)myisProduction{
    ///接收
    appKey       = myappkey;
    channel      = mychannel;
    isProduction = myisProduction;
    
    // Override point for customization after application launch.
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // 3.0.0及以后版本注册可以这样写，也可以继续用旧的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        //    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //      NSSet<UNNotificationCategory *> *categories;
        //      entity.categories = categories;
        //    }
        //    else {
        //      NSSet<UIUserNotificationCategory *> *categories;
        //      entity.categories = categories;
        //    }
    }
    
    ///注册
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:delegate];
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:[isProduction boolValue]
            advertisingIdentifier:advertisingId];
    
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
            
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
    
}

/**   推送的消息   */
- (NSMutableArray *)pushMessages{
    if(!_pushMessages){
        _pushMessages = [NSMutableArray array];
    }
    return _pushMessages;
}
/**   储存 */
+(void)cycleArchivePushMessages:(NSMutableArray *)pushMessages{
    if (!_pushMessages) {
        _pushMessages = [NSMutableArray array];
    }
    [_pushMessages addObjectsFromArray:pushMessages];
    
    [NSKeyedArchiver archiveRootObject:_pushMessages toFile:CycleFileName];
    
}
/**   取出*/
+ (NSMutableArray *)pushmessages{
 
    return [NSKeyedUnarchiver unarchiveObjectWithFile:CycleFileName];
}
@end
