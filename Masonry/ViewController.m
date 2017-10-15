//
//  ViewController.m
//  Masonry
//
//  Created by 爱尚家 on 2017/8/30.
//  Copyright © 2017年 爱尚家. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic, strong) MASConstraint *left;      //左侧
@property (nonatomic, strong) MASConstraint *top;       //上侧
@property (nonatomic, strong) MASConstraint *right;     //右侧
@property (nonatomic, strong) MASConstraint *bottom;    //下侧
@property (nonatomic, strong) MASConstraint *leading;   //首部
@property (nonatomic, strong) MASConstraint *trailing;  //尾部
@property (nonatomic, strong) MASConstraint *width;    //宽
@property (nonatomic, strong) MASConstraint *height;   //高
@property (nonatomic, strong) MASConstraint *centerX;  //横向居中
@property (nonatomic, strong) MASConstraint *centerY;  //纵向居中
@property (nonatomic, strong) MASConstraint *baseline; //文本基线

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //防止block循环引用
    __weak typeof (self)weakSelf = self;
    //头像
    UIButton *iconBtn = [[UIButton alloc] init];
    iconBtn.backgroundColor = [UIColor redColor];
    iconBtn.layer.cornerRadius = 45;
    [self.view addSubview:iconBtn];
    [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90)); //宽和高
        make.centerX.equalTo(weakSelf.view); //居中
        make.top.width.offset(90);//上边距
    }];
    
    
    //上传社区头像和文字提醒
    UILabel *iconLab = [[UILabel alloc] init];
    iconLab.backgroundColor = [UIColor blueColor];
    iconLab.text = @"上传社团头像";
    [self.view addSubview:iconLab];
    [iconLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(iconBtn);
        make.top.equalTo(iconBtn.mas_bottom).with.offset(20);
    }];
    
    
    //社团编辑图标
    UIImageView *editIcon = [[UIImageView alloc] init];
    editIcon.backgroundColor = [UIColor grayColor];
    [self.view addSubview:editIcon];
    [editIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(iconLab.mas_bottom).with.offset(30);
    }];
    
    
    //社团名
    UITextField *nameText = [[UITextField alloc] init];
    nameText.placeholder = @"请填写社区名称(最多6个字)";
    nameText.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:nameText];
    [nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.centerY.equalTo(editIcon);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(editIcon.mas_right).with.offset(10);
        
    }];
    
    
    //分割线
    UIView *xian = [[UIView alloc] init];
    xian.backgroundColor = [UIColor grayColor];
    [self.view addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(editIcon.mas_bottom).with.offset(5);
    }];
    
    
    //选择标签
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.text = @"选择标签";
    tagLabel.backgroundColor = [UIColor greenColor];
    tagLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:tagLabel];
    [tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(xian).with.offset(30);
    }];
    
    
    //跳转标签选择
    UITextField *tagText = [[UITextField alloc] init];
    tagText.placeholder = @"测撒";
    tagText.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tagText];
    [tagText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tagLabel);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(tagLabel.mas_right).with.offset(5);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
