//
//  DishCellView.h
//  yuezi
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"

#define cellHeight  70

@interface DishCellView : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
+(instancetype) cellWithTableView:(UITableView*)tableView;
@property(nonatomic,weak)UIImageView* iconView;
@property(nonatomic,weak)UILabel* nameLabel;
@property(nonatomic,weak)UILabel* unitLabel;
@property(nonatomic,strong)Dish* dish;

@end
