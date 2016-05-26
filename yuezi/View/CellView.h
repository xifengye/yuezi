//
//  CellView.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Period.h"

#define CellHeight  30

@interface CellView : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
+(instancetype) cellWithTableView:(UITableView*)tableView;
@property(nonatomic,strong)Period* period;
@property(nonatomic,weak)UITableView* tableView;
@property(nonatomic,weak)UILabel* nameLabel;
@end
