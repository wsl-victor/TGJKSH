//
//  TGMenuClassViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/18.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGMenuClassViewController.h"
#import "TGMenuViewController.h"
#import "FoodClassCollectionViewCell.h"

#import "AllReqestAPIManager.h"
static NSString * const FoodClassCollectionView = @"FoodClassCollectionViewCell";

@interface TGMenuClassViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,strong) NSMutableArray *classListArr;

@end

@implementation TGMenuClassViewController


-(NSMutableArray *)classListArr
{
    if (_classListArr==nil) {
        _classListArr=[NSMutableArray array];
    }
    return _classListArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    [self requestNetWorkFoodClssify];
}

-(void)createCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width /4, [UIScreen mainScreen].bounds.size.width /4);
    flowLayout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0.0;
    flowLayout.minimumLineSpacing      = 0.0;
    //    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    //    flowLayout.itemSize=CGSizeMake(Main_Screen_Width/3.2,Main_Screen_Width/3.1)
    UICollectionView *collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Main_Screen_Height ) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    self.collectionView=collectionView;
    
    [collectionView registerNib:[UINib nibWithNibName:@"FoodClassCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:FoodClassCollectionView];
    
    
}



#pragma mark - UIcollectionView 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.classListArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FoodClassCollectionViewCell *itemTypeCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:FoodClassCollectionView forIndexPath:indexPath];
    itemTypeCollectionCell.dict=self.classListArr[indexPath.row];
    return itemTypeCollectionCell;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TGMenuViewController *menuVc=[[TGMenuViewController alloc] init];
    menuVc.dict=self.classListArr[indexPath.row];
    [self.navigationController pushViewController:menuVc animated:YES];
    
}

#pragma -mark- 网络请求
//食品分类id
-(void)requestNetWorkFoodClssify
{
    // NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    //dict[@"id"]=@"0";
    [AllReqestAPIManager getMenuClssifyClass:nil success:^(NSDictionary *json) {
        
        NSArray *tngouArr= json[@"tngou"];
        [self.classListArr addObjectsFromArray:tngouArr];
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
    } ];
}



@end
