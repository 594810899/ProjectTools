//
//  WebViewController.h
//  MedicalCenter
//
//  Created by 李狗蛋 on 15-3-9.
//  Copyright (c) 2015年 李狗蛋. All rights reserved. 文档文件简易浏览器
//

#import <UIKit/UIKit.h>

@interface FileChecker : UIViewController<UIWebViewDelegate>{

    UIWebView *myWebView;
    NSString *original_url;
    NSString *webTitle;
    
    UIActivityIndicatorView *juhua;
}

-(id)initWithtitle:(NSString*)title url:(NSString*)url;

//本地查看文件 （非web）
+(void)viewFileInLocal:(NSString*)path filename:(NSString*)filename tail:(NSString*)tail;



@end


