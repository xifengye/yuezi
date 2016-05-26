//
//  Manager.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "Manager.h"
#import "MJExtension.h"
#import "Meterial.h"
#import "SkuMaterial.h"
#import "Dish.h"
#import "OneDay.h"
#import "Breakfast.h"
#import "BreakfastAfter.h"
#import "Lunch.h"
#import "LunchAfter.h"
#import "Supper.h"
#import "SupperAfter.h"


@implementation Manager
-(instancetype)init{
    self  = [super init];
    if(self){
        NSString *meterialPath = [[NSBundle mainBundle] pathForResource:@"meterial" ofType:@"plist"];
        NSArray *mArray = [[NSArray alloc] initWithContentsOfFile:meterialPath];
        NSArray* meterialArray = [Meterial objectArrayWithKeyValuesArray:mArray];
        NSMutableDictionary* mDict = [NSMutableDictionary dictionary];
        for(Meterial* m in meterialArray){
            [mDict setObject:m forKey:[NSNumber numberWithInt:m.ID]];
        }
        self.meterialDict = mDict;
        
        NSString *dishPath = [[NSBundle mainBundle] pathForResource:@"dish" ofType:@"plist"];
        NSArray *dArray = [[NSArray alloc] initWithContentsOfFile:dishPath];
        NSArray* dishArray = [Dish objectArrayWithKeyValuesArray:dArray];
        NSMutableDictionary* dDict = [NSMutableDictionary dictionary];
        for(Dish* d in dishArray){
            [dDict setObject:d forKey:[NSNumber numberWithInt:d.ID]];
        }
        
        self.dishDict = dDict;
        
    }
    return self;
}


+(id)instance {
    
    static Manager*sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedMyManager = [[self alloc] init];
        
    });
    
    return sharedMyManager;
}


-(OneDay*)getOneDay:(int)position{
    OneDay* oneDay = [[OneDay alloc]init];
    oneDay.dayIndex = position;
    Period* breakfast = nil;
    Period* breakfastAfter= nil;
    Period* lunch= nil;
    Period* lunchAfter= nil;
    Period* supper= nil;
    Period* supperAfter= nil;
    switch (position+1) {
        case 1:
            
            breakfast = [[Breakfast alloc]initWithPeriodIds:@[@41,@2,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@3,@8,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@7,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@15,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            break;
        case 2:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@4,@9,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@6,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@13,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            break;
        case 3:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@10,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@3,@10,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@7,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@12,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            break;
        case 4:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@18,@8,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@6,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@17,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            break;
        case 5:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@11,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@21,@11,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@7,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@14,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 6:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@19,@9,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@6,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@46,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            break;
        case 7:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@2,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@20,@8,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@7,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@16,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
            
            
        case 8:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@22,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@30,@8,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@15,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 9:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@23,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@27,@9,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@13,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 10:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@26,@10,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@29,@10,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@12,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 11:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@22,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@19,@8,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@17,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 12:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@25,@11,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@21,@11,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@14,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 13:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@24,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@23,@9,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@46,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            break;
        case 14:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@41,@22,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@41,@20,@8,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@28,@5]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@41,@16,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
            
            
            
            
        case 15:
        case 22:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@30,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@15,@8,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            break;
        case 16:
        case 23:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@38,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@13,@9,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            break;
        case 17:
        case 24:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@10,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@37,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@12,@10,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 18:
        case 25:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@31,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@17,@8,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            break;
        case 19:
        case 26:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@11,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@36,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@14,@11,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        case 20:
        case 27:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@9,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@6,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@34,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@46,@9,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            break;
        case 21:
        case 28:
            breakfast = [[ Breakfast alloc]initWithPeriodIds:@[@33,@8,@7,@42]];
            breakfastAfter = [[ BreakfastAfter alloc]initWithPeriodIds:@[@7,@45]];
            
            lunch = [[ Lunch alloc]initWithPeriodIds:@[@35,@28,@32,@42]];
            lunchAfter = [[ LunchAfter alloc]initWithPeriodIds:@[@40,@47]];
            
            supper = [[ Supper alloc]initWithPeriodIds:@[@16,@8,@32,@42]];
            supperAfter = [[ SupperAfter alloc]initWithPeriodIds:@[@6,@45]];
            break;
        default:
            break;
    }
    oneDay.periods = [NSArray arrayWithObjects:breakfast,breakfastAfter,lunch,lunchAfter,supper,supperAfter, nil];
    return oneDay;
}


-(id)meterialForKey:(NSNumber *)key{
    return _meterialDict[key];
}

@end
