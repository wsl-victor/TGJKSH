//
//  TGFoodViewCell.m
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGFoodViewCell.h"
#import <UIImageView+WebCache.h>

@interface TGFoodViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodKeys;

@property (weak, nonatomic) IBOutlet UILabel *foodDes;
@end

@implementation TGFoodViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"TGFoodViewCell";
    TGFoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TGFoodViewCell" owner:nil options:nil][0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
  //  http://tnfs.tngou.net/image
   
    [self.foodImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",dict[@"img"]]] placeholderImage:[UIImage imageNamed:@"dd"]];
    [self.foodName setText:dict[@"name"]];
    [self.foodKeys setText:[NSString stringWithFormat:@"关键词：%@",dict[@"keywords"]]];
    [self.foodDes setText:[NSString stringWithFormat:@"简介：%@",dict[@"description"]]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
