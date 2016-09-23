//
//  TGBookListViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/22.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGBookListViewController.h"
#import "TGBookListViewCell.h"
#import "AllReqestAPIManager.h"
#import <MJRefresh/MJRefresh.h>
#import "UITableView+FDTemplateLayoutCell.h"
#import "TGBookDetailViewController.h"

#import "E_ScrollViewController.h"
@interface TGBookListViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic,weak) UITableView *bookTableView;

@property (nonatomic,strong) NSMutableArray *bookListArr;

@property (nonatomic,assign) NSInteger totalAccount;

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation TGBookListViewController

-(NSMutableArray *)bookListArr
{
    if (_bookListArr==nil) {
        _bookListArr=[NSMutableArray array];
    }
    return _bookListArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.bookDict[@"name"];
    [self createInitView];
    
}


-(void)createInitView
{
    UITableView *bookTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width  , Main_Screen_Height) style:UITableViewStylePlain];
    bookTableView.backgroundColor=[UIColor clearColor];
    //bookTableView.rowHeight=AdaptedHeight(120);
    bookTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    bookTableView.dataSource=self;
    bookTableView.delegate=self;
    [self.view addSubview:bookTableView];
    self.bookTableView=bookTableView;
    
    [bookTableView registerNib:[UINib nibWithNibName:@"TGBookListViewCell" bundle:nil]  forCellReuseIdentifier:@"TGBookListViewCell"];
    
    MJRefreshStateHeader *header=[MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(downLoadRefrenshOnClick)];
    
    bookTableView.mj_header=header;
    
    
    MJRefreshAutoNormalFooter  *footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upLoadRefrenshOnClick)];
    bookTableView.mj_footer=footer;
    
    
    [bookTableView.mj_header beginRefreshing];
}

//下啦刷新
-(void)downLoadRefrenshOnClick
{
    self.currentPage=1;
    [self requestNetWorkFoodList:self.bookDict[@"id"]];
}

//上啦加载更多
-(void)upLoadRefrenshOnClick
{
    [self requestNetWorkFoodList:self.bookDict[@"id"]];
}


#pragma -mark-  UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bookListArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGBookListViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TGBookListViewCell"];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableDictionary *dict=self.bookListArr[indexPath.row];
    cell.dict=dict;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"TGBookListViewCell" configuration:^(TGBookListViewCell *cell) {
        cell.fd_enforceFrameLayout = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dict=self.bookListArr[indexPath.row];
    } ];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGBookDetailViewController  *bookDeatailVc=[[TGBookDetailViewController alloc] init];
    
    bookDeatailVc.detailDict =self.bookListArr[indexPath.row];
    
    [self.navigationController pushViewController:bookDeatailVc animated:YES];
}


#pragma -mark-  网络请求
//totalPage = (totalRecord + maxResult -1) / maxResult;
-(void)requestNetWorkFoodList:(NSString *)classid
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"id"]=classid;
    dict[@"page"]=[NSString stringWithFormat:@"%ld",self.currentPage];
    dict[@"rows"]=@"10";
    [AllReqestAPIManager getBookListClass:dict success:^(NSDictionary *json) {
        self.totalAccount=[json[@"total"] integerValue];
        
        if (self.currentPage==1) {
            [self.bookListArr removeAllObjects];
            [self.bookTableView.mj_header endRefreshing];
        }
        NSInteger page=(self.totalAccount+10-1)/10;
        if (self.currentPage<page) {
            self.currentPage=self.currentPage+1;
            [self.bookTableView.mj_footer endRefreshing];
        }else{
            [self.bookTableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.bookListArr addObjectsFromArray:json[@"list"]];
        
        [self.bookTableView reloadData];
    } failure:^(NSError *error) {
        [self.bookTableView.mj_footer endRefreshing];
        [self.bookTableView.mj_header endRefreshing];
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
