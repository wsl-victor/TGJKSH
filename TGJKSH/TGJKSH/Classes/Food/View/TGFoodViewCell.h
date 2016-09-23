//
//  TGFoodViewCell.h
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGFoodViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property (nonatomic,strong) NSDictionary *dict;
@end
