//
//  ReduceCell.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/29.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "ReduceCell.h"
#import "UIImageView+WebCache.h"

@implementation ReduceCell



- (void)configModel:(LimitModel *)model index:(NSInteger)index
{
    //背景图片
    if (!(index % 2) ) {
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg1"];
    }else{
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg2"];
    }
    
    //图片
    [self.leftImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    //标题
    self.titleLabel.text = model.name;
    self.currentPriceLabel.text = [NSString stringWithFormat:@"当前价格¥:%@",model.currentPrice];
    
    NSString *lastPrice = [NSString stringWithFormat:@"¥:%@",model.lastPrice];
    //NSStrikethroughStyleAttributeName 表示在文字上加横线
    //@1 == [NSNumber numberWithInt:1]
    //表示横线的高度为1
    NSDictionary *dict = @{NSStrikethroughStyleAttributeName:@1};
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:lastPrice attributes:dict];
    self.lastPriceLabel.attributedText = string;
    //星级
    [self.myStarView setRating:model.starCurrent.floatValue];
    //分享
    self.shareLabel.text = [NSString stringWithFormat:@"分享:%@",model.shares];
    self.favoriteLabel.text = [NSString stringWithFormat:@"收藏:%@",model.favorites];
    self.typeLabel.text = model.categoryName;
    self.downloadLabel.text = [NSString stringWithFormat:@"下载:%@",model.downloads];
}














- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
