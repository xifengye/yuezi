//
//  Dish.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "ModelBase.h"
#import "SkuMaterial.h"

@interface Dish : ModelBase
@property(nonatomic,copy)NSString* cookMethod;
@property(nonatomic,strong)NSArray* materialList;
@end
