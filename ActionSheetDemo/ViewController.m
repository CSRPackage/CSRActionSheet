//
//  ViewController.m
//  ActionSheetDemo
//
//  Created by student on 2017/8/25.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "ViewController.h"
#import "ISActionSheet.h"
#import "ISTools.h"


@interface ViewController ()

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIView *weChatheadView;
@property (nonatomic, strong) ISActionSheet *actionSheet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)systemButtonClick:(UIButton *)sender {
    
    [ISTools showSystemStyleActionSheet:@"动态详情"
                           contentArray:@[@"百度地图",@"高德地图",@"苹果地图"]
                                 action:^(NSInteger row) {
        
    } cancleAction:^{
        
    }];
}

- (IBAction)systemCustomHeaderButtonClick:(UIButton *)sender {
    ISActionSheet *sheet = [[ISActionSheet alloc] initWithActionStyle:ISActionSheetStyleSystem
                                                            titleView:self.headView
                                                           optionsArr:@[@"百度地图",@"高德地图",@"苹果地图"]
                                                          cancelTitle:@"取消"
                                                        selectedBlock:^(NSInteger row) {
                                                            
                                                        } cancelBlock:nil];
    [sheet showInView:nil];
}

- (IBAction)weChatButtonClick:(UIButton *)sender {
    ISActionSheet *sheet = [[ISActionSheet alloc] initWithActionStyle:ISActionSheetStyleWeChat
                                                                title:@"动态详情"
                                                           optionsArr:@[@"百度地图",@"高德地图",@"苹果地图"]
                                                          cancelTitle:@"取消"
                                                        selectedBlock:^(NSInteger row) {
                                                            
                                                        } cancelBlock:nil];
    [sheet showInView:nil];
}

- (IBAction)weChatCustomButtonClick:(UIButton *)sender {
    _actionSheet = [[ISActionSheet alloc] initWithActionStyle:ISActionSheetStyleWeChat
                                                            titleView:self.weChatheadView
                                                           optionsArr:@[@"从手机选择"]
                                                          cancelTitle:@"取消"
                                                        selectedBlock:^(NSInteger row) {
                                                            
                                                        } cancelBlock:nil];
    [_actionSheet showInView:nil];
    
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 20, 80)];
        _headView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width - 20, 30)];
        titleLabel.text = @"请选择导航";
        titleLabel.font = [UIFont systemFontOfSize:15.0];
        titleLabel.textColor = [UIColor colorWithRed:73/255.0 green:75/255.0 blue:90/255.0 alpha:1];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [_headView addSubview:titleLabel];
        
        UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        descLabel.text = @"记住我的选择，不再提示";
        descLabel.font = [UIFont systemFontOfSize:16];
        descLabel.textAlignment = NSTextAlignmentCenter;
        descLabel.center = CGPointMake(_headView.center.x, 55);
        [_headView addSubview:descLabel];
        
        UIButton *selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        selectedButton.frame = CGRectMake(CGRectGetMinX(descLabel.frame) - 25, 40, 30, 30);
        [selectedButton setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
        [selectedButton setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [selectedButton addTarget:self action:@selector(selectedClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:selectedButton];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 79.5, self.view.bounds.size.width - 20, .5)];
        line.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        [_headView addSubview:line];
    }
    return _headView;
}

- (UIView *)weChatheadView
{
    if (!_weChatheadView) {
        _weChatheadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
        _weChatheadView.backgroundColor = [UIColor whiteColor];
    
        NSDictionary *dic1 = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:18],
                              NSForegroundColorAttributeName:[UIColor blackColor]
                                         };
        NSDictionary *dic2 = @{
                               NSFontAttributeName:[UIFont systemFontOfSize:16],
                               NSForegroundColorAttributeName:[UIColor colorWithRed:73/255.0 green:75/255.0 blue:90/255.0 alpha:1]
                               };
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"拍摄\n" attributes:dic1];
        NSAttributedString *attStr2 = [[NSAttributedString alloc] initWithString:@"照片或视频" attributes:dic2];
        [attStr appendAttributedString:attStr2];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.showsTouchWhenHighlighted = YES;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(buttonHeightClick:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(buttonDragInClick:) forControlEvents:UIControlEventTouchDragInside];
        [btn addTarget:self action:@selector(buttonDragoutSideClick:) forControlEvents:UIControlEventTouchDragOutside];
        [btn setAttributedTitle:attStr forState:UIControlStateNormal];
        btn.titleLabel.numberOfLines = 2;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.frame = _weChatheadView.frame;
        [_weChatheadView addSubview:btn];
    
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 79.5, self.view.bounds.size.width , .5)];
        line.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        [_weChatheadView addSubview:line];
    }
    return _weChatheadView;
}

- (void)selectedClick:(UIButton *)button
{
    button.selected = !button.selected;
}

- (void)buttonClick:(UIButton *)sender
{
    sender.backgroundColor = [UIColor whiteColor];
    [_actionSheet dismiss];
}

- (void)buttonDragInClick:(UIButton *)sender
{
    sender.backgroundColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1];
}

- (void)buttonDragoutSideClick:(UIButton *)sender
{
    sender.backgroundColor = [UIColor whiteColor];
}

- (void)buttonHeightClick:(UIButton *)sender
{
    sender.backgroundColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1];
}

@end
