//
//  Message.h
//  WCDB_demo
//
//  Created by jamesChen on 2018/9/28.
//  Copyright © 2018年 jamesChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(nonatomic, retain) NSString *messageGuid;
@property(nonatomic, assign) NSInteger messageType;
//@property(nonatomic, assign) float property3;
@property(nonatomic, retain) NSArray *recipientArray;
@property(nonatomic, retain) NSDate *createTime;

@end


@interface WCDBManager : NSObject

+ (instancetype)shareInstance;

-(BOOL)creatDataBaseWithName:(NSString*)tableName;

-(BOOL)insertMessage;

-(BOOL)deleteMessage;

-(BOOL)updateMessage;

-(NSArray *)selecteMessage;

@end
