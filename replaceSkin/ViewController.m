//
//  ViewController.m
//  replaceSkin
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 cai. All rights reserved.
//

/*
 换资源的配置:
            若文件有重名 打包时 会出现资源丢失
            资源(图片)引入时 应为蓝色文件夹 绝对路径
 */

/*
 抽取父类:对于界面内容多变的情况不太适用
 工具类:对于界面内容多变的情况非常适用
 */

#import "ViewController.h"
#import "CaiSkinTool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *oneImgView;

@property (weak, nonatomic) IBOutlet UIImageView *twoImgView;

@property (weak, nonatomic) IBOutlet UIImageView *threeImgView;


@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self changeSkin];
    
}

- (IBAction)oneBtnAction:(id)sender {
    
    //1.先保存配置信息
    [CaiSkinTool saveSkinName:@"white"];
    
    //切换皮肤
    [self changeSkin];
}


- (IBAction)twoBtnAction:(id)sender {
    
    [CaiSkinTool saveSkinName:@"orange"];
    
    [self changeSkin];
    
}


- (IBAction)threeBtnAction:(id)sender {
    
    [CaiSkinTool saveSkinName:@"blue"];
    
    [self changeSkin];
    
}

- (IBAction)fourBtnAction:(id)sender {
    
    [CaiSkinTool saveSkinName:@"green"];
    
    [self changeSkin];
}

//公用方法--冗余度
- (void)changeSkin//WithSkinName:(NSString *)skinName
{
    //切换图像
    self.oneImgView.image = [CaiSkinTool imageWithImageName:@"car"];
    self.twoImgView.image = [CaiSkinTool imageWithImageName:@"game"];
    self.threeImgView.image = [CaiSkinTool imageWithImageName:@"city"];
    
    //切换文字颜色 根据标识符 改变字体颜色 这里仅一种
    //增加plist文件 记录对应的标识符及字体颜色
    self.testLabel.textColor = [CaiSkinTool colorWithName:@"labelTextDayColor"];
    
    //切换背景颜色
    self.testLabel.backgroundColor = [CaiSkinTool colorWithName:@"labelBackgroundDayColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
