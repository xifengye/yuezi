//
//  OneDay.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "OneDay.h"
#import "Manager.h"


@implementation OneDay

-(NSString *)description{
    return [NSString stringWithFormat:@"第%d天",self.dayIndex+1];
}


-(NSArray *)todayMeterialList{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    for(Period* p in self.periods){
        for(Dish* d in p.dishes){
            for(SkuMaterial* sm in d.materialList){
                NSNumber* key =[NSNumber numberWithInt:sm.ID];
                Meterial* m = [Manager instance].meterialDict[key];
                if(m){
                    if([[dict allKeys] containsObject:key]){
                        NSNumber* value = dict[key];
                        NSNumber* newValue = [NSNumber numberWithFloat:value.floatValue+sm.amount];
                        dict[key] = newValue;
                    }else{
                        NSNumber* newValue = [NSNumber numberWithFloat:sm.amount];
                        [dict setObject:newValue forKey:key];
                    }
                }
            }
        }
    }
    NSMutableArray* result = [NSMutableArray array];
    for(NSNumber* key in dict.allKeys){
        SkuMaterial* sm = [[SkuMaterial alloc]init];
        sm.ID = key.intValue;
        sm.amount = ((NSNumber*)dict[key]).floatValue;
        [result addObject:sm];
    }
    return result;
}

@end
