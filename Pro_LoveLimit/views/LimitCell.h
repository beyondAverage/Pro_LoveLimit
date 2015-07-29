//
//  LimitCell.h
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "LimitModel.h"
#import "UIImageView+WebCache.h"

@interface LimitCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet StarView *myStarView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (weak, nonatomic) IBOutlet UILabel *favirateLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

//显示数据
- (void)configModel:(LimitModel *)model index:(NSInteger)index;


@end
