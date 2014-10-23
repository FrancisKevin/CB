//
//  ViewController.m
//  CBCoreData
//
//  Created by xychen on 14-10-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ViewController.h"

#import "Dog.h"

@interface ViewController ()

@property (strong, nonatomic) Dog *updateDog;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    // 创建一个Dog对象
    [self creatObject];
    
    // 保存
    [self saveObject];
    
    // 查询
    [self selectObject];
    
    // 更新
    [self updateObject];
    
    // 删除
    [self deleteObject];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据库操作
// 创建一个Dog对象
- (void)creatObject
{
    Dog *aDog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
    [aDog setName:@"花花"];
    [aDog setAge:@(1)];// == [aDog setAge:[NSNumber numberWithInt:1]];
    [aDog setSex:@(0)];
    
    NSError *error = nil;
    BOOL isSave = [self.managedObjectContext save:&error];
    if (!isSave)
    {
        NSLog(@"error:%@,%@", error, [error userInfo]);
    }
    else
    {
        NSLog(@"保存成功");
    }
    
    self.updateDog = aDog;
}

// 保存
- (void)saveObject
{
    NSError *error = nil;
    BOOL isSave = [self.managedObjectContext save:&error];
    if (!isSave)
    {
        NSLog(@"error:%@,%@", error, [error userInfo]);
    }
    else
    {
        NSLog(@"保存成功");
        
    }
}

// 查询
- (void)selectObject
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];// 创建取回数据请求
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];// 设置要检索哪种类型的实体对象
    [request setEntity:entity];// 设置请求实体
    
    // 指定对结果的排序方式
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    // 执行获取数据请求，返回数组
    NSError *error = nil;
    NSMutableArray *mutableFetchResult = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil)
    {
        NSLog(@"Error:%@,%@", error, [error userInfo]);
    }
    self.dataArray = mutableFetchResult;
    for (Dog *dogItem in self.dataArray)
    {
        NSLog(@"\nage:%@\nsex:%@\nname:%@", dogItem.age, dogItem.sex, dogItem.name);
    }
}

// 修改/更新
- (void)updateObject
{
    [self.updateDog setName:@"哮天犬"];
    NSError *error;
    BOOL isUpdateSuccess = [self.managedObjectContext save:&error];
    if (!isUpdateSuccess)
    {
        NSLog(@"error:%@,%@", error, [error userInfo]);
    }
    else
    {
        NSLog(@"更新成功！");
        
    }
}

// 删除
- (void)deleteObject
{
    [self.managedObjectContext deleteObject:self.updateDog];
    [self.dataArray removeObject:self.updateDog];
    NSError *error;
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"Error:%@,%@", error, [error userInfo]);
    }
    else
    {
        NSLog(@"删除成功！");
        
    }
}

#pragma mark - ButtonAction
- (IBAction)createAction:(id)sender
{
    [self creatObject];
}

- (IBAction)selectAction:(id)sender
{
    [self selectObject];
}

- (IBAction)updateAction:(id)sender
{
    [self updateObject];
}

- (IBAction)deleteAction:(id)sender
{
    [self deleteObject];
}

- (IBAction)saveAction:(id)sender
{
    [self saveObject];
}

- (IBAction)addAction:(id)sender
{
    if (![_tfAge.text isEqualToString:@""] && ![_tfName.text isEqualToString:@""] && ![_tfSex.text isEqualToString:@""])
    {
        Dog *aDog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
        [aDog setName:_tfName.text];
        [aDog setAge:[NSNumber numberWithInt:[_tfAge.text intValue]]];// == [aDog setAge:[NSNumber numberWithInt:1]];
        [aDog setSex:[NSNumber numberWithInt:[_tfSex.text intValue]]];
        
        NSError *error = nil;
        BOOL isSave = [self.managedObjectContext save:&error];
        if (!isSave)
        {
            NSLog(@"error:%@,%@", error, [error userInfo]);
        }
        else
        {
            NSLog(@"保存成功");
        }
        
        self.updateDog = aDog;
    }
    else
    {
        NSLog(@"插入数据无效");
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "CB.CBCoreData" in the application's documents directory.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSLog(@"保存路径：%@", docDir);
    
    NSURL *savePath = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    return savePath;
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CBCoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CBCoreData.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
