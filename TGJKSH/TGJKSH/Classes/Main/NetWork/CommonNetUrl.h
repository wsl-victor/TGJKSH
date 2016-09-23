//
//  CommonNetUrl.h
//  HumanVideo
//
//  Created by victor on 16/7/29.
//  Copyright © 2016年 ipmph. All rights reserved.
//

#ifndef CommonNetUrl_h
#define CommonNetUrl_h

#define HOSTURL @"http://mushi.chinacloudapp.cn"
//===========================================
//===========================================
//(1)首页
#pragma -mark-(1)首页
//===========================================
//===========================================
//获取首页分类列表
#define HomevideoclassName @"/home/list/getClassList"
//分类列表
#define HomeClassListClass @"/argus"
//一级分类主页
#define HomeClassOtherClass @"/list/argus"



//===========================================
//===========================================
//(2)专辑
#pragma -mark-(2)专辑
//===========================================
//===========================================

//专辑列表
#define AlumeUrl  @"/home/list/getAlbumVideoList"



//===========================================
//===========================================
//(3)排行
#pragma -mark-(3)排行
//===========================================
//===========================================
//排行榜
#define RankingClassList @"/home/list/getClassList"
//排行榜视频列表
#define RankingVideoList @"/home/list/getClassListOrderByPlayNum"

//===========================================
//===========================================
//(4)发现
#pragma -mark-(4)发现
//===========================================
//===========================================
#define FINDHomeVideoSearch  @"/home/video/search"



//===========================================
//===========================================
//(5)我
#pragma -mark-(5)我
//===========================================
//===========================================


#pragma -mark- 视频播放
#define  VideoPlayGetVideo  @"/home/video/getVideo"



#pragma -mark-  专辑播放
#define AlbumPlayGetVideoInfo @"/home/albumvideo/getAlbumVideo"

#endif /* CommonNetUrl_h */
