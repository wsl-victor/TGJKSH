//
//  FoodClassCollectionViewCell.m
//  TGJKSH
//
//  Created by victor on 16/9/18.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "FoodClassCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface FoodClassCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIV;
@property (weak, nonatomic) IBOutlet UILabel *labelLA;

@end

@implementation FoodClassCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    
    self.labelLA.text=dict[@"name"];
}

@end
