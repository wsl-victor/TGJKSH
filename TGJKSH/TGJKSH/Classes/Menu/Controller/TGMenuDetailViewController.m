//
//  TGMenuDetailViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/18.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGMenuDetailViewController.h"
#import "AllReqestAPIManager.h"

@interface TGMenuDetailViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic,weak) UIWebView *webView;

@property (nonatomic,strong) NSMutableDictionary *foodDetailDict;



@end

@implementation TGMenuDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.dict[@"name"];
    [self createInitView];
    [self requestNetWork:self.dict[@"id"]];
}

-(void)createInitView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    // webView.scalesPageToFit=YES;
    [self.view addSubview:webView];
    webView.delegate = self;
    webView.scrollView.delegate=self;
    self.webView = webView;
}



-(void)setShowDetailContent:(NSMutableDictionary *)cdetail
{
    NSMutableString *HtmlString=[NSMutableString string];
    
    NSString *iamgePath=[NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",cdetail[@"img"]];
    NSString *strImage=[NSString stringWithFormat:@" <p style=\"color: rgb(54, 54, 54); font-size: 16px; line-height: 1.6em; word-wrap: break-word;\"><img data-original='%@' /></p> ",iamgePath];
    
    
       NSString *strkeywords=[NSString stringWithFormat:@ " <p style=\"color: rgb(54, 54, 54); font-size: 16px; line-height: 1.6em; word-wrap: break-word;\">关键词: %@</p> ",cdetail[@"keywords"]];
    
    
    NSString *strIv=[NSString stringWithFormat:@" <p style=\"color: rgb(54, 54, 54); font-size: 16px; line-height: 1.6em; word-wrap: break-word;\">%@</p> ",cdetail[@"message"]];
    
    [HtmlString appendString:strImage];
    [HtmlString appendString:strkeywords];
    
    [HtmlString appendString:strIv];
    
    
    //获取temp文件的路径
    NSString *tempPath = [[NSBundle mainBundle]pathForResource:@"temp" ofType:@"html"];
    
    //加载temp内容为字符串
    NSString *tempHtml = [NSString stringWithContentsOfFile:tempPath encoding:NSUTF8StringEncoding error:nil];
    
    //替换temp内的占位符{{Content_holder}}为需要加载的HTML代码
    tempHtml = [tempHtml stringByReplacingOccurrencesOfString:@"{{Content_holder}}" withString:HtmlString];
    
    //Temp目录下的js文件在根路径，因此需要在加载HTMLString时指定根路径
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    //加载HTMLString
    [self.webView loadHTMLString:tempHtml baseURL:baseURL];
    
}



-(void)requestNetWork:(NSString *)foodID
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"id"]=foodID;
    [AllReqestAPIManager getMenuDetailClass:dict success:^(NSDictionary *json) {
        self.foodDetailDict=(NSMutableDictionary *)json;
        [self setShowDetailContent:self.foodDetailDict];
    } failure:^(NSError *error) {
        
    }];
}



#pragma -mark- 

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma -mark-  

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"==%@=",NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
