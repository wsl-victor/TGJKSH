//
//  TGBookListViewCell.m
//  TGJKSH
//
//  Created by victor on 16/9/22.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "TGBookListViewCell.h"
#import <UIImageView+WebCache.h>


@interface TGBookListViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bookListIv;

@property (weak, nonatomic) IBOutlet UILabel *bookListTitle;

@property (weak, nonatomic) IBOutlet UILabel *bookListAuthor;
@property (weak, nonatomic) IBOutlet UILabel *bookListTime;

@property (weak, nonatomic) IBOutlet UILabel *bookListDes;

@end

@implementation TGBookListViewCell


//+ (instancetype)cellWithTableView:(UITableView *)tableView
//{
//    static NSString *ID = @"TGBookListViewCell";
//    TGBookListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"TGBookListViewCell" owner:nil options:nil][0];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//    }
//    
//    return cell;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.bounds = [UIScreen mainScreen].bounds;
    
    
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self.bookListIv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",dict[@"img"]]] placeholderImage:[UIImage imageNamed:@"dd"]];
    
    [self.bookListTitle setText:dict[@"name"]];
    [self.bookListAuthor setText:[NSString stringWithFormat:@"作者：%@",dict[@"author"]]];
    
    
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[dict[@"time"] floatValue]/1000];
      //实例化一个NSDateFormatter对象
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:s"];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];

    [self.bookListTime setText:[NSString stringWithFormat:@"日期：%@",currentDateStr]];
    
    
    [self.bookListDes setText:[NSString stringWithFormat:@"%@",dict[@"summary"]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
