//
//  TGTabBarViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGTabBarViewController.h"
#import "TGNavigationViewController.h"

#import "TGHomeViewController.h"
#import "TGMenuViewController.h"
#import "TGFoodViewController.h"
#import "TGNewsViewController.h"
#import "TGMeViewController.h"
#import "PBSMainTabBar.h"
#import "TGFoodClassController.h"
#import "TGMenuClassViewController.h"

@interface TGTabBarViewController ()<PBSMainTabBarDelegate , UITabBarControllerDelegate>


@property (nonatomic, weak) TGHomeViewController  *homeVc;
@property (nonatomic, weak) TGMenuClassViewController  *menuVc;

@property (nonatomic, weak) TGFoodClassController *foodVc;

@property (nonatomic, weak) TGNewsViewController *newsVc;

@property (nonatomic, weak) TGMeViewController *meVc;

@property (nonatomic, weak) UIViewController *lastSelectedViewContoller;



@end

@implementation TGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
    // 创建自定义tabbar
    //  [self addCustomTabBar];
}


#pragma -mark-  UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
{
    UIViewController *vc = [viewController.viewControllers firstObject];
    if ([vc isKindOfClass:[TGHomeViewController class]]) {
        if (self.lastSelectedViewContoller == vc) {
            //可以进行刷新操作
        } else {
            //可以进行刷新操作
        }
    }
    
    self.lastSelectedViewContoller = vc;
}


/**
 *  创建自定义tabbar
 */
- (void)addCustomTabBar
{
    // 创建自定义tabbar
    PBSMainTabBar  *customTabBar = [[PBSMainTabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    TGHomeViewController *homeVc = [[TGHomeViewController alloc] init];
    [self addOneChlildVc:homeVc title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.homeVc = homeVc;
    self.lastSelectedViewContoller = homeVc;
    
    TGMenuClassViewController  *menuVc = [[TGMenuClassViewController alloc] init];
    [self addOneChlildVc:menuVc title:@"菜单" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.menuVc = menuVc;
    
    
    TGFoodClassController *foodVc = [[TGFoodClassController alloc] init];
    [self addOneChlildVc:foodVc title:@"食物" imageName:@"tabbar_discover_selected" selectedImageName:@"tabbar_discover_selected"];
    self.foodVc = foodVc;
    
    TGNewsViewController *newsVc = [[TGNewsViewController alloc] init];
    [self addOneChlildVc:newsVc title:@"百科" imageName:@"tabbar_discover_selected" selectedImageName:@"tabbar_discover_selected"];
    self.newsVc = newsVc;
    
    
    
    TGMeViewController *meVc = [[TGMeViewController alloc] init];
    [self addOneChlildVc:meVc title:@"我" imageName:@"tabbar_discover_selected" selectedImageName:@"tabbar_discover_selected"];
    self.meVc = meVc;
    
    
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
     TGNavigationViewController   *nav = [[TGNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}



#pragma mark - PBSMainTabBarDelegate
- (void)tabBarDidClickedPlusButton:(PBSMainTabBar *)tabBar
{
    // 弹出发微博控制器
    TGNewsViewController *discoverVc = [[TGNewsViewController alloc] init];
    TGNavigationViewController *nav = [[TGNavigationViewController alloc] initWithRootViewController:discoverVc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
