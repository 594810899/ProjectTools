//
//  MapShowViewController.m
//  zpp
//
//  Created by Chuck on 16/5/10.
//  Copyright © 2016年 myncic.com. All rights reserved.
//

#import "MapShowViewController.h"
#import "APPUtils.h"
@interface MapShowViewController ()

@end

@implementation MapShowViewController


- (id)initWithLocation:(double)showLon showLat:(double)showLat label:(NSString*)label{
    self = [super init];
    if (self) {
        
        paoLon = showLon;
        paoLat = showLat;
        oldLon = 50;
        desLocation = label;
        anno_name = @"起点";
    }
    return self;
}

- (id)initWithOrder:(double)old_Lon lastLon:(double)lastLon lastLat:(double)lastLat label:(NSString*)label annoLon:(double)annoLon annoLat:(double)annoLat annoName:(NSString*)annoName;{
    self = [super init];
    if (self) {
        
        paoLon = lastLon;
        paoLat = lastLat;
        oldLon = old_Lon;
        desLocation = label;
        anno_lat = annoLat;
        anno_lon = annoLon;
        anno_name = annoName;
        if(anno_name == nil){
            anno_name = @"";
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MainViewController setPosition:@"MapShowViewController"];
    hasOpened=YES;
    [self initController];

}


-(void)initController{
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshMapShowOrder:)  name:@"refreshMapShowOrder" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MapShowView_back)  name:@"MapShowView_back" object:nil];//后退
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshMapShowView:)  name:@"refreshMapShowView" object:nil];//刷新位置
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    bodyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [bodyView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bodyView];
    
    
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _mapView.delegate = self;
    [bodyView addSubview:_mapView];
    _mapView.alpha = 0;
    _mapView.zoomLevel = 16;//默认缩放
    _mapView.cameraDegree = 40;//摄像机角度
    [_mapView setShowsCompass:NO];//隐藏指南针
    [_mapView setShowsScale:NO];//隐藏比例尺
    [_mapView setShowTraffic:NO];//显示交通
    _mapView.showsBuildings = NO;//是否显示楼块
    _mapView.skyModelEnable = NO;
    _mapView.touchPOIEnabled = NO;
    _mapView.showsIndoorMap = NO;
    _mapView.showsIndoorMapControl=NO;
    
    [_mapView setRotateEnabled:NO];
    
    
    
    
    //返回
    backView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    [backView setFrame:CGRectMake(-10, 25, 60, 35)];
    backView.layer.cornerRadius = 6;
    backView.alpha=0.9;
    [backView.layer setMasksToBounds:YES];
    [bodyView addSubview:backView];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, (backView.frame.size.height-18)/2, 18, 18)];
    [backImageView setImage:[UIImage imageNamed:@"goBack_white.png"]];
    [backView addSubview:backImageView];
    backImageView = nil;
    
    UIControl *backControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, backView.frame.size.width, backView.frame.size.height)];
    [backControl addTarget:self action:@selector(beback) forControlEvents:UIControlEventTouchUpInside];
    [backControl addSubview:backImageView];
    [backView addSubview:backControl];
    backControl = nil;
    
    CGFloat locationYAdd = 0;
    if(desLocation!= nil && desLocation.length>0){
        
        
        UIVisualEffectView *bottomView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        [bottomView setFrame:CGRectMake(0, SCREENHEIGHT-45, SCREENWIDTH, 45)];
        [self.view addSubview:bottomView];
        
        
        UILabel *positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,0, SCREENWIDTH-20, 45)];
        positionLabel.text = desLocation;
       
        positionLabel.textAlignment = NSTextAlignmentLeft;
        positionLabel.numberOfLines = 2;
        positionLabel.textColor = [UIColor whiteColor];
        positionLabel.font = [UIFont fontWithName:textDefaultFont size:12];
        
        [bottomView addSubview:positionLabel];
        
        positionLabel = nil;
        bottomView = nil;
        
        locationYAdd = 35;
    }
    
    
    //定位按钮
    UIView *locationUnder = [[UIView alloc] initWithFrame:CGRectMake(12, SCREENHEIGHT-48-locationYAdd, 26, 26)];
    [locationUnder setBackgroundColor:[UIColor whiteColor]];
    locationUnder.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    locationUnder.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    locationUnder.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    locationUnder.layer.shadowRadius = 3;//阴影半径，默认3
    [self.view addSubview:locationUnder];
    
    
    llControl = [[UIControl alloc] initWithFrame:CGRectMake(10, SCREENHEIGHT-50-locationYAdd, 30, 30)];
    [llControl setBackgroundColor:[UIColor whiteColor]];
    llControl.layer.shouldRasterize = YES;
    llControl.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    [llControl.layer setCornerRadius:4];
    [llControl.layer setMasksToBounds:YES];//圆角不被盖
    
    [self.view addSubview:llControl];
    
    UIImageView *locationImage = [[UIImageView alloc] initWithFrame:CGRectMake((llControl.frame.size.width-llControl.frame.size.width*0.6)/2-1, (llControl.frame.size.height-llControl.frame.size.height*0.6)/2+1, llControl.frame.size.width*0.6, llControl.frame.size.height*0.6)];
    [locationImage setImage:[UIImage imageNamed:@"location_myself.png"]];
    [llControl addSubview:locationImage];
    
    
    
    MyBtnControl *locationControl = [[MyBtnControl alloc] initWithFrame:CGRectMake(0, llControl.frame.origin.y, 50, 50)];
    [self.view addSubview:locationControl];
    locationControl.shareImage = locationImage;
    locationControl.clickBackBlock = ^(){
        [self location_Myself];
    };
    
    
    
    //联系人追踪
    followUnder = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH-26-10, locationUnder.frame.origin.y, locationUnder.frame.size.width, locationUnder.frame.size.height)];
    [followUnder setBackgroundColor:[UIColor whiteColor]];
    followUnder.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    followUnder.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    followUnder.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    followUnder.layer.shadowRadius = 3;//阴影半径，默认3
    [self.view addSubview:followUnder];
 
    
    followView = [[UIControl alloc] initWithFrame:CGRectMake(SCREENWIDTH-30-10, llControl.frame.origin.y, llControl.frame.size.width, llControl.frame.size.height)];
    [followView setBackgroundColor:[UIColor whiteColor]];
    [followView.layer setCornerRadius:4];
    followView.layer.shouldRasterize = YES;
    followView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    [followView.layer setMasksToBounds:YES];//圆角不被盖
    
    [self.view addSubview:followView];
   
    
    UIImageView *followImage = [[UIImageView alloc] initWithFrame:CGRectMake((followView.frame.size.width-followView.frame.size.width*0.6)/2, (followView.frame.size.height-followView.frame.size.height*0.6)/2+1, followView.frame.size.width*0.6, followView.frame.size.height*0.6)];
 
    if(oldLon == 50){
        [followImage setImage:[UIImage imageNamed:@"begin_anno.png"]];
    }else{
        [followImage setImage:[UIImage imageNamed:@"paopao_head.png"]];
    }
   
    
    [followView addSubview:followImage];
    
    __weak typeof(self) weakSelf = self;
    
    followControl = [[MyBtnControl alloc] initWithFrame:CGRectMake(SCREENWIDTH-50,followView.frame.origin.y, 50, 50)];
    followControl.shareImage = followImage;
    followControl.clickBackBlock = ^(){
        [weakSelf jump2contactLocation];
    };
    
    [self.view addSubview:followControl];
    followImage = nil;
 
    
    [self addAnno];
    
    locationImage = nil;
    locationControl = nil;
    locationUnder = nil;
    
    if(oldLon != 50){
        [self refreshLocation];
    }
    
    [UIView animateWithDuration:0.2f delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState) animations:^(void) {
                            _mapView.alpha = 1;
                        }
                     completion:NULL];
    
}


//跳到联系人位置
-(void)jump2contactLocation{
    
    if(annotationLocation!= nil){
        [_mapView removeAnnotation:annotationLocation];
    }
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(paoLat,paoLon) animated:YES];
}


//刷新坐标（跑跑用）
-(void)refreshMapShowOrder:(NSNotification*)notification{
    
    if(hasOpened){
        @try {
            
            NSDictionary *userdic = [notification userInfo];
            anno_name = [userdic objectForKey:@"name"];
            anno_lat = [[userdic objectForKey:@"lat"] doubleValue];
            anno_lon = [[userdic objectForKey:@"lon"] doubleValue];
            
            [self addAnno];
            [self refreshLocation];
            
        } @catch (NSException *exception) {
            
        }
        
        
    }
    
    
}


//添加起终点
-(void)addAnno{
    
    if(annotationBegin != nil){
        [_mapView removeAnnotation:annotationBegin];
    }
    
    if(annotationEnd != nil){
        [_mapView removeAnnotation:annotationEnd];
    }
    
    if(oldLon == 50){//oldLon == 50 消息位置发送的显示
        
        if(oldLon == 50){
            
            CLLocationCoordinate2D coor;
            coor.latitude = paoLat;
            coor.longitude = paoLon;
            annotationBegin = [[MAPointAnnotation alloc] init];
            annotationBegin.coordinate = coor;
            annotationBegin.title = anno_name;
            [_mapView addAnnotation:annotationBegin];
            
            [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(paoLat,paoLon) animated:NO];
            
            [UIView animateWithDuration:0.2f delay:0
                                options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState) animations:^(void) {
                                    _mapView.alpha  = 1;
                                }
                             completion:NULL];
            
            return;
        }
        
        
        //坐标
        if(anno_lon>0 && anno_lat>0 && anno_name.length>0){
            CLLocationCoordinate2D coor;
            coor.latitude = anno_lat;
            coor.longitude = anno_lon;
            annotationEnd = [[MAPointAnnotation alloc] init];
            annotationEnd.coordinate = coor;
            annotationEnd.title = anno_name;
            [_mapView addAnnotation:annotationEnd];
            
            [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(anno_lat,anno_lon) animated:NO];
            [UIView animateWithDuration:0.2f delay:0
                                options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState) animations:^(void) {
                                    _mapView.alpha  = 1;
                                }
                             completion:NULL];
        }
        
    }
}


//刷新位置(跑跑用)
-(void)refreshMapShowView:(NSNotification*)notification{
    
    if(hasOpened){
        @try {
            
            NSDictionary *userdic = [notification userInfo];
            paoLat = [[userdic objectForKey:@"lastLat"] doubleValue];
            paoLon = [[userdic objectForKey:@"lastLon"] doubleValue];
            oldLon = [[userdic objectForKey:@"oldLon"] doubleValue];
            [self refreshLocation];
            userdic = nil;
        } @catch (NSException *exception) {
            
        }
    }
}


//刷新位置(跑跑用)
-(void)refreshLocation{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        //添加跑跑anno
        if(motorAnnotation != nil){
            [_mapView removeAnnotation:motorAnnotation];
            motorAnnotation = nil;
            
        }
        
        
        if(paoLat==0 || paoLon==0){
            if(motorRunningTimer.isValid){
                [motorRunningTimer invalidate];
                motorRunningTimer = nil;
            }
            followUnder.alpha=0;
            followView.alpha=0;
            followControl.alpha=0;
        }else{
            followUnder.alpha=1;
            followView.alpha=1;
            followControl.alpha=1;
            
            if(oldLon==50){
                return;
            }
            
            CLLocationCoordinate2D coor;
            coor.latitude = paoLat;
            coor.longitude = paoLon;
            motorAnnotation = [[MAPointAnnotation alloc] init];
            motorAnnotation.coordinate = coor;
            motorAnnotation.title = @"跑跑";
            
            if(paoLon < oldLon && oldLon!= 0){//往左移动
                direction = 1;
            }else{
                direction = 0;
            }
            
            [_mapView addAnnotation:motorAnnotation];
            
         
            [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(paoLat,paoLon) animated:NO];
                //                [_mapView setZoomLevel:16];
            
            
            
            if(motorRunningTimer.isValid){
                [motorRunningTimer invalidate];
                motorRunningTimer = nil;
            }
            
            motorRunningTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(motorRunning) userInfo:nil repeats:YES];
            
            [UIView animateWithDuration:0.2f delay:0
                                options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState) animations:^(void) {
                                    _mapView.alpha  = 1;
                                }
                             completion:NULL];
        }
        
        
    });
    
}

//(跑跑用)
-(void)motorRunning{
    
    if(motorRunningImageView != nil){
        
        if(motorRunningCounter==0){
            
            if(direction == 1){
                [motorRunningImageView setImage:[UIImage imageNamed:@"left_motor1.png"]];
            }else{
                [motorRunningImageView setImage:[UIImage imageNamed:@"motor1.png"]];
            }
            
            
            motorRunningCounter = 1;
        }else{
            
            if(direction == 1){
                [motorRunningImageView setImage:[UIImage imageNamed:@"left_motor2.png"]];
            }else{
                [motorRunningImageView setImage:[UIImage imageNamed:@"motor2.png"]];
            }
            
            motorRunningCounter = 0;
        }
        
    }
    
}




//-------------------点击定位--------------------------
-(void)location_Myself{
    
    [ShowWaiting showWaiting:@"定位中，请稍后"];
    
    __weak typeof(self) weakSelf = self;
    
    if(locationUtil==nil){
        locationUtil = [[LocationUtils alloc] initLocation];
        locationUtil.callBackBlock = ^(double lat,double lon,NSString*position,NSString *city,BOOL refresh){
            [ShowWaiting hideWaiting];
         
            [weakSelf showLocation:lat lon:lon];
        };
    }
    
    [locationUtil startLocation];
    
    
}


-(void)showLocation:(double)lat lon:(double)lon{
    if(lat == 0 || lon == 0){
        return;
    }
    if(annotationLocation != nil){
        [_mapView removeAnnotation:annotationLocation];
        annotationLocation = nil;
    }
    
    
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(lat,lon) animated:YES];
    
    CLLocationCoordinate2D coor;
    coor.latitude = lat;
    coor.longitude = lon;
    annotationLocation = [[MAPointAnnotation alloc] init];
    annotationLocation.coordinate = coor;
    annotationLocation.title = @"定位";
    [_mapView addAnnotation:annotationLocation];
    
}


//自定义annotation
#pragma mark - MAMapViewDelegate

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        
        static NSString *customReuseIndetifier = @"custom_mapshow_ReuseIndetifier";
        
        MAAnnotationView *annotationView = (MAAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];
        
        
        if ([annotation isKindOfClass:[MANaviAnnotation class]]){//路径规划的中间点不显示
            if (annotationView == nil){
                annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
                annotationView.alpha=0;
            }
            
        }else{
            
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
            [annotationView setFrame:CGRectMake(0, 0, 60, 60)];
            [annotationView setBackgroundColor:[UIColor clearColor]];
            // must set to NO, so we can show the custom callout view.
            
            annotationView.canShowCallout = NO;
            
            UIImageView *annoImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 6, 30, 30)];
            if( [annotation.title isEqualToString:@"起点"]){
                [annoImage setImage:[UIImage imageNamed:@"begin_annotation_full.png"]];
            }else if([annotation.title isEqualToString:@"终点"]){
                [annoImage setImage:[UIImage imageNamed:@"end_annotation_full.png"]];
            }else if([annotation.title isEqualToString:@"定位"]){
                 [annoImage setFrame:CGRectMake(0, 0, 25, 25)];
                [annoImage setImage:[UIImage imageNamed:@"location_self_icon.png"]];
            }else if([annotation.title isEqualToString:@"跑跑"]){
                
                [annoImage setFrame:CGRectMake(14.5, 14.5, 25, 25)];
                
                if(direction == 1){
                    [annoImage setImage:[UIImage imageNamed:@"left_motor1.png"]];
                }else{
                    [annoImage setImage:[UIImage imageNamed:@"motor1.png"]];
                }
                
                motorRunningImageView = annoImage;
                
                paoAnnoTationView = annotationView;
                
                
                
            }else{
                return annotationView;
            }
            
            [annotationView addSubview:annoImage];
            annoImage = nil;
            
            
        }
        
        
        
        return annotationView;
    }
    
    return nil;
}



-(void)beback{
    
    if(motorAnnotation != nil){
        [_mapView removeAnnotation:motorAnnotation];
        motorAnnotation = nil;
    }
    
    if(annotationBegin != nil){
        [_mapView removeAnnotation:annotationBegin];
    }
    
    if(annotationEnd != nil){
        [_mapView removeAnnotation:annotationEnd];
    }

    if(annotationLocation != nil){
        [_mapView removeAnnotation:annotationLocation];
        annotationLocation = nil;
    }
    
    _mapView.delegate = nil;
    _mapView = nil;
    hasOpened = NO;
    
    if(motorRunningTimer.isValid){
        [motorRunningTimer invalidate];
        motorRunningTimer = nil;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(void)MapShowView_back{
    if(hasOpened){
        [self beback];
    }
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc {
    //取消注册广播
    hasOpened = NO;
    _mapView = nil;

    [[NSNotificationCenter  defaultCenter] removeObserver:self  name:@"refreshMapShowOrder" object:nil];
    [[NSNotificationCenter  defaultCenter] removeObserver:self  name:@"MapShowView_back" object:nil];
    [[NSNotificationCenter  defaultCenter] removeObserver:self  name:@"refreshMapShowView" object:nil];

    if(motorRunningTimer.isValid){
        [motorRunningTimer invalidate];
        motorRunningTimer = nil;
    }
}

@end

