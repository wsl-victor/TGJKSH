//
//  TGFoodViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGFoodViewController.h"
#import "TGFoodDetailViewController.h"
#import "TGFoodViewCell.h"
#import "AllReqestAPIManager.h"
#import <MJRefresh/MJRefresh.h>
@interface TGFoodViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic,weak) UITableView *foodTableView;

@property (nonatomic,strong) NSMutableArray *foodArr;

@property (nonatomic,assign) NSInteger totalAccount;

@property (nonatomic,assign) NSInteger currentPage;
@end

@implementation TGFoodViewController



-(NSMutableArray *)foodArr
{
    if (_foodArr==nil) {
        _foodArr=[NSMutableArray array];
    }
    return _foodArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.dict[@"name"];
    [self createInitView];
    
}


-(void)createInitView
{
    UITableView *foodTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width  , Main_Screen_Height) style:UITableViewStylePlain];
    foodTableView.backgroundColor=[UIColor clearColor];
    foodTableView.rowHeight=AdaptedHeight(100);
    foodTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    foodTableView.dataSource=self;
    foodTableView.delegate=self;
    [self.view addSubview:foodTableView];
    self.foodTableView=foodTableView;
    
    MJRefreshStateHeader *header=[MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(downLoadRefrenshOnClick)];
    
    foodTableView.mj_header=header;
    
    
    MJRefreshAutoNormalFooter  *footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upLoadRefrenshOnClick)];
    foodTableView.mj_footer=footer;
    
   
    [foodTableView.mj_header beginRefreshing];
}

//下啦刷新
-(void)downLoadRefrenshOnClick
{
    self.currentPage=1;
    [self requestNetWorkFoodList:self.dict[@"id"]];
}

//上啦加载更多
-(void)upLoadRefrenshOnClick
{
    [self requestNetWorkFoodList:self.dict[@"id"]];
}


#pragma -mark-  UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGFoodViewCell *cell=[TGFoodViewCell cellWithTableView:tableView];
    NSMutableDictionary *dict=self.foodArr[indexPath.row];
    cell.dict=dict;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGFoodDetailViewController *foodDeatailVc=[[TGFoodDetailViewController alloc] init];
    foodDeatailVc.dict=self.foodArr[indexPath.row];
    [self.navigationController pushViewController:foodDeatailVc animated:YES];
}


#pragma -mark-  网络请求
//totalPage = (totalRecord + maxResult -1) / maxResult;
//食品分类id
-(void)requestNetWorkFoodList:(NSString *)classid
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"id"]=classid;
    dict[@"page"]=[NSString stringWithFormat:@"%ld",self.currentPage];
     dict[@"rows"]=@"10";
    [AllReqestAPIManager getFoodListClass:dict success:^(NSDictionary *json) {
         self.totalAccount=[json[@"total"] integerValue];
        
        if (self.currentPage==1) {
            [self.foodArr removeAllObjects];
            [self.foodTableView.mj_header endRefreshing];
        }
        NSInteger page=(self.totalAccount+10-1)/10;
        if (self.currentPage<page) {
            self.currentPage=self.currentPage+1;
             [self.foodTableView.mj_footer endRefreshing];
        }else{
            [self.foodTableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.foodArr addObjectsFromArray:json[@"tngou"]];
       
        [self.foodTableView reloadData];
    } failure:^(NSError *error) {
        [self.foodTableView.mj_footer endRefreshing];
        [self.foodTableView.mj_header endRefreshing];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
