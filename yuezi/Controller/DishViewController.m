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
#import "DishCellView.h"


@interface DishViewController (){
    NSTimeInterval timeInterval;
    NSTimer* timer;
}

@end




@implementation DishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(didLeftBarItemClicked)];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //some initialize code here...
    timeInterval = [[NSUserDefaults standardUserDefaults] doubleForKey:[NSString stringWithFormat:@"%ld_cooking_time",_dish.ID]];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.backBarButtonItem = barItem;
    self.navigationItem.title = self.dish.name;
    [self initSubView];
    if(timeInterval>0){
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateCookTime) userInfo:nil repeats:YES];
        [timer fire];
    }

}

-(void)updateCookTime{
    long interval = [NSDate date].timeIntervalSince1970 - timeInterval;
    int minute = (long)interval/60;
    int second = (long)interval%60;
    NSString* time = [NSString stringWithFormat:@"%d分 %d秒",minute,second];
    [self.btnCooking setTitle:[NSString stringWithFormat:@"已煮 %@",time] forState:UIControlStateNormal];
}

-(void)didLeftBarItemClicked{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)beginCook{
    NSString* key = [NSString stringWithFormat:@"%ld_cooking_time",_dish.ID];
    if(timer){
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
        [self.btnCooking setTitle:@"开始煮" forState:UIControlStateNormal];
        [timer invalidate];
        timer = nil;
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateCookTime) userInfo:nil repeats:YES];
        timeInterval = [NSDate date].timeIntervalSince1970;
        [[NSUserDefaults standardUserDefaults]setDouble:timeInterval forKey:key];
        [timer fire];
    }
    
}

-(void)dealloc{
    if(timer){
        [timer invalidate];
        timer = nil;
    }
}

-(void)initSubView{
    
    UIButton* cookingBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    [cookingBtn setBackgroundColor:[UIColor redColor]];
    [cookingBtn setTitle:@"开始煮" forState:UIControlStateNormal];
    cookingBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [cookingBtn addTarget:self action:@selector(beginCook) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cookingBtn];
    self.btnCooking = cookingBtn;
    
    UIScrollView* scView = [[UIScrollView alloc]init];
    [self.view addSubview:scView];
    scView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-cookingBtn.frame.size.height);
    scView.backgroundColor = [UIColor whiteColor];
    CGFloat margin = 10;
    UIFont* font = [UIFont systemFontOfSize:15];
    NSString* descStr = [NSString stringWithFormat:@"%@\n\n食材",self.dish.desc];
   CGSize descSize =  [descStr sizeWithFont:font constrainedToSize:CGSizeMake(self.view.frame.size.width-margin*2, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    UILabel* descLabe = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin, descSize.width, descSize.height)];
    descLabe.textColor = [UIColor blackColor];
    descLabe.font = font;
    descLabe.text = descStr;
    descLabe.numberOfLines = 0;
    [scView addSubview:descLabe];
    
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(descLabe.frame)+margin, self.view.frame.size.width-margin*2, cellHeight*self.dish.materialList.count)];
    [scView addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorInset = UIEdgeInsetsMake(15, 0, 15, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    NSString* cmStr = [NSString stringWithFormat:@"\n步骤\n%@",self.dish.cookMethod];
    CGSize cmSize =  [cmStr sizeWithFont:font constrainedToSize:CGSizeMake(self.view.frame.size.width-margin*2, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    UILabel* cmLabe = [[UILabel alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(tableView.frame)+margin, self.view.frame.size.width-margin*2, cmSize.height)];
    cmLabe.text = cmStr;
    cmLabe.numberOfLines = 0;
    cmLabe.font = font;
    cmLabe.textColor = [UIColor blackColor];
    [scView addSubview:cmLabe];
    
    scView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(cmLabe.frame)+margin);

    self.scView =scView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dish.materialList.count;
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
    SkuMaterial* skuM = self.dish.materialList[indexPath.row];
    Meterial* m = [[Manager instance] meterialForKey:[NSNumber numberWithInt:skuM.ID]];
    UIImage* image = [UIImage imageNamed:m.image];
    cell.iconView.image = image;
    cell.nameLabel.text = m.name;
    cell.unitLabel.text = skuM.amount<0.001?@"适量":[NSString stringWithFormat:@"%.1f%@",skuM.amount,m.unit];
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
