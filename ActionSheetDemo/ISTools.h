//
//  ISTools.h
//  ActionSheetDemo
//
//  Created by student on 2017/8/28.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISTools : NSObject


/**
 系统风格的 actionsheet
 
 @param title 标题
 @param arr 条目数组，
 @param action 条目的点击事件
 @param cancleAction 取消的点击事件
 */
+ (void)showSystemStyleActionSheet:(NSString *)title
                      contentArray:(NSArray<NSString *> *)arr
                            action:(void(^)(NSInteger row))action
                      cancleAction:(dispatch_block_t)cancleAction;


/**
 微信风格的 actionsheet

 @param title 标题
 @param arr 条目数组，
 @param action 条目的点击事件
 @param cancleAction 取消的点击事件
 */
+ (void)showWeChatStyleActionSheet:(NSString *)title
                      contentArray:(NSArray<NSString *> *)arr
                            action:(void(^)(NSInteger row))action
                      cancleAction:(dispatch_block_t)cancleAction;

@end
