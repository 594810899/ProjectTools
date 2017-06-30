//
//  UserUtils.h
//  MedicalCenter
//
//  Created by 李狗蛋 on 15-4-1.
//  Copyright (c) 2015年 李狗蛋. All rights reserved.
// 朋友圈点赞类

#import <Foundation/Foundation.h>



@interface NewsDZEntity : NSObject

@property (copy, nonatomic) NSString *dz_id;
@property (copy, nonatomic) NSString *dz_uid; //dz用户id;

@property (copy, nonatomic) NSString *newsNickName;

@property (copy, nonatomic) NSString *avatar;
@property (assign, nonatomic) NSInteger dateline;
@property (copy, nonatomic) NSString *namecolor; 
@property (copy, nonatomic) NSString *showDate;
@property (assign, nonatomic) NSInteger isVip; 

@end