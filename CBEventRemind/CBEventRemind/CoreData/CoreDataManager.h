//
//  CoreDataManager.h
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;//管理对象，上下文，持久性存储模型对象
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;//被管理的数据模型，数据结构
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persisTentStoreCoordinator;//连接数据库的
//@property (strong, nonatomic) NSManagedObject// 被管理的数据记录
//@property (strong, nonatomic) NSFetchRequest// 数据请求
//@property (strong, nonatomic) NSEntityDescription// 表实体结构

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

// 插入数据
- (void)insertCoreData:(NSMutableArray *)dataArray;
// 查询
- (NSMutableArray *)selectData:(int)pageSize andOffset:(int)currentPage;
// 删除
- (void)deleteData;
// 更新
- (void)updateData:(NSString *)itemID withIsLook:(NSString *)islook;

@end
