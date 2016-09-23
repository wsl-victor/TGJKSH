//
//  NetWorkTool.h
//  NetSLWorking
//
//  Created by victor on 16/7/29.
//  Copyright © 2016年 victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : NSObject

typedef NS_ENUM(NSInteger, HttpErrorType) {
    HttpErrorTypeNormal=0,//请求正常，无错误
    
    HttpErrorTypeURLConnectionError,//请求时出错，可能是URL不正确
    
    HttpErrorTypeStatusCodeError,//请求时出错，服务器未返回正常的状态码：200
    
    HttpErrorTypeDataNilError,//请求回的Data在解析前就是nil，导致请求无效，无法后续JSON反序列化。
    
    HttpErrorTypeDataSerializationError,//data在JSON反序列化时出错
    
    HttpErrorTypeNoNetWork,//无网络连接
    
    HttpErrorTypeServiceRetrunErrorStatus,//服务器请求成功，但抛出错误
};

typedef NS_ENUM(NSInteger, HttpCacheType) {
    HttpCacheTypeNormal=0,//普通请求不缓存数据
    HttpCacheTypeRequest//请求并使用缓存(有缓存就使用缓存不发起请求)
};

//单位分钟
typedef NS_ENUM(NSInteger, HttpCacheExpiredTimeType) {
    HttpCacheExpiredTimeTypeNormal=0,/**<不设置过期时间*/
    HttpCacheExpiredTimeTypeThirtyMinutes=30,/**<30分钟*/
    HttpCacheExpiredTimeTypeOneDay=1440,/**<一天*/
    HttpCacheExpiredTimeTypeTwoDay=2880/**<两天*/
};

typedef NS_ENUM(NSInteger, HttpRequestType) {
    HttpRequestTypeGet=0,
    
    HttpRequestTypePost
};

typedef void (^successBlock)(id obj);

typedef void (^errorBlock)(HttpErrorType errorType);
typedef void (^failureBlocks)(NSError *error);
typedef void (^clearHttpCacheBlock)();
typedef void (^clearHttpExpiredCacheBlock)();

/**
 *  接口描述
 *
 *  @param cacheType   缓存类型
 *  @param requestType 请求类型
 *  @param expiredType 过期时间
 *  @param url         请求url
 *  @param params      参数
 *  @param success     成功数据
 *  @param failure     失败数据
 */
+ (void)requestHttpWithCacheType:(HttpCacheType)cacheType requestType:(HttpRequestType)requestType expired:(HttpCacheExpiredTimeType)expiredType url:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlocks)failure;


+ (void)clearAllLocalHttpCache:(clearHttpCacheBlock)block;/**<清除所有本地http缓存*/
+ (void)clearAllLocalHttpTimeCache:(clearHttpExpiredCacheBlock)block;/**<清除所有http时间缓存*/

@end
