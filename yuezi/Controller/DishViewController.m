//
//  DishViewController.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "DishViewController.h"
#import "Meterial.h"
#import "SKuMaterial.h"
#import "Manager.h"


@interface DishViewController ()

@end

@implementation DishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(didLeftBarItemClicked)];
    self.navigationItem.title = self.dish.name;
    [self initSubView];
}

-(void)didLeftBarItemClicked{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)initSubView{
    
    UIButton* cookingBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 30)];
    [cookingBtn setBackgroundColor:[UIColor orangeColor]];
    [cookingBtn setTitle:@"开始煮" forState:UIControlStateNormal];
    [self.view addSubview:cookingBtn];
    UIScrollView* scView = [[UIScrollView alloc]init];
    [self.view addSubview:scView];
    scView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-30);
    
    UIButton* bgView = [[UIButton alloc]initWithFrame:scView.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [scView addSubview:bgView];
    CGFloat margin = 10;
    UIFont* font = [UIFont systemFontOfSize:13];
    NSString* descStr = [NSString stringWithFormat:@"%@\n\n食材",self.dish.desc];
   CGSize descSize =  [descStr sizeWithFont:font constrainedToSize:CGSizeMake(self.view.frame.size.width-margin*2, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    UILabel* descLabe = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin, descSize.width, descSize.height)];
    descLabe.textColor = [UIColor grayColor];
    descLabe.font = font;
    descLabe.text = descStr;
    descLabe.numberOfLines = 0;
    [scView addSubview:descLabe];
    CGFloat cellHeight = 35;
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(descLabe.frame)+margin, self.view.frame.size.width-margin*2, cellHeight*self.dish.materialList.count)];
    [scView addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    NSString* cmStr = [NSString stringWithFormat:@"\n步骤\n%@",self.dish.cookMethod];
    CGSize cmSize =  [cmStr sizeWithFont:font constrainedToSize:CGSizeMake(self.view.frame.size.width-margin*2, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    UILabel* cmLabe = [[UILabel alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(tableView.frame)+margin, self.view.frame.size.width-margin*2, cmSize.height)];
    cmLabe.text = cmStr;
    cmLabe.numberOfLines = 0;
    cmLabe.font = font;
    cmLabe.textColor = [UIColor grayColor];
    [scView addSubview:cmLabe];
    
    scView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(cmLabe.frame)+margin);
    self.scView =scView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dish.materialList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CMainCell = @"DishCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: CMainCell];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    SkuMaterial* skuM = self.dish.materialList[indexPath.row];
    Meterial* m = [[Manager instance] meterialForKey:[NSNumber numberWithInt:skuM.ID]];
    cell.imageView.image = [UIImage imageNamed:m.image];
    cell.textLabel.text = m.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%fX%@",skuM.amount,m.unit];
    UIFont* font = [UIFont fontWithName:@"Helvetica"  size:(15.0)];
    cell.textLabel.font = font;
    
    return cell;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGRect rect = self.navigationController.navigationBar.frame;
    float y = rect.size.height + rect.origin.y;
    self.scView.contentInset = UIEdgeInsetsMake(y, 0, 0, 0);
}


@end
