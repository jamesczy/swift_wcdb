//
//  Message.mm
//  WCDB_demo
//
//  Created by jamesChen on 2018/9/28.
//  Copyright © 2018年 jamesChen. All rights reserved.
//

#import "Message+WCTTableCoding.h"
#import "Message.h"
#import <WCDB/WCDB.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@implementation Message

WCDB_IMPLEMENTATION(Message)
WCDB_SYNTHESIZE(Message, messageGuid)
WCDB_SYNTHESIZE(Message, messageType)
//WCDB_SYNTHESIZE(Message, property3)
WCDB_SYNTHESIZE(Message, recipientArray)
WCDB_SYNTHESIZE(Message, createTime)
//WCDB_SYNTHESIZE_COLUMN(Message, createTime, "createTime") // Custom column name
//WCDB_SYNTHESIZE_DEFAULT(Message, createTime, 2018-9-28) // Default to WCTDefaultTypeCurrentTime, WCTDefaultTypeCurrentDate, WCTDefaultTypeCurrentTimestamp or your custom literal value

//WCDB_PRIMARY_ASC_AUTO_INCREMENT(Message, property2)
WCDB_UNIQUE(Message, messageGuid)
WCDB_NOT_NULL(Message, messageGuid)
  
@end


@interface WCDBManager()
{
    WCTDatabase *database;
}

@end


@implementation WCDBManager

+ (instancetype)shareInstance{
    static WCDBManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[WCDBManager alloc]init];
        
    });
    
    return instance;
}


- (BOOL)creatDataBaseWithName:(NSString *)tableName{
    //获取沙盒根目录
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 文件路径
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"model.sqlite"];
    NSLog(@"path = %@",filePath);
    
    database = [[WCTDatabase alloc]initWithPath:filePath];
    // 数据库加密
    //NSData *password = [@"MyPassword" dataUsingEncoding:NSASCIIStringEncoding];
    //[database setCipherKey:password];
    //测试数据库是否能够打开
    if ([database canOpen]) {
        
        // WCDB大量使用延迟初始化（Lazy initialization）的方式管理对象，因此SQLite连接会在第一次被访问时被打开。开发者不需要手动打开数据库。
        // 先判断表是不是已经存在
        if ([database isOpened]) {
            
            if ([database isTableExists:tableName]) {
                
                NSLog(@"表已经存在");
                return NO;
                
            }else
            return [database createTableAndIndexesOfName:tableName withClass:Message.class];
        }
    }
    return NO;
}
- (BOOL)insertMessage{
    Message *message = [[Message alloc] init];
    message.messageGuid = @"000001";
    message.messageType = 1;
    message.createTime  = [NSDate date];
//    message.recipientArray = [@"james","cr7"];
    
    return [database insertObject:message into:@"message"];
}

- (BOOL)deleteMessage{
    return [database deleteObjectsFromTable:@"message" where:Message.messageType == 1];
}

- (BOOL)updateMessage{
    Message *message = [[Message alloc] init];
    message.messageType = 2;
    
//    return [database updateAllRowsInTable:@"message" onProperty:Message.messageType withObject:message];
    return  [database updateRowsInTable:@"message" onProperties:Message.messageType withObject:message where:Message.messageGuid];
}

- (NSArray *)selecteMessage{
    NSArray<Message *> * message = [database getObjectsOfClass:Message.class fromTable:@"message" orderBy:Message.messageGuid.order()];
    
    return message;
}

@end
