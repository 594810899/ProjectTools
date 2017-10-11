

#import "APPUtils.h"

#define PhoneRegularExpression  @"\\d{3}-\\d{8}|\\d{3}-\\d{7}|\\d{4}-\\d{8}|\\d{4}-\\d{7}|1+[3578]+\\d{9}|\\d{8}|\\d{7}" //电话号码正则

@implementation APPUtils

+ (NSString *)getMethod{
    if(method == nil){
        method = @"";
    }
    return  method;
}


+ (void)setMethod:(NSString*)m{
    method = m;
}

//打开设置
+(void)intoSetting{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

///iphone 型号
+ (NSString *)getCurrentDeviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7 ";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7plus ";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}


//获取iphone 屏幕版本
+(NSString *)getIphoneVersion{
    NSString *version= @"iphone6";
    float height = [UIScreen mainScreen].bounds.size.height;
    
    if(height == 480){
        version = @"iphone4";
    }else if(height == 568){
        version = @"iphone5";
    }else if(height == 667){
        version = @"iphone6";
    }else if(height == 736){
        version = @"iphone7";
    }
    
    //iphone7 means plus
    return version;
    
}


//获取启动页尺寸
+(NSString*)getLoadingImageName:(NSInteger)num{
    
    NSString *nowVersion = [self getIphoneVersion];
    NSString *loading;
    if([nowVersion isEqualToString:@"iphone4"]){
        loading = [NSString stringWithFormat:@"ip4_%d",(int)num];
    }else if([nowVersion isEqualToString:@"iphone5"]){
        loading = [NSString stringWithFormat:@"ip5_%d",(int)num];
    }else if([nowVersion isEqualToString:@"iphone6"]){
        loading = [NSString stringWithFormat:@"ip6_%d",(int)num];
    }else{
        loading = [NSString stringWithFormat:@"ip7_%d",(int)num];
    }
    return loading;
}


//是否在审核时间
+(BOOL)reviewOk{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    infoDictionary = nil;
    
    NSString *versionString = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    
  
    NSInteger reviewok = [APPUtils get_ud_int:[NSString stringWithFormat:@"reviewok_%@",versionString]];

                           
                          
    if(reviewok==1){
        return YES;
    }else{
        //保障
        NSInteger nowTime = [[APPUtils GetCurrentTimeString] integerValue];
        if(nowTime>1502098913){//2017/8/7 17:41:53
        
            [APPUtils userDefaultsSet:@"1"  forKey:[NSString stringWithFormat:@"reviewok_%@",versionString]];
      
            return YES;
        }else{
            return NO;
        }
    }
}

//计算NSData 的MD5值
+ (NSString*)getMD5WithData:(NSData *)data{
    const char* original_str = (const char *)[data bytes];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x",digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    return [outPutStr lowercaseString];
}


//计算字符串的MD5值
+ (NSString*)getmd5WithString:(NSString *)string
{
    const char* original_str=[string UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x", digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    return [outPutStr lowercaseString];
}


//计算大文件的MD5值
+(NSString*)fileMD5:(NSString*)path
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    if( handle== nil ) return @"ERROR GETTING FILE MD5"; // file didnt exist
    
    CC_MD5_CTX md5;
    
    CC_MD5_Init(&md5);
    
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: FileHashDefaultChunkSizeForReadingData ];
        CC_MD5_Update(&md5, [fileData bytes], [fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString* s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    return s;
}


//重命名文件
+(BOOL)renameFile:(NSString*)path newPath:(NSString*)newPath{

    [[NSFileManager defaultManager] createDirectoryAtPath:[path stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    NSError *error;
  
    return [[NSFileManager defaultManager] moveItemAtPath:path toPath:newPath error:&error];
    
}


//uiimage->base64
+ (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

//uiimage->base64
+ (NSString *) image2DataURL: (UIImage *) image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 0.8f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"%@",
            [imageData base64EncodedStringWithOptions: 0]];
    
}


///Base64图片 -> UIImage
+ (UIImage *) dataURL2Image: (NSString *) imgSrc
{
    @try {
        NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:imgSrc];
        
        UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
        
        return _decodedImage;
    } @catch (NSException *exception) {
        return nil;
    }
    
}

//文本数据格式字符串转换为base64
+ (NSString *)stringToBase64:(NSString *)string{
    NSData *plainData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}

//base64格式字符串转换为文本数据
+ (NSData *)base64ToString:(NSString *)base64String{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    return  decodedData;
}




//urlEncoding 编码
+(NSString *)urlEncode:(NSString*)string
{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                        NULL,
                                                        (CFStringRef)string,
                                                        NULL,
                                                        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                        kCFStringEncodingUTF8 ));
    return encodedString;
}


//NSdic -> jsonstring
+(NSString*)data2jsonString:(id)object{
    NSString *jsonString = @"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    return jsonString;
}


//图片缩放
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


//截取图片
+ (UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect
{
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;
}

/**
 *  剪切图片为正方形
 *
 *  @param image   原始图片比如size大小为(400x200)pixels
 *  @param newSize 正方形的size比如400pixels
 *
 *  @return 返回正方形图片(400x400)pixels
 */
+(UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize {
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height) {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//图片加水印
+(UIImage *)watermarkImage:(UIImage *)img withName:(NSString *)name{
    NSString* mark = name;
    float w = img.size.width;
    float h = img.size.height;
    UIGraphicsBeginImageContext(img.size);
    [img drawInRect:CGRectMake(0, 0, w, h)];
    NSDictionary *attr = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:23],   //设置字体
                           NSForegroundColorAttributeName : [UIColor whiteColor]      //设置字体颜色
                           };
    
    [mark drawInRect:CGRectMake(10, h - 170, w-20, 300) withAttributes:attr];        //左下角
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aimg;
}

//纠正图片方向
+(UIImage *)fixOrientation:(UIImage *)srcImg{
    
    if (srcImg.imageOrientation == UIImageOrientationUp) return srcImg;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (srcImg.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, srcImg.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, srcImg.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (srcImg.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, srcImg.size.width, srcImg.size.height,
                                             CGImageGetBitsPerComponent(srcImg.CGImage), 0,
                                             CGImageGetColorSpace(srcImg.CGImage),
                                             CGImageGetBitmapInfo(srcImg.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (srcImg.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,srcImg.size.height,srcImg.size.width), srcImg.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,srcImg.size.width,srcImg.size.height), srcImg.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
}

//压缩图片
+(NSData*)getZipImage:(UIImage*)editedImage{
    
    NSData *imagedata = UIImageJPEGRepresentation(editedImage, 0.7);
    
    
    if(imagedata.length>500000){//>500k
        imagedata = UIImageJPEGRepresentation(editedImage, 0.4);
    }
    
    
    //        if(imagedata.length>50000){//只有剪裁 >50kb
    //            CGSize imageSize = editedImage.size;
    //            imageSize.width =  imageSize.width*0.6;
    //            imageSize.height = imageSize.height*0.6;//除4最合适 缩放
    //
    //            editedImage = [APPUtils scaleToSize:editedImage size:imageSize];
    //            imagedata = UIImageJPEGRepresentation(editedImage, 0.7);
    //        }
    
    
    return imagedata;
}


//验证数字
+ (BOOL)isNumber:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//验证手机号
+(BOOL) validateMobile:(NSString *)mobile
{
    
    if(mobile.length!=11||![mobile hasPrefix:@"1"]){
        return  NO;
    }else{
        return  YES;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    return [phoneTest evaluateWithObject:mobile];
}

//验证邮箱
+(BOOL)isValidateEmail:(NSString *)emails {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emails];
}

//验证身份证号
+(BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//y验证是否中文
+(BOOL)IsChinese:(NSString *)str {
    BOOL result11 = YES;
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
        }else{
            result11 = NO;
        }
        
    }
    return result11;
    
}

//是否是银行卡
+(BOOL)IsBankCard:(NSString*)cardNumber{
    if(cardNumber.length==0)
    {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++)
    {
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

//判断奇数偶数
+(NSInteger)parity:(NSInteger)num{
    if(num&1){
        return 1;
    }else{
        return 2;
    }
}

//数字数组排序
+(NSArray*)sortArray:(NSMutableArray*)array{
    
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    return [array sortedArrayUsingComparator:cmptr];
}




//数组转字符串
+(NSString*)array2String:(NSMutableArray *)array{
    
    NSMutableString *mString = [[NSMutableString alloc] init];
    [mString appendString:@"["];
    
    for (int  i = 0; i < [array count] ; i ++ ) {
        @try {
             [mString appendString:[NSString stringWithFormat:@"%@,",[array objectAtIndex:i]]];
        } @catch (NSException *exception) {}
       
    }
    
    NSString * Str = [NSString stringWithFormat:@"%@",mString];
    mString = nil;
    
    Str = [Str substringWithRange:NSMakeRange(0,Str.length-1)];
    
    Str = [NSString stringWithFormat:@"%@]",Str];
    
    return Str;
}


//修复单引号
+(NSString*)fixString:(NSString*)str{
    
    @try {
        if(str == nil||[str isEqual:[NSNull null]]||str.length==0){
            str = @"";
        }
        str = [str stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    } @catch (NSException *exception) {
        str = @"";
    }
    
    
    return  str;
}





//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}


//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//文件是否存在沙盒
+(BOOL)fileExist:(NSString*)path{
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

//文件大小显示 传入kb
+ (NSString*) fileSizeConver:(float) fileSize{
    NSString *size = @"";
    if(fileSize>1024){
        size = [NSString stringWithFormat:@"%.1fM",fileSize/1024.0];
    }else{
        size = [NSString stringWithFormat:@"%.0fKB",fileSize];
    }
    return size;
}



//获取文件大小单位 (byte)
+(NSString*)getFilesizeUnit:(float)size{
    
    NSString *sizeString;
    
    if(size>1048576){
        sizeString = [NSString stringWithFormat:@"%.1fMb",size/1024/1024];
    }else{
        sizeString = [NSString stringWithFormat:@"%.0fKb",size/1024];
    }
    
    return sizeString;
}



//NSFileManager 时间排序
+(NSArray *)filesByModDate: (NSString *)fullPath{
    NSError* error = nil;
    NSArray* files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fullPath
                                                                         error:&error];
    if(error == nil)
    {
        NSMutableDictionary* filesAndProperties = [NSMutableDictionary	dictionaryWithCapacity:[files count]];
        for(NSString* path in files)
        {
            NSDictionary* properties = [[NSFileManager defaultManager]
                                        attributesOfItemAtPath:[fullPath stringByAppendingPathComponent:path]
                                        error:&error];
            NSDate* modDate = [properties objectForKey:NSFileModificationDate];
            
            if(error == nil)
            {
                [filesAndProperties setValue:modDate forKey:path];
            }
        }
        
        return [filesAndProperties keysSortedByValueUsingSelector:@selector(compare:)];
        
    }
    
    return nil;
}







//获取唯一字符串
+(NSString*)getUniquenessString{
    CFUUIDRef uuidRef =CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueId = [NSString stringWithString:(__bridge NSString*)uuidStringRef];
    
    return uniqueId;
}


//去掉空白
+(NSString*)clearString:(NSString*)string{
    if(string== nil){
        return @"";
    }
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
}
//去掉特殊符号
+(NSString*)clearSpecialSymbols:(NSString*)string{
    
    //名字去掉特殊字符空格
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\"-"];
    string=[[string componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    string = [string stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    if(string.length>20){//名字最多20个
        string = [string substringWithRange:NSMakeRange(0,20)];
    }
    
    return string;
}


//将数组里的电话换成*
+(NSString*)changePhoneNum2Star:(NSString*)string{
    
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    

    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:PhoneRegularExpression options:0 error:nil];
    
    return  [regularExpression stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@"***"];
    
    
}



//字母顺序
+(NSInteger)getWordSort:(NSString*)word{
    
    word = [word lowercaseString];
    NSInteger index = -1;
    NSArray *wordArray = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    for(int i=0;i<[wordArray count];i++){
        if([word isEqualToString:[wordArray objectAtIndex:i]]){
            index = i;
            break;
        }
    }
    wordArray = nil;
    return index;
}



//获取forward
+(UIImageView*)get_forward:(float)fatherheight x:(float)x{
    UIImageView *forward = [[UIImageView alloc] initWithFrame:CGRectMake(x, (fatherheight-15)/2, 15, 15)];
    [forward setImage:[UIImage imageNamed:@"forward.png"]];
    return forward;
    
}

//获取线条
+(UIView*)get_line:(float)x y:(float)y width:(float)width{
    UIView *topline = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, 0.5)];
    [topline setBackgroundColor:LINECOLOR];
    return topline;
}

+(UIView*)get_line2:(CGRect)frame{
    UIView *topline = [[UIView alloc] initWithFrame:frame];
    [topline setBackgroundColor:LINECOLOR];
    return topline;
}

+(UIView*)get_line3:(CGRect)frame color:(UIColor*)color{
    UIView *topline = [[UIView alloc] initWithFrame:frame];
    [topline setBackgroundColor:color];
    return topline;
}

//alert

+(void)alertShow:(NSString*)string{
    
    [self alertShow:@"" string:string controller:nil];
}

+(void)alertShow:(NSString*)string controller:(UIViewController*)controller{

    [self alertShow:@"" string:string controller:controller];
}

+(void)alertShow:(NSString*)title string:(NSString*)string{
    [self alertShow:title string:string controller:nil];
}

+(void)alertShow:(NSString*)title string:(NSString*)string controller:(UIViewController*)controller{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:string
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                    
                                                      }]];
    
    if(controller==nil){
        [[MainViewController sharedMain] presentViewController:alertController animated:YES completion:NULL];
    }else{
        [controller presentViewController:alertController animated:YES completion:NULL];
    }
    
    
    

}

//支持web浏览的文件
+(BOOL)support_file_check_online:(NSString*)fileType{
    fileType = [fileType lowercaseString];
    NSArray *support = [NSArray arrayWithObjects:@"txt",@"dot",@"doc",@"ppt",@"pptx",@"xlt",@"xls",@"pdf",@"mp3",@"wav",@"flac",@"mp4",@"3gp",@"flv",@"rmvb",@"mov",nil];
    
    BOOL exist = NO;
    for(NSString *a in  support){
        if([a isEqualToString:fileType]){
            exist = YES;
            break;
        }
    }
    support = nil;
    return exist;
}

/*得到文件类型
 pic:图片类
 video:视频类
 office:文档类
 zip:压缩文件类
 other : 其他
 */
+(NSString*)get_file_type:(NSString*)fileType{

    NSString *type = @"other";
    
    if(fileType == nil){
        return  type;
    }
    
    fileType = [[APPUtils fixString:fileType] lowercaseString];
    BOOL exist = NO;
    
    
    
    NSArray *pic = [NSArray arrayWithObjects:@"pic",@"bmp",@"jpg",@"jpeg",@"png",@"gif",nil];
    
    for(NSString *a in  pic){
        if([a isEqualToString:fileType]){
            type = @"pic";
            exist = YES;
            break;
        }
    }
    pic = nil;
    
    if(!exist){
        NSArray *office = [NSArray arrayWithObjects:@"txt",@"dot",@"doc",@"ppt",@"pptx",@"xlt",@"xls",@"pdf",nil];
        
        for(NSString *a in  office){
            if([a isEqualToString:fileType]){
                type = @"office";
                exist = YES;
                break;
            }
        }
        office = nil;
    }
    
    if(!exist){
        NSArray *video = [NSArray arrayWithObjects:@"mp4",@"3gp",@"flv",@"rmvb",@"mov",@"mkv",nil];
        
        for(NSString *a in  video){
            if([a isEqualToString:fileType]){
                type = @"video";
                exist = YES;
                break;
            }
        }
        video = nil;
    }
    
    if(!exist){
        NSArray *audio = [NSArray arrayWithObjects:@"mp3",@"wav",@"flac",nil];
        
        for(NSString *a in  audio){
            if([a isEqualToString:fileType]){
                type = @"audio";
                exist = YES;
                break;
            }
        }
        audio = nil;
    }
    
    if(!exist){
        NSArray *audio = [NSArray arrayWithObjects:@"amr",nil];
        
        for(NSString *a in  audio){
            if([a isEqualToString:fileType]){
                type = @"voice";
                exist = YES;
                break;
            }
        }
        audio = nil;
    }
    
    
    if(!exist){
        NSArray *zip = [NSArray arrayWithObjects:@"zip",@"7z",@"rar",nil];
        
        for(NSString *a in  zip){
            if([a isEqualToString:fileType]){
                type = @"zip";
                exist = YES;
                break;
            }
        }
        zip = nil;
    }
    
    return type;
    
}


//文件类型中文
+(NSString*)get_file_type_name:(NSString*)type{

    type = [APPUtils fixString:type];
     NSString *name;
    if([type isEqualToString:@"pos"]){
        name = @"位置";
    }else if([type isEqualToString:@"voice"]){
        name = @"语音";
    }else if([type isEqualToString:@"write"]){
        name = @"手写";
    }else if([type isEqualToString:@"tuya"]){
        name = @"涂鸦";
    }else{
        type = [APPUtils get_file_type:type];
        if([type isEqualToString:@"pic"]){
             name = @"图片";
        }else if([type isEqualToString:@"video"]){
            name = @"视频";
        }else{
            name = @"文件";
        }
    }
    return name;

}



//json解析array
+(NSMutableArray*)getArrByJson:(NSString*)string{
    
    @try {
        NSError *jsonError;
        NSMutableArray *usersArray = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingMutableLeaves) error:&jsonError];
        
        if(usersArray==nil||[usersArray isEqual:[NSNull null]] || (![usersArray isKindOfClass:[NSMutableArray class]] && ![usersArray isKindOfClass:[NSArray class]]) ){
            usersArray = [[NSMutableArray alloc] init];
        }
         return usersArray;
        
    } @catch (NSException *exception) {
        return nil;
    }

}



//json解析jsondic
+(NSDictionary*)getDicByJson:(NSString*)string{
    @try {
        
        NSError *jsonError;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&jsonError];
        
        if(jsonDic==nil||[jsonDic isEqual:[NSNull null]] || (![jsonDic isKindOfClass:[NSMutableDictionary class]] && ![jsonDic isKindOfClass:[NSDictionary class]]) ){
            return nil;
        }
        
        return jsonDic;
    } @catch (NSException *exception) {
        return nil;
    }
   
}


//nsdata base64 ->nsstring
+(NSString*)dataBase64String:(NSData*)data{
    return [data base64EncodedStringWithOptions: 0];
}

//nsstring base64 ->nsdata
+(NSData*)stringBase64Data:(NSString*)string{
    return [[NSData alloc] initWithBase64Encoding:string];
}


//nsdata->nsstring
+(NSString*)data2String:(NSData*)data{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//nsstring->nsdata
+(NSData*)string2Data:(NSString*)string{
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

//字符串里存在字符
+(BOOL)stringinstring:(NSString*)mainString found:(NSString*)found{
    if([mainString rangeOfString:found].location !=NSNotFound){
        return YES;
    }else{
        return NO;
    }
}

//当前时间
+ (NSString*)GetCurrentTimeString {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSInteger timeint = a;
    NSString *timeString = [NSString stringWithFormat:@"%d", timeint];
    return  timeString;
}


//秒数转分时显示
+(NSString*)unixSecond2Time:(NSInteger)unixTime{
    
    NSString *timeString = @"";
    
    NSInteger minutes = unixTime/60;
    NSInteger second = unixTime - minutes*60;
    
    NSString *zero = @"";
    if(minutes==0){//一分钟内
        if(second<10){
            zero = @"0";
        }
        timeString = [NSString stringWithFormat:@"00:%@%d",zero,(int)second];
        
    }else{
        NSString *minutesZero = @"";
        if(second<10){
            zero = @"0";
        }
        if(minutes<10){
            minutesZero = @"0";
        }
        
        timeString = [NSString stringWithFormat:@"%@%d:%@%d",minutesZero,(int)minutes,zero,(int)second];
        
    }
    zero= nil;
    return timeString;
}

+(NSString*)unixSecond2Time2:(NSInteger)unixTime{
    
    NSString *timeString = @"";
    
    NSInteger minutes = unixTime/60;
    NSInteger second = unixTime - minutes*60;
    
    
    if(minutes==0){
        timeString = [NSString stringWithFormat:@"%d 秒",(int)second];
    }else{
        if(second<10){
            timeString = [NSString stringWithFormat:@"%d:0%d",(int)minutes,(int)second];
        }else{
            timeString = [NSString stringWithFormat:@"%d:%d",(int)minutes,(int)second];
        }
        
    }
    return timeString;
}


//秒数转分钟小时
+(NSString*)seconds2Time:(float)second{
    
    NSString *timeString = second>=3600?[NSString stringWithFormat:@"%.1f小时内",second/3600]:[NSString stringWithFormat:@"%.0f分钟内",second/60];
    timeString = [timeString stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
    return timeString;
    
}

+(NSString*)seconds2Time2:(float)second{
    
    NSString *timeString = [NSString stringWithFormat:@"%.1f小时",second/3600];
    timeString = [timeString stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
    return timeString;
    
}


+(NSInteger)time2Second:(NSString*)time{
    
    NSInteger seconds=0;
    if([time rangeOfString:@"分钟"].location !=NSNotFound){
        time =  [time stringByReplacingOccurrencesOfString:@"分钟内" withString:@""];
        seconds = [time integerValue]*60;
    }else{
        time =  [time stringByReplacingOccurrencesOfString:@"小时内" withString:@""];
        seconds = [time floatValue]*3600;
    }
    
    return seconds;
}



//判断是否闰年
+(BOOL)bissextile:(int)year {
    if ((year%4==0 && year %100 !=0) || year%400==0) {
        return YES;
    }else {
        return NO;
    }
    return NO;
}

//unix时间转nsdate
+(NSDate*)unixTime2Date:(NSInteger)unix{
    double unixTimeStamp = unix;
    NSTimeInterval _interval=unixTimeStamp;
    return  [NSDate dateWithTimeIntervalSince1970:_interval];
}

//nsdate时间转unix
+(NSInteger)date2Unixtime:(NSDate*)date{
    NSTimeInterval a=[date timeIntervalSince1970];
    return a;
}

//获取日期细节
+(NSDateComponents*)getDateInfo:(NSDate*)date{
    //获取时分秒（24小时制度）
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit;
    
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    
    return comps;
}


//获取文件图标
+(UIImage *)getFileIcon:(NSString*)tail{
   
    tail = [APPUtils fixString:tail];
    UIImage *typeImage;
    
    if([tail hasPrefix:@"txt"]){
        typeImage = [UIImage imageNamed:@"textFile.png"];
    }else if([tail hasPrefix:@"doc"]){
        typeImage = [UIImage imageNamed:@"wordFile.png"];
    }else if([tail hasPrefix:@"ppt"]){
        typeImage = [UIImage imageNamed:@"pptFile.png"];
    }else if([tail hasPrefix:@"xl"] || [tail hasPrefix:@"xl"]){
        typeImage = [UIImage imageNamed:@"excelFile.png"];
    }else if([tail hasPrefix:@"zip"] || [tail hasPrefix:@"rar"]||[tail hasPrefix:@"7z"]){
        typeImage = [UIImage imageNamed:@"zipFile.png"];
    }else if([tail hasPrefix:@"pdf"]){
        typeImage = [UIImage imageNamed:@"pdfFile.png"];
    }else if([[APPUtils get_file_type:tail]isEqualToString:@"audio"]){
        typeImage = [UIImage imageNamed:@"musicFile.png"];
    }else if([[APPUtils get_file_type:tail]isEqualToString:@"video"]){
        typeImage = [UIImage imageNamed:@"videoFile.png"];
    }else{
        typeImage = [UIImage imageNamed:@"unknownFile.png"];
    }
    
    return  typeImage;
}

//比较两个数大小
+(CGFloat)compareFloat:(double)a b:(double)b{
    
    if(a>b){
        return b;
    }else{
        return a;
    }
}


//解密
+(NSString*)unCrypt:(NSString*)baseString{
    
    NSData *unBase64Data =  [APPUtils base64ToString:baseString];
    NSString *resultString = [NSString stringWithFormat:@"%@",[DES3Util decrypt_data:unBase64Data]];
    unBase64Data = nil;
    return resultString;
}

//解码
+(NSString *)URLDecodedString:(NSString *)str
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

//验证纯数字
+(BOOL)isPureNumandCharacters:(NSString *)string{
    string = [string stringByTrimmingCharactersInSet:
              [NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

//是否包含电话号码
+(BOOL)phoneInString:(NSString *)string{
    
    //invertedSet方法是去反字符,把所有的除了@"0123456789"里的字符都找出来(包含去空格功能)替换成"."
    string = [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@"."];
    
    NSArray * parts = [string componentsSeparatedByString:@"."];
    BOOL hasPhone = NO;
    for(int i=0;i<[parts count];i++){
        NSString *tempString = [parts objectAtIndex:i];
        if(tempString!= nil&&tempString.length>0){
            BOOL isphone = [self validateMobile:tempString];
            if(isphone){
                hasPhone = YES;
                break;
            }
            tempString = nil;
        }
    }
    parts = nil;
    return hasPhone;
    
}


//获取一行高
+(CGFloat)getOnelineHeight:(UIFont*)font{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    
    NSDictionary *attribute = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraph};
    
    CGSize oneSize = [@"啊" boundingRectWithSize:CGSizeMake(SCREENWIDTH, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    CGFloat oneLineHeight = oneSize.height;
    paragraph = nil;
    attribute = nil;
    
    return oneLineHeight;
}

//是否超过一行
+(BOOL)moreThanOneLine:(UIFont*)font width:(float)width words:(NSString*)words{

    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    
    NSDictionary *attribute = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraph};
    
    CGSize oneSize = [words boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    if(oneSize.width<width){
        return NO;
    }else{
        return YES;
    }
    
}


//根据键盘号码获取字母
+(NSArray*)getLetterByNum:(NSInteger)num{
    
    NSArray *lettersArray;
    
    if(num==2){
        lettersArray = [[NSArray alloc] initWithObjects:@"A",@"B",@"C", nil];
    }else if(num==3){
        lettersArray = [[NSArray alloc] initWithObjects:@"D",@"E",@"F", nil];
    }else if(num==4){
        lettersArray = [[NSArray alloc] initWithObjects:@"G",@"H",@"I", nil];
    }else if(num==5){
        lettersArray = [[NSArray alloc] initWithObjects:@"J",@"K",@"L", nil];
    }else if(num==6){
        lettersArray = [[NSArray alloc] initWithObjects:@"M",@"N",@"O", nil];
    }else if(num==7){
        lettersArray = [[NSArray alloc] initWithObjects:@"P",@"Q",@"R",@"S",nil];
    }else if(num==8){
        lettersArray = [[NSArray alloc] initWithObjects:@"T",@"U",@"V", nil];
    }else if(num==9){
        lettersArray = [[NSArray alloc] initWithObjects:@"W",@"X",@"Y",@"Z",nil];
    }else{
        return nil;
    }
    
    return lettersArray;
}



//根据字母获取键盘号码
+(NSString*)getNumByLetter:(NSString*)letter{
    
    NSString *number = @"";
    if([[letter lowercaseString] isEqualToString:@"a"]||[[letter lowercaseString] isEqualToString:@"b"]||[[letter lowercaseString] isEqualToString:@"c"]){
        number = @"2";
    }else if([[letter lowercaseString] isEqualToString:@"d"]||[[letter lowercaseString] isEqualToString:@"e"]||[[letter lowercaseString] isEqualToString:@"f"]){
        number = @"3";
    }else if([[letter lowercaseString] isEqualToString:@"g"]||[[letter lowercaseString] isEqualToString:@"h"]||[[letter lowercaseString] isEqualToString:@"i"]){
        number = @"4";
    }else if([[letter lowercaseString] isEqualToString:@"j"]||[[letter lowercaseString] isEqualToString:@"k"]||[[letter lowercaseString] isEqualToString:@"l"]){
        number = @"5";
    }else if([[letter lowercaseString] isEqualToString:@"m"]||[[letter lowercaseString] isEqualToString:@"n"]||[[letter lowercaseString] isEqualToString:@"o"]){
        number = @"6";
    }else if([[letter lowercaseString] isEqualToString:@"p"]||[[letter lowercaseString] isEqualToString:@"q"]||[[letter lowercaseString] isEqualToString:@"r"]||[[letter lowercaseString] isEqualToString:@"s"]){
        number = @"7";
    }else if([[letter lowercaseString] isEqualToString:@"t"]||[[letter lowercaseString] isEqualToString:@"u"]||[[letter lowercaseString] isEqualToString:@"v"]){
        number = @"8";
    }else if([[letter lowercaseString] isEqualToString:@"w"]||[[letter lowercaseString] isEqualToString:@"x"]||[[letter lowercaseString] isEqualToString:@"y"]||[[letter lowercaseString] isEqualToString:@"z"]){
        number = @"9";
    }
    
    return number;
}



//钱的单位
+(NSString*)getMoneyUnit:(NSInteger)num unit:(NSString*)unit{
    NSString *moneyUnit;
    
    
    if(num>=100 && num%100==0){
        moneyUnit = [NSString stringWithFormat:@"%d%@",num/100,unit];
    }else{
        float money = num;
        moneyUnit = [NSString stringWithFormat:@"%.2f%@",money/100,unit];
    }
    
    moneyUnit = [moneyUnit stringByReplacingOccurrencesOfString:@".00" withString:@""];
    
    if([moneyUnit isEqualToString:[NSString stringWithFormat:@"0.0%@",unit]]){
        moneyUnit = [NSString stringWithFormat:@"0%@",unit];
    }
    
    return moneyUnit;
}

//钱的单位 元
+(NSString*)getMoneyUnit_onlyYuan:(NSInteger)num{
    
    NSString *moneyUnit;
    
    if(num>=100 && num%100==0){
        moneyUnit = [NSString stringWithFormat:@"%d元",num/100];
    }else{
        float money = num;
        moneyUnit = [NSString stringWithFormat:@"%.0f元",money/100];
    }
    
    moneyUnit = [moneyUnit stringByReplacingOccurrencesOfString:@".00" withString:@""];
    
    if([moneyUnit isEqualToString:@"0.0元"]){
        moneyUnit = @"0元";
    }
    
    return moneyUnit;
    
}



//检查推送
+(BOOL)checkPushMission{
    
    BOOL isOpen = NO;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (setting.types != UIUserNotificationTypeNone) {
        isOpen = YES;
    }
#else
    UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if (type != UIRemoteNotificationTypeNone) {
        isOpen = YES;
    }
#endif
    
    return isOpen;
    
}


//判断星期几
+(NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


+(NSString*)get_ud_string:(NSString*)key{
    return [[APPUtils getUserDefault] objectForKey:key];
}

+(NSInteger)get_ud_int:(NSString*)key{
    return [[APPUtils getUserDefault] integerForKey:key];
}

//获得NSUserDefaults
+(NSUserDefaults*)getUserDefault{
    if(user_Defaults==nil){
        user_Defaults =  [NSUserDefaults standardUserDefaults];
    }
    return user_Defaults;
}


//设置NSUserDefaults
+(void)userDefaultsSet: (NSObject*)value forKey:(NSString*)key{
    
    if(value==nil || [value isEqual:[NSNull null]]){
        return;
    }
    
    @try {
        //不能存可变参数
        if([value isKindOfClass:[NSMutableArray class]]){
            value = [NSArray arrayWithArray:(NSMutableArray*)value];
        }else if([value isKindOfClass:[NSString class]]){
            value = [NSString stringWithFormat:@"%@",(NSString*)value];
        }
        
        dispatch_queue_t concurrentQueue = dispatch_queue_create("com.myncic.userdefault",DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(concurrentQueue, ^{
            @try {
                 [[APPUtils getUserDefault] setObject:value forKey:key];
                 [[APPUtils getUserDefault] synchronize];
            } @catch (NSException *exception) {}
           
           
            
        });

    } @catch (NSException *exception) {}
    
}


//清理NSUserDefaults
+(void)userDefaultsDelete:(NSString*)key{
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.myncic.userdefault",DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
   
        [[APPUtils getUserDefault] removeObjectForKey:key];
//        [u synchronize];
    });
    
}

//判断颜色是否相等
+ (BOOL) isTheSameColor2:(UIColor*)color1 anotherColor:(UIColor*)color2{
    return  CGColorEqualToColor(color1.CGColor, color2.CGColor);
}


//添加阴影
+(void)addShadow:(UIView*)view{

//    [view.layer setMasksToBounds:YES];
    
    UIView *detailUnder = [[UIView alloc] initWithFrame:CGRectMake(0, 12, SCREENWIDTH, 2)];//阴影
    [detailUnder setBackgroundColor:[UIColor whiteColor]];
    detailUnder.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    detailUnder.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    detailUnder.layer.shadowOpacity = 0.7;//阴影透明度，默认0
    detailUnder.layer.shadowRadius = 5;//阴影半径，默认3
    [view addSubview:detailUnder];
    detailUnder = nil;
    
    
    
    UIView *detailBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREENWIDTH, SCREENHEIGHT)];
    [detailBackground setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:detailBackground];
    [detailBackground addSubview:[APPUtils get_line:0 y:0 width:SCREENWIDTH]];
    detailBackground = nil;
    
}

//获取定位按钮
+(UIView*)getLocationBtn:(UIImage*)img x:(float)x y:(float)y width:(float)width{
   
    
    
    UIView *locationView =  [[UIView alloc] initWithFrame:CGRectMake(x, y, 40, 40)];
    
    UIView *locationUnder = [[UIView alloc] initWithFrame:CGRectMake((locationView.width-31)/2, (locationView.height-31)/2, 31, 31)];
    [locationUnder setBackgroundColor:[UIColor whiteColor]];
    locationUnder.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    locationUnder.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移
    locationUnder.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    locationUnder.layer.shadowRadius = 3;//阴影半径，默认3
    [locationView addSubview:locationUnder];
    
    
    UIView *llControl = [[UIView alloc] initWithFrame:CGRectMake((locationView.width-35)/2, (locationView.height-35)/2, 35, 35)];
    [llControl setBackgroundColor:[UIColor whiteColor]];
    llControl.layer.shouldRasterize = YES;
    llControl.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    [llControl.layer setCornerRadius:4];
    [llControl.layer setMasksToBounds:YES];//圆角不被盖
    [locationView addSubview:llControl];
    
    float offet = 0;
    if(width == 0){
        width = 20;
        offet = 1;
    }
    
    UIImageView *locationImage = [[UIImageView alloc] initWithFrame:CGRectMake((llControl.width-width)/2-offet, (llControl.height-width)/2+offet, width, width)];
    locationImage.layer.shouldRasterize = YES;
    locationImage.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    [locationImage setImage:img];
    [llControl addSubview:locationImage];
    
    
    
    MyBtnControl *locationControl = [[MyBtnControl alloc] initWithFrame:CGRectMake(0, 0, locationView.width, locationView.height)];
    locationControl.tag = 123;
    [locationView addSubview:locationControl];
    locationControl.shareImage = locationImage;
    
    locationImage = nil;
    locationControl = nil;
    llControl = nil;
    locationUnder = nil;
    
    return locationView;
}



//转圈
+(void)takeAround:(NSInteger)count duration:(float)duration view:(UIView*)view toLeft:(BOOL)toLeft{

    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: (toLeft?M_PI * -2.0:M_PI * 2.0)];
    rotationAnimation.duration =duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = count==0?CGFLOAT_MAX:count;
    rotationAnimation.removedOnCompletion = NO;//必须加 不然到其他页面后会停止
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    rotationAnimation = nil;
    
}




//通讯录名字转换
+ (NSString *) nameConvert:(NSString*)sourceString {
    if ([sourceString isEqualToString:@""]) {
        return sourceString;
    }
    
    if([sourceString isEqualToString:@"长"]){
        return @"chang";
    }else if([sourceString isEqualToString:@"仇"]){
        return @"qiu";
    }else if([sourceString isEqualToString:@"沈"]){
        return @"sheng";
    }else if([sourceString isEqualToString:@"厦"]){
        return @"xia";
    }else if([sourceString isEqualToString:@"地"]){
        return @"di";
    }else if([sourceString isEqualToString:@"重"]){
        return @"chong";
    }else{
        NSMutableString *mutableString = [NSMutableString stringWithString:sourceString];
        CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
        mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
        sourceString = [mutableString stringByReplacingOccurrencesOfString:@"'" withString:@""];
        return sourceString;
    }
    
    return sourceString;
}

//释放音频资源
+ (void)releseAudio{
   
    [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    
    if([APPUtils get_ud_int:@"slient_back"]==1){
         //会影响后台静默播放
        if([AppDelegate getIsBackGround]){
            [APPUtils unlimitedPlay];
        }
    }
}

//释放音频资源 share:与其他分享 将其他音源弱化。用户后台播放 share与其他音频共享
+(void)takeAudio:(BOOL)share{
    
    if(share){
        [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionDuckOthers error:nil];
    }else{
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error:nil];
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    }
    
     [[AVAudioSession sharedInstance] setActive:YES error:nil];
}


//去打分
+(void)grade:(NSString*)app_id{

    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",app_id];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}

//相机权限判断
+(NSInteger)checkAVAuthorizationStatus {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied){
        //无权限
        if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied){
            //无权限
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                                     message:@"请在Iphone的 设置-隐私-相机 选项中，允许本应用访问您的相机"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
            
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
                [APPUtils intoSetting];
            }];
            
            [alertController addAction:cancel];
            [alertController addAction:confirm];
            
            
            [[MainViewController sharedMain] presentViewController:alertController animated:YES completion:nil];
            cancel = nil;
            confirm = nil;
            alertController = nil;
        }
        
        return 0;
        
    }else if(authStatus == AVAuthorizationStatusNotDetermined){//询问中
        return 2;
    }else{
        return 1;
    }
}

//图片切换效果
+(void)changeImg:(UIImageView*)imgView img:(UIImage*)img duration:(float)duration type:(NSString*)type{
  
    
    [imgView setImage:img];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2f;
    if(type==nil){
        type = kCATransitionFade;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }else{
        if([type isEqualToString:@"oglFlip"]){//水平翻转
            transition.subtype = kCATransitionFromRight;
        }
    }
    transition.type = type;
    [imgView.layer addAnimation:transition forKey:nil];
}


//获取名字的首字母、全拼等
+(NSMutableDictionary*)getLettersOfName:(NSString*)name{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    @try {
        

        NSString *firstWord;//第一个字的完整拼音
        
        NSMutableString *lettersString = [[NSMutableString alloc] init]; //每个字首字母的拼音组合
        NSMutableString *wordsString = [[NSMutableString alloc] init]; //每个字的拼音组合
        NSMutableString *wordsArrayString = [[NSMutableString alloc] init];
        
        
        for(int i=0;i<name.length;i++){
            NSString *word = [name substringWithRange:NSMakeRange(i,1)];
            word = [APPUtils  nameConvert: word];
            if(i==0){
                firstWord = word;
            }
            
            NSMutableString *letterNumString = [[NSMutableString alloc] init];
            
            for(int j=0;j<word.length;j++){
                @try {
                    [letterNumString appendString:[APPUtils getNumByLetter:[word substringWithRange:NSMakeRange(j,1)]]];
                } @catch (NSException *exception) {
                }
            }
            @try {
                [wordsArrayString appendString:[NSString stringWithFormat:@"%@,",[NSString stringWithFormat:@"%@",letterNumString]]];
            } @catch (NSException *exception) {
                
            }
            
            letterNumString = nil;
            
            @try {
                [wordsString appendString:word];
                word = [word substringWithRange:NSMakeRange(0,1)];
                [lettersString appendString:word];
            } @catch (NSException *exception) {}
            
            
            word = nil;
        }
        
      
        [dic setObject:[APPUtils fixString:firstWord] forKey:@"firstWord"];//chang
        
        NSString *firstLetter=@"";
        @try {
            firstLetter = [firstWord substringWithRange:NSMakeRange(0,1)];
        } @catch (NSException *exception) {}
        
        [dic setObject:[APPUtils fixString:firstLetter] forKey:@"firstLetter"];//c
        [dic setObject:[NSString stringWithFormat:@"%@",lettersString] forKey:@"allLetters"];//cyq
        [dic setObject:[NSString stringWithFormat:@"%@",wordsString] forKey:@"allWords"];//changyouquan
        
  
        firstWord = nil;
        lettersString = nil;
        wordsArrayString = nil;
        wordsString = nil;
    } @catch (NSException *exception) {
        return nil;
    }
    
    return dic;
}

//创建普通二维码
+(void)createQRCode:(NSString*)string imgView:(UIImageView*)imgView centerImg:(UIImage*)centerImg{
    // 1. 创建一个二维码滤镜实例(CIFilter)
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 滤镜恢复默认设置
    [filter setDefaults];
    
    // 2. 给滤镜添加数据
    
    NSData *data = [APPUtils string2Data:string];
    // 使用KVC的方式给filter赋值
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 3. 生成二维码
    CIImage *image = [filter outputImage];
    UIImage *qrImage = [self excludeFuzzyImageFromCIImage:image size:imgView.width];
    [imgView setImage:qrImage];
    
    //中间图片
    if(centerImg!=nil){
        CGFloat headWidth = imgView.width*0.23;
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake((imgView.width-headWidth)/2, (imgView.height-headWidth)/2, headWidth, headWidth)];
        headView.layer.cornerRadius = 5;
        [headView.layer setMasksToBounds:YES];
        [headView setBackgroundColor:[UIColor whiteColor]];
        [imgView addSubview:headView];
        
        UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, headWidth-6, headWidth-6)];
        headImage.layer.cornerRadius = 5;
        [headImage.layer setMasksToBounds:YES];
        [headImage setImage:centerImg];
        [headView addSubview:headImage];
        headImage = nil;
        headView = nil;
    }
}

//-- 对图像进行清晰处理，很关键！
+(UIImage *)excludeFuzzyImageFromCIImage: (CIImage *)image size: (CGFloat)size{
    CGRect extent = CGRectIntegral(image.extent);
    
    //通过比例计算，让最终的图像大小合理（正方形是我们想要的）
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext * context = [CIContext contextWithOptions: nil];
    
    CGImageRef bitmapImage = [context createCGImage: image fromRect: extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    //切记ARC模式下是不会对CoreFoundation框架的对象进行自动释放的，所以要我们手动释放
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    CGColorSpaceRelease(colorSpace);
    
    return [UIImage imageWithCGImage: scaledImage];
}


//打乱数组顺序
+(NSMutableArray*)chaosArray:(NSMutableArray *)arry{
    // 对数组乱序
    
    //随机数产生结果
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    //随机数个数
    NSInteger m=8;
    for (int i=0; i<m; i++) {
        int t=arc4random()%arry.count;
        resultArray[i]=arry[t];
        arry[t]=[arry lastObject]; //为更好的乱序，故交换下位置
        [arry removeLastObject];
    }
    return resultArray;
}

//制造个异常
+(void)makeException{
    NSArray *a = [[NSArray alloc] init];
    [a objectAtIndex:1];
    [ShowWaiting hideWaiting];
}


//无限播放音频  保持后台
+(void)unlimitedPlay{
    
    if(unlimitePlayer!=nil){
        [unlimitePlayer stop];
        unlimitePlayer = nil;
    }

    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatchQueue, ^(void) {
    
        [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
        
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:@"quite" ofType:@"mp3"];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        
        unlimitePlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
        unlimitePlayer.volume = 0.2;
        if (unlimitePlayer != nil){
            [unlimitePlayer setNumberOfLoops:-1];
            if ([unlimitePlayer prepareToPlay] && [unlimitePlayer play]){
                NSLog(@"开启无限..");
            }
        }
    });
}

//设定一个不重复的本地推送
+(void)make_A_local_notification:(NSDate*)alarmDate string:(NSString*)string{
    
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil){
        notification.repeatInterval = 0;//不重复
        notification.fireDate=alarmDate;//距现在多久后触发代理方法
        notification.timeZone=[NSTimeZone timeZoneWithName:@"GMT+8"];
        notification.alertBody = string;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    notification = nil;
}
@end
