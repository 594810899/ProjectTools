
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "sys/utsname.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "MainViewController.h"
#import "AppDelegate.h"
#define FileHashDefaultChunkSizeForReadingData 1024*8 // 8K

static NSUserDefaults *user_Defaults;
static NSString *method;

static AVAudioPlayer *unlimitePlayer;//无限播放

@interface APPUtils :NSObject

//应用位置
+ (NSString *)getMethod;
+ (void)setMethod:(NSString*)m;
aaaaa

//打开设置
+(void)intoSetting;

//iphone 型号
+ (NSString *)getCurrentDeviceModel;

//获取iphone 屏幕版本
+(NSString *)getIphoneVersion;

//获取启动页尺寸
+(NSString*)getLoadingImageName:(NSInteger)num;

//是否在审核时间
+(BOOL)reviewOk;

//计算NSData 的MD5值
+(NSString*)getMD5WithData:(NSData*)data;

//计算字符串的MD5值，
+(NSString*)getmd5WithString:(NSString*)string;

//计算大文件的MD5值
+(NSString*)fileMD5:(NSString*)path;

//重命名文件
+(BOOL)renameFile:(NSString*)path newPath:(NSString*)newPath;

//uiimage ->base64
+ (BOOL) imageHasAlpha: (UIImage *) image;
+ (NSString *) image2DataURL: (UIImage *) image;

//base64 -> uiimage
+ (UIImage *) dataURL2Image: (NSString *) imgSrc;


//文本数据格式字符串转换为base64
+ (NSString *)stringToBase64:(NSString *)string;

//base64格式字符串转换为文本数据
+ (NSData *)base64ToString:(NSString *)base64String;


//urlEncoding 编码
+(NSString *)urlEncode:(NSString*)string;

//NSdic -> jsonstring
+(NSString*)data2jsonString:(id)object;

//字符串里存在字符
+(BOOL)stringinstring:(NSString*)mainString found:(NSString*)found;

//图片缩放
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

//截取图片
+(UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect;

//剪裁正方形
+(UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;

//图片加水印
+(UIImage *)watermarkImage:(UIImage *)img withName:(NSString *)name;

//纠正图片方向
+(UIImage *)fixOrientation:(UIImage *)srcImg;

//压缩图片
+(NSData*)getZipImage:(UIImage*)editedImage;

//验证数字
+ (BOOL)isNumber:(NSString *)string;

//验证手机号
+(BOOL) validateMobile:(NSString *)mobile;

//验证邮箱
+(BOOL)isValidateEmail:(NSString *)emails;

//验证身份证号
+(BOOL) validateIdentityCard: (NSString *)identityCard;

//y验证是否中文
+(BOOL)IsChinese:(NSString *)str;

//是否是银行卡
+(BOOL)IsBankCard:(NSString*)cardNumber;

//判断奇数偶数
+(NSInteger)parity:(NSInteger)num;

//数字数组排序
+(NSArray*)sortArray:(NSMutableArray*)array;

//数组转字符串
+(NSString*)array2String:(NSMutableArray *)array;

//修复单引号
+(NSString*)fixString:(NSString*)str;

//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath;

//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath;

//文件是否存在沙盒
+(BOOL)fileExist:(NSString*)path;

//文件大小显示 传入kb
+ (NSString*) fileSizeConver:(float) fileSize;

//获取文件大小单位 (byte)
+(NSString*)getFilesizeUnit:(float)size;

//NSFileManager 时间排序
+(NSArray *)filesByModDate: (NSString *)fullPath;



//获取唯一字符串
+(NSString*)getUniquenessString;

//去掉空白
+(NSString*)clearString:(NSString*)string;

//去掉特殊符号
+(NSString*)clearSpecialSymbols:(NSString*)string;

//将数组里的电话换成*
+(NSString*)changePhoneNum2Star:(NSString*)string;

//字母顺序
+(NSInteger)getWordSort:(NSString*)word;


//获取forward
+(UIImageView*)get_forward:(float)fatherheight x:(float)x;

//获取线条
+(UIView*)get_line:(float)x y:(float)y width:(float)width;
+(UIView*)get_line2:(CGRect)frame;
+(UIView*)get_line3:(CGRect)frame color:(UIColor*)color;

//alert

+(void)alertShow:(NSString*)string;
+(void)alertShow:(NSString*)title string:(NSString*)string;

+(void)alertShow:(NSString*)string controller:(UIViewController*)controller;
+(void)alertShow:(NSString*)title string:(NSString*)string controller:(UIViewController*)controller;


//支持web浏览的文件
+(BOOL)support_file_check_online:(NSString*)fileType;

/*得到文件类型
 pic:图片类
 video:视频类
 office:文档类
 zip:压缩文件类
 other : 其他
 */
+(NSString*)get_file_type:(NSString*)fileType;

//文件类型中文
+(NSString*)get_file_type_name:(NSString*)type;

//json解析array
+(NSMutableArray*)getArrByJson:(NSString*)string;

//json解析jsondic
+(NSDictionary*)getDicByJson:(NSString*)string;

//nsdata base64 ->nsstring
+(NSString*)dataBase64String:(NSData*)data;

//nsstring base64 ->nsdata
+(NSData*)stringBase64Data:(NSString*)string;

//nsdata->nsstring
+(NSString*)data2String:(NSData*)data;

//nsstring->nsdata
+(NSData*)string2Data:(NSString*)string;

//当前时间
+ (NSString*)GetCurrentTimeString;

//秒数转分时显示
+(NSString*)unixSecond2Time:(NSInteger)unixTime;
+(NSString*)unixSecond2Time2:(NSInteger)unixTime;

//秒数转分钟小时
+(NSString*)seconds2Time:(float)second;
+(NSString*)seconds2Time2:(float)second;
+(NSInteger)time2Second:(NSString*)time;

//判断是否闰年
+(BOOL)bissextile:(int)year;

//unix时间转nsdate
+(NSDate*)unixTime2Date:(NSInteger)unix;

//nsdate时间转unix
+(NSInteger)date2Unixtime:(NSDate*)date;

//获取日期细节
+(NSDateComponents*)getDateInfo:(NSDate*)date;

//获取文件图标
+(UIImage *)getFileIcon:(NSString*)tail;

//比较两个数大小
+(CGFloat) compareFloat:(double)a b:(double)b;

//解密
+(NSString*)unCrypt:(NSString*)baseString;

//解码
+(NSString *)URLDecodedString:(NSString *)str;

//验证纯数字
+(BOOL)isPureNumandCharacters:(NSString *)string;

//是否有号码
+(BOOL)phoneInString:(NSString *)string;

//获取一行高
+(CGFloat)getOnelineHeight:(UIFont*)font;

//是否超过一行
+(BOOL)moreThanOneLine:(UIFont*)font width:(float)width words:(NSString*)words;

//根据键盘号码获取字母
+(NSArray*)getLetterByNum:(NSInteger)num;


//根据字母获取键盘号码
+(NSString*)getNumByLetter:(NSString*)letter;

//钱的单位
+(NSString*)getMoneyUnit:(NSInteger)num unit:(NSString*)unit;

//钱单位
+(NSString*)getMoneyUnit_onlyYuan:(NSInteger)num;

//检查推送
+(BOOL)checkPushMission;

//判断星期几
+(NSString*)weekdayStringFromDate:(NSDate*)inputDate;

//获得NSUserDefaults
+(NSUserDefaults*)getUserDefault;
+(NSString*)get_ud_string:(NSString*)key;
+(NSInteger)get_ud_int:(NSString*)key;


//设置NSUserDefaults
+(void)userDefaultsSet:(NSObject*)value forKey:(NSString*)key;

//清理NSUserDefaults
+(void)userDefaultsDelete:(NSString*)key;


//判断两个颜色是否相等
+ (BOOL) isTheSameColor2:(UIColor*)color1 anotherColor:(UIColor*)color2;

//添加阴影
+(void)addShadow:(UIView*)view;

//获取定位按钮
+(UIView*)getLocationBtn:(UIImage*)img x:(float)x y:(float)y width:(float)width;

//转圈 默认顺时针
+(void)takeAround:(NSInteger)count duration:(float)duration view:(UIView*)view toLeft:(BOOL)toLeft;

//通讯录名字转换
+ (NSString *) nameConvert:(NSString*)sourceString;


//释放音频资源
+ (void)releseAudio;

//释放音频资源 share:与其他分享 将其他音源弱化。用户后台播放
+(void)takeAudio:(BOOL)share;

//去打分
+(void)grade:(NSString*)app_id;

//相机权限判断
+(NSInteger)checkAVAuthorizationStatus;

//图片切换效果
+(void)changeImg:(UIImageView*)imgView img:(UIImage*)img duration:(float)duration type:(NSString*)type;

//获取名字的首字母、全拼等
+(NSMutableDictionary*)getLettersOfName:(NSString*)name;


//创建普通二维码
+(void)createQRCode:(NSString*)string imgView:(UIImageView*)imgView centerImg:(UIImage*)centerImg;
//-- 对图像进行清晰处理，很关键！
+(UIImage *)excludeFuzzyImageFromCIImage: (CIImage *)image size: (CGFloat)size;

//打乱数组顺序
+(NSMutableArray*)chaosArray:(NSMutableArray *)arry;

//制造个异常
+(void)makeException;


//无限播放音频  保持后台
+(void)unlimitedPlay;

//设定一个不重复的本地推送
+(void)make_A_local_notification:(NSDate*)alarmDate string:(NSString*)string;

@end
