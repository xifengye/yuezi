//
//  MeterialListControllerViewController.m
//  yuezi
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "MeterialListController.h"
#import "DishCellView.h"
#import "SettingViewController.h"
@interface MeterialListController ()

@end

@implementation MeterialListController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(didLeftBarItemClicked)];
    
    
}

-(void)didLeftBarItemClicked{
    SettingViewController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"setting"];
    [self.navigationController pushViewController:controller animated:true];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setOneDay:(OneDay *)oneDay{
    if(oneDay){
        self.navigationItem.title = @"今天所需食材";
        self.meterialList = [oneDay todayMeterialList];
    }else{
        self.navigationItem.title = @"28天所需食材";
        self.meterialList = [[Manager instance] meterialList];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.meterialList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CMainCell = @"DishCell";
    
    DishCellView *cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[DishCellView alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier: CMainCell];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    SkuMaterial* skuM = self.meterialList[indexPath.row];
    Meterial* m = [[Manager instance] meterialForKey:[NSNumber numberWithInt:skuM.ID]];
    UIImage* image = [UIImage imageNamed:m.image];
    cell.iconView.image = image;
    cell.nameLabel.text = m.name;
    cell.unitLabel.text = skuM.amount<0.001?@"适量":[NSString stringWithFormat:@"%.1f%@",skuM.amount,m.unit];
    UIFont* font = [UIFont fontWithName:@"Helvetica"  size:(15.0)];
    cell.textLabel.font = font;
    
    return cell;
}
@end
