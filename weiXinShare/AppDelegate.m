//
//  AppDelegate.m
//  weiXinShare
//
//  Created by SHICHUAN on 2016/12/12.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "AppDelegate.h"




@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //向微信注册
    [WXApi registerApp:@"wxcae9d8c2e3ffb18f"];
    
   

    return YES;
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
   return [WXApi handleOpenURL:url delegate:self];
}

@end
