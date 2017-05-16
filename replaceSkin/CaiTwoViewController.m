//
//  CaiTwoViewController.m
//  replaceSkin
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CaiTwoViewController.h"
#import "CaiSkinTool.h"

@interface CaiTwoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *oneImgView;

@property (weak, nonatomic) IBOutlet UIImageView *twoImgView;

@property (weak, nonatomic) IBOutlet UIImageView *threeImgView;

@end

@implementation CaiTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //不能放在这里 因为有tabbar 生命周期中仅走一次 而它被tabbar强引用 不能释放
//    self.oneImgView.image = [CaiSkinTool imageWithImageName:@"car"];
//    self.twoImgView.image = [CaiSkinTool imageWithImageName:@"game"];
//    self.threeImgView.image = [CaiSkinTool imageWithImageName:@"city"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //视图出现之前 加载皮肤 实时
    self.oneImgView.image = [CaiSkinTool imageWithImageName:@"car"];
    self.twoImgView.image = [CaiSkinTool imageWithImageName:@"game"];
    self.threeImgView.image = [CaiSkinTool imageWithImageName:@"city"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
