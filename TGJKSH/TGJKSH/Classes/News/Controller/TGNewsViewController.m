//
//  TGNewsViewController.m
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGNewsViewController.h"
#import "TGBookClassesController.h"
@interface TGNewsViewController ()

@end

@implementation TGNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    for (int i=0; i<3; i++) {
        UIButton *bt=[[UIButton alloc] initWithFrame:CGRectMake((Main_Screen_Width/2)*(i%2), 64+(i/2)*60, Main_Screen_Width/2, 60)];
        bt.layer.borderWidth=0.5;
        bt.layer.borderColor=[UIColor whiteColor].CGColor;
        bt.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (i==0) {
            [bt setTitle:@"书籍" forState:UIControlStateNormal];
        }else if (i==1){
            [bt setTitle:@"新闻" forState:UIControlStateNormal];
        }else{
            [bt setTitle:@"热点" forState:UIControlStateNormal];
        }
        bt.tag=i;
        [bt addTarget:self action:@selector(onNextOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }
}

-(void)onNextOnClick:(UIButton *)bt
{
    if (bt.tag==0) {
        TGBookClassesController *booksViewVc=[[TGBookClassesController alloc] init];
        
        [self.navigationController pushViewController:booksViewVc animated:YES];
    }else if (bt.tag==1){
    
    }else{
        
    }
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
