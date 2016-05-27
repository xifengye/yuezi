//
//  DishCellView.m
//  yuezi
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "DishCellView.h"

@implementation DishCellView

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString* ID = @"HomeCell";
    DishCellView *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell = [[DishCellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        //添加内部的子控件
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    CGFloat margin = 7;
    UIImageView* imageView = [[UIImageView alloc]init];
    self.iconView = imageView;
    [self addSubview:imageView];
    imageView.frame = CGRectMake(margin, margin, cellHeight-margin*2, cellHeight-margin*2);

    UILabel* label = [[UILabel alloc]init];
    self.nameLabel = label;
    [self addSubview:label];
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(imageView.frame)+margin, 0, (self.frame.size.width-cellHeight-margin*2)/2, cellHeight);
    
    UILabel* unitLabel = [[UILabel alloc]init];
    self.unitLabel = unitLabel;
    [self addSubview:unitLabel];
    self.unitLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), 0, (self.frame.size.width-cellHeight-margin*2)/2, cellHeight);
    
    
}

-(void)setDish:(Dish *)dish{
    _dish = dish;
    
}

@end
