//
//  Dish.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Dish.h"
#import "MJExtension.h"
#import "Manager.h"
#import "SkuMaterial.h"

@implementation Dish
-(void)setMaterialList:(id)ml{
    if([ml isKindOfClass:[NSDictionary class]]){
        _materialList = [NSArray arrayWithObject:[SkuMaterial objectWithKeyValues:ml]];
    }else if([ml isKindOfClass:[NSArray class]]){
        _materialList = [SkuMaterial objectArrayWithKeyValuesArray:ml];
    }
}
@end
