//
//  DataViewController.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneDay.h"
#import "CellView.h"

@interface DataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CellViewDelegate>

@property (strong, nonatomic)  OneDay* oneDay;
@property(nonatomic,weak)UITableView* tableView;

@end

