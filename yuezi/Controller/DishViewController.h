//
//  DishViewController.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Dish.h"

@interface DishViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)Dish* dish;
@property(nonatomic,weak)UILabel* descLabel;
@property(nonatomic,weak)UITableView* tableView;
@property(nonatomic,weak)UILabel* cookMethodLabel;
@property(nonatomic,weak)UIButton* btnCooking;
@property(nonatomic,weak)UIScrollView* scView;
@end
