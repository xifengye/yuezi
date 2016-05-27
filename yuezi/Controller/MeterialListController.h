//
//  MeterialListControllerViewController.h
//  yuezi
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manager.h"

@interface MeterialListController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray* meterialList;
@property(nonatomic,weak)UITableView* tableView;

-(void)setOneDay:(OneDay *)oneDay;
@end
