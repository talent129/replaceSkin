//
//  CaiSkinTool.m
//  replaceSkin
//
//  Created by mac on 17/5/16.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "CaiSkinTool.h"

static NSString *_skinName;

//#1.static 可变字典
static NSMutableDictionary *_colorDic;

@implementation CaiSkinTool

/*
 保证代码只加载一次
 1.多线程: -->dispatchOnce
 2.只调用一次的方法: load方法  initialize方法
 */

//只要头文件参与了编译 就会调用此方法
+ (void)load
{
    NSLog(@"%s", __func__);
}

//类的实例创建时 才会调用
+ (void)initialize
{
    NSLog(@"%s", __func__);
    
    //读取配置信息  -->访问磁盘 耗性能，只需要加载一次即可
    _skinName = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinName"];
    
    if (_skinName == nil) {
        _skinName = @"blue";
    }
    
    //#2.可变字典初始化
    _colorDic = [NSMutableDictionary dictionary];
    
    //#3.加载颜色plist
    [self loadColor];
}

/*
 返回对应的皮肤对象
 */
+ (UIImage *)imageWithImageName:(NSString *)imageName
{
    //注意: 若图片文件未放在.xcassets中，若图片后缀不是png， 则应带上后缀 否则不识别
    //拼接文件路径
    NSString *imageStr = [NSString stringWithFormat:@"skin/%@/%@.jpg", _skinName, imageName];
    
    return [UIImage imageNamed:imageStr];
}

+ (void)saveSkinName:(NSString *)skinName
{
    //当皮肤读取改变一次之后，我们做皮肤切换保存操作 原来的_skinName
    
    //更改皮肤
    _skinName = skinName;
    
    //当设置了不同皮肤时 还需要将皮肤plist颜色信息进行重新加载
    [self loadColor];
    
    //保存皮肤
    [[NSUserDefaults standardUserDefaults] setObject:skinName forKey:@"skinName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UIColor *)colorWithName:(NSString *)name
{
    return _colorDic[name];
}

//初始化时 需要调用一次 来加载字典及转换颜色
+ (void)loadColor
{
    //获取plist列表
    //颜色转换 (255,0,0,1-->UIColor)
    //plist只需要加载一次
    //将转换后的UIColor保存
    
    //获取plist路径
    NSString *pathStr = [NSString stringWithFormat:@"skin/%@/SkinColors.plist", _skinName];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:pathStr ofType:nil];
    
    //获取字典
    NSDictionary *colorDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //直接获取所有的颜色值 将其转换成UIColor对象
    [colorDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        //截取字符串
        NSArray *colorArray = [obj componentsSeparatedByString:@","];
        
        //创建颜色 赋值给缓存字典
        CGFloat r = [colorArray[0] doubleValue];
        CGFloat g = [colorArray[1] doubleValue];
        CGFloat b = [colorArray[2] doubleValue];
        CGFloat a = [[colorArray lastObject] doubleValue];
        
        NSLog(@"colorDic: %@", colorDic);
        
        //字典里存的是转换好的UIColor对象 当设置切换皮肤后 需要重新调用此方法 进行_colorDic的更新
        _colorDic[key] = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
    }];
}

@end
