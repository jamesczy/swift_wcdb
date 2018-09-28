//
//  Message+WCTTableCoding.h
//  WCDB_demo
//
//  Created by jamesChen on 2018/9/28.
//  Copyright © 2018年 jamesChen. All rights reserved.
//

#import "Message.h"
#import <WCDB/WCDB.h>

@interface Message (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(messageGuid)
WCDB_PROPERTY(messageType)
//WCDB_PROPERTY(property3)
WCDB_PROPERTY(recipientArray)
WCDB_PROPERTY(createTime)

@end
