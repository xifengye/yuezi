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
    UIFont* font = [UIFont fontWithName:@"Helvetica-Bold"  size:(25.0)];
    
    self.nameLabel.frame = CGRectMake(0, 0, self.frame.size.width*0.4, CellHeight*period.dishes.count);
    self.nameLabel.text = period.name;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = font;
    self.nameLabel.textColor = [UIColor whiteColor];
    switch (period.type) {
        case PeriodTypeBreakfast:
            self.nameLabel.backgroundColor = [UIColor orangeColor];
            break;
        case PeriodTypeBreakfastAfter:
            self.nameLabel.backgroundColor = [UIColor redColor];
            break;
        case PeriodTypeLunch:
            self.nameLabel.backgroundColor = [UIColor orangeColor];
            break;
        case PeriodTypeLunchAfter:
            self.nameLabel.backgroundColor = [UIColor redColor];
            break;
        case PeriodTypeSupper:
            self.nameLabel.backgroundColor = [UIColor orangeColor];
            break;
        case PeriodTypeSupperAfter:
            self.nameLabel.backgroundColor = [UIColor redColor];
            break;
         default:
            break;
    }
    self.tableView.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), 0, self.frame.size.width*0.6, self.nameLabel.frame.size.height);
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: CMainCell];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    Dish* dish = _period.dishes[indexPath.row];
    cell.textLabel.text = dish.name;
    UIFont* font = [UIFont fontWithName:@"Helvetica"  size:(15.0)];
    cell.textLabel.font = font;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Dish* dish = _period.dishes[indexPath.row];
    if([self.delegate respondsToSelector:@selector(didSelectedDish:)]){
        [self.delegate didSelectedDish:dish];
    }
    
}

@end
