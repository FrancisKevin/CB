//
//  CoreDataManager.m
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return nil;
}

// 插入数据
- (void)insertCoreData:(NSMutableArray *)dataArray
{
    
}

// 查询
- (NSMutableArray *)selectData:(int)pageSize andOffset:(int)currentPage
{
    return nil;
}

// 删除
- (void)deleteData
{
    
}
// 更新
- (void)updateData:(NSString *)itemID withIsLook:(NSString *)islook
{
    
}

@end
