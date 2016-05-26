//
//  ModelBase.h
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelBase : NSObject
@property(nonatomic,assign)NSUInteger ID;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* image;
@property(nonatomic,copy)NSString* desc;
@end
