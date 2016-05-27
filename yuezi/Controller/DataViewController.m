//
//  DataViewController.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "DataViewController.h"
#import "DishViewController.h"
#import "MeterialListController.h"


@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:tableView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = [self.oneDay description];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"今天食材" style:UIBarButtonItemStyleDone target:self action:@selector(didLeftBarItemClicked)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"28天食材" style:UIBarButtonItemStyleDone target:self action:@selector(didRightBarItemClicked)];
    
}

-(void)didLeftBarItemClicked{
    MeterialListController* controller = [[MeterialListController alloc]init];
    controller.oneDay = self.oneDay;
    [self.navigationController pushViewController:controller animated:true];

}

-(void)didRightBarItemClicked{
    MeterialListController* controller = [[MeterialListController alloc]init];
    controller.oneDay = nil;
    [self.navigationController pushViewController:controller animated:true];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellView* cell = [CellView cellWithTableView:tableView];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.period = self.oneDay.periods[indexPath.row];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.oneDay.periods.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Period* p = self.oneDay.periods[indexPath.row];
    return CellHeight*p.dishes.count;
}

-(void)didSelectedDish:(Dish *)dish{
    DishViewController* controller = [[DishViewController alloc]init];
    controller.dish = dish;
    [self.navigationController pushViewController:controller animated:true];
}

@end
