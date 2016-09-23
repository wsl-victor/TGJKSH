//
//  AllReqestAPIManager.h
//  HumanVideo
//
//  Created by victor on 16/7/29.
//  Copyright © 2016年 ipmph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllReqestAPIManager : NSObject


/**
 *  //食品分类列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getFoodClssifyClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //食品列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getFoodListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //食品详情列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getFoodDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //食品名称
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getFoodNameClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;


//===================================================================
//菜单
//===================================================================
/**
 *  //菜单分类列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getMenuClssifyClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //菜单列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getMenuListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  // 菜单详情列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getMenuDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //菜单名称
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getMenuNameClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;





//书籍


/**
 *  //书籍分类
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getBookClassesClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //书籍列表
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getBookListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;

/**
 *  //书籍详情
 *
 *  @param dict
 *  @param success
 *  @param failure
 */
+(void)getBookDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *json))success failure:(void (^)(NSError *error))failure;


@end
