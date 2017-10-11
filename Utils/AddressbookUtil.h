//
//  AddressbookUtil.h
//  zpp
//
//  Created by Chuck on 2017/8/3.
//  Copyright © 2017年 myncic.com. All rights reserved. 通讯录管理
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "APPUtils.h"

@class AddressbookUtil;

static AddressbookUtil *addressBook;

@interface AddressbookUtil : NSObject<CNContactPickerDelegate>{
    
    
    
    
    

}


+ (AddressbookUtil*)book;
//获取单个联系人
-(void)getOneContact;

typedef void (^AddressBookBlock)(NSString *name,NSString*phone);
@property (nonatomic,strong)AddressBookBlock callBackBlock;



//获取通讯录读取权限
+(BOOL)getReadContactsBookPermission;

//存入本地联系人
+(void)saveUser2PhoneBook:(NSString*)saveName saveTel:(NSString*)saveTel saveIcon:(UIImage*)saveIcon;

//检索联系人
+(BOOL)checkContactExist:(NSString*)name;

//打包联系人联系人到SD01
+(NSString*)getContacts;
@end
