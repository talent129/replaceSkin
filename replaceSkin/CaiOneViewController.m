//
//  CaiOneViewController.m
//  replaceSkin
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CaiOneViewController.h"
#import "CaiSkinTool.h"

@interface CaiOneViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *oneImgView;

@property (weak, nonatomic) IBOutlet UIImageView *twoImgView;

@property (weak, nonatomic) IBOutlet UIImageView *threeImgView;


@end

@implementation CaiOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //此控制器只有展示设置好的皮肤功能
    
    self.oneImgView.image = [CaiSkinTool imageWithImageName:@"car"];
    self.twoImgView.image = [CaiSkinTool imageWithImageName:@"game"];
    self.threeImgView.image = [CaiSkinTool imageWithImageName:@"city"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
