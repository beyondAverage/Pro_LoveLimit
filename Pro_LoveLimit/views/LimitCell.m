//
//  LimitCell.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "LimitCell.h"

@implementation LimitCell

/*
 @prama index:
 */

- (void)configModel:(LimitModel *)model index:(NSInteger)index
{
    if (index%2 == 0) {
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg1"];
    }else{
        self.bgImageView.image = [UIImage imageNamed:@"cate_list_bg2"];
    }
    //左边的图片
    [self.leftImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    
    //标题(名称)
    self.titleLabel.text = model.name;
    //时间
    NSString *dateStr = [model.expireDatetime substringToIndex:model.expireDatetime.length-2];
    //转化为日期
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [df dateFromString:dateStr];
    
    //计算时间差
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /*
     第一个参数:时间差包含的内容(年,月,日,时,分,秒).
     第二个参数:起始时间
     第三个参数:结束时间
     第四个参数:比较的一些附加参数
     */
    unsigned int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dc = [calendar components:unit fromDate:[NSDate date] toDate:date options:0];
    self.timeLabel.text = [NSString stringWithFormat:@"剩余:%02ld:%02ld:%02ld",[dc hour],[dc minute],[dc second]];
    
    //价格
    self.priceLabel.text = [NSString stringWithFormat:@"¥:%@",model.lastPrice];
    //横线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 30, 1)];
    lineView.alpha = 0.6;
    lineView.backgroundColor = [UIColor blackColor];
    [self.priceLabel addSubview:lineView];
    
    //星级
    [self.myStarView setRating:model.starCurrent.floatValue];
    //类型
    self.typeLabel.text = model.categoryName;
    //分享
    self.shareLabel.text = [NSString stringWithFormat:@"分享:%@",model.shares];
    //收藏
    self.favirateLabel.text = [NSString stringWithFormat:@"收藏:%@",model.favorites];
    //下载
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
