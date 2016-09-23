//
//  NetWorkStates.h
//  NetSLWorking
//
//  Created by victor on 16/7/29.
//  Copyright © 2016年 victor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface NetWorkStates : NSObject
+(NetworkStatus)getNetWorkStatus;

/**
 *  是否是wifi环境
 *
 *  @return YES是/NO不是
 */
+(BOOL)isWifiEnable;

/**
 *  是否有网络连接
 *
 *  @return YES有/NO没有
 */
+(BOOL)isFi;

/**
 *  开启网络指示器
 */
+(void)startNetworkActivity;

/**
 *  关闭网络指示器
 */
+(void)stopNetworkActivity;
@end
