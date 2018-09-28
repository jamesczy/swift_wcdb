/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <WCDB/WCTChainCall.h>

/**
 Not Thread-safe
 */
@interface WCTUpdate : WCTChainCall

/**
 @brief WINQ interface for SQL.
 @param condition condition
 @return self
 */
- (instancetype)where:(const WCTCondition &)condition;

/**
 @brief WINQ interface for SQL.
 @param orderList order list
 @return self
 */
- (instancetype)orderBy:(const WCTOrderByList &)orderList;

/**
 @brief WINQ interface for SQL.
 @param limit limit
 @return self
 */
- (instancetype)limit:(const WCTLimit &)limit;

/**
 @brief WINQ interface for SQL.
 @param offset offset
 @return self
 */
- (instancetype)offset:(const WCTOffset &)offset;

/**
 @brief Execute the update SQL with objects.
 @param object Template object to be used to update table. 
 @return YES if no error occurs. See [error] also.
 */
- (BOOL)executeWithObject:(WCTObject *)object;

/**
 @brief Execute the update SQL with objects.
 @param row Template row to be used to update table
 @return YES if no error occurs. See [error] also.
 */
- (BOOL)executeWithRow:(WCTOneRow *)row;

/**
 @brief It should be called after executing successfully
 @return the number of changes in the most recent call
 */
- (int)changes;

@end
