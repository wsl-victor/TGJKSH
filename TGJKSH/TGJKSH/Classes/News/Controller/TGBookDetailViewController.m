//
//  TGBookDetailViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/22.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGBookDetailViewController.h"
#import "AllReqestAPIManager.h"


@interface TGBookDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webViewDetail;

@property (nonatomic,strong ) NSMutableArray *detailListArr;
@end

@implementation TGBookDetailViewController
-(NSMutableArray *)detailListArr
{
    if (_detailListArr==nil) {
        _detailListArr=[NSMutableArray array];
    }
    return _detailListArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self requestNetWorkScrollWeb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
-(void)requestNetWorkScrollWeb
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    
    dict[@"id"]=self.detailDict[@"id"];
    
    [AllReqestAPIManager getBookDetailClass:dict success:^(NSDictionary *json) {
        NSLog(@"==%@=",json);
//        self.navigationItem.title=json[@"name"];
//        NSArray *tngouArr= json[@"list"];
//        [self.detailListArr addObjectsFromArray:[[tngouArr reverseObjectEnumerator] allObjects]];
//        
//        NSString *strHtml=@"";
//        for (int i=0; i<self.detailListArr.count; i++) {
//            NSDictionary *dict=self.detailListArr[i];
//            strHtml=[NSString stringWithFormat:@"%@%@%@",strHtml,dict[@"title"],dict[@"message"]];
//        }
//        [self.webViewDetail loadHTMLString:strHtml baseURL:nil];
        
        
    } failure:^(NSError *error) {
        
        
        
    } ];
}

@end
