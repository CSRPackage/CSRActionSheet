//
//  ISTools.m
//  ActionSheetDemo
//
//  Created by student on 2017/8/28.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "ISTools.h"
#import "ISActionSheet.h"

@implementation ISTools

+ (void)showSystemStyleActionSheet:(NSString *)title
                      contentArray:(NSArray<NSString *> *)arr
                            action:(void(^)(NSInteger row))action
                      cancleAction:(dispatch_block_t)cancleAction
{
    ISActionSheet *sheet = [[ISActionSheet alloc] initWithActionStyle:ISActionSheetStyleSystem
                                                                title:title
                                                           optionsArr:arr
                                                          cancelTitle:@"取消"
                                                        selectedBlock:action
                                                          cancelBlock:cancleAction];
    [sheet showInView:nil];
}

+ (void)showWeChatStyleActionSheet:(NSString *)title
                      contentArray:(NSArray<NSString *> *)arr
                            action:(void(^)(NSInteger row))action
                      cancleAction:(dispatch_block_t)cancleAction
{
    ISActionSheet *sheet = [[ISActionSheet alloc] initWithActionStyle:ISActionSheetStyleWeChat
                                                                title:title
                                                           optionsArr:arr
                                                          cancelTitle:@"取消"
                                                        selectedBlock:action
                                                          cancelBlock:cancleAction];
    [sheet showInView:nil];
}

                                                                                                     

@end
