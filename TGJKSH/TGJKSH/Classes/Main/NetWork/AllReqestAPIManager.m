//
//  AllReqestAPIManager.m
//  HumanVideo
//
//  Created by victor on 16/7/29.
//  Copyright © 2016年 ipmph. All rights reserved.
//

#import "AllReqestAPIManager.h"
#import "NetWorkTool.h"

#define FoodClssify @"http://www.tngou.net/api/food/classify"
#define FoodList    @"http://www.tngou.net/api/food/list"
#define FoodDetail @"http://www.tngou.net/api/food/show"
#define FoodName    @"http://www.tngou.net/api/food/name"


#define MenuClssify @"http://www.tngou.net/api/cook/classify"
#define MenuList    @"http://www.tngou.net/api/cook/list"
#define MenuDetail @"http://www.tngou.net/api/cook/show"
#define MenuName    @"hthttp://www.tngou.net/api/cook/name"



#define BookClasses @"http://www.tngou.net/api/book/classify" //分类
#define BookList @"http://www.tngou.net/api/book/list"  //列表
#define BookDetail @"http://www.tngou.net/api/book/show" //详情



@implementation AllReqestAPIManager


+(void)getFoodClssifyClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:FoodClssify params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

+(void)getFoodListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:FoodList params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)getFoodDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:FoodDetail params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)getFoodNameClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:FoodName params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}








//================================================================================
//================================================================================
//================================================================================

+(void)getMenuClssifyClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:MenuClssify params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


+(void)getMenuListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:MenuList params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)getMenuDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:MenuDetail params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)getMenuNameClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:MenuName params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}









+(void)getBookClassesClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeNormal requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:BookClasses params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


+(void)getBookListClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeRequest requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:BookList params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


+(void)getBookDetailClass:(NSMutableDictionary *)dict success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    [NetWorkTool requestHttpWithCacheType:HttpCacheTypeRequest requestType:HttpRequestTypeGet expired:HttpCacheExpiredTimeTypeNormal url:BookDetail params:dict success:^(id obj) {
        if (success) {
            success((NSDictionary *)obj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
