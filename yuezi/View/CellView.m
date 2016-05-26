//
//  CellView.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "CellView.h"
#import "Dish.h"

@implementation CellView

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString* ID = @"HomeCell";
    CellView *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell = [[CellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
    UILabel* label = [[UILabel alloc]init];
    self.nameLabel = label;
    [self addSubview:label];
    
    UITableView* tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self addSubview:tableView];
    
    
}

-(void)setPeriod:(Period *)period{
    _period = period;
    
    self.nameLabel.frame = CGRectMake(0, 0, self.frame.size.width*0.25, CellHeight*period.dishes.count);
    self.nameLabel.text = period.name;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.tableView.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), 0, self.frame.size.width*0.75, self.nameLabel.frame.size.height);
    [self.tableView reloadData];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.period){
        return _period.dishes.count;
    }else{
        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CMainCell = @"DishCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: CMainCell];
    }
    
    Dish* dish = _period.dishes[indexPath.row];
    cell.textLabel.text = dish.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Dish* dish = _period.dishes[indexPath.row];
    
}

@end
