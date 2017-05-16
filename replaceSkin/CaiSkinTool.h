//
//  CaiSkinTool.h
//  replaceSkin
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CaiSkinTool : NSObject

/*
 返回对应的皮肤对象
 */
+ (UIImage *)imageWithImageName:(NSString *)imageName;

//保存皮肤信息
+ (void)saveSkinName:(NSString *)skinName;

//返回标识符所标识的颜色
+ (UIColor *)colorWithName:(NSString *)name;

@end
