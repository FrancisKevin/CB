//
//  ViewController.h
//  CBCoreData
//
//  Created by xychen on 14-10-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface ViewController : UIViewController

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSMutableArray *dataArray;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) IBOutlet UITextField *tfSex;
@property (strong, nonatomic) IBOutlet UITextField *tfName;
@property (strong, nonatomic) IBOutlet UITextField *tfAge;

- (IBAction)createAction:(id)sender;
- (IBAction)selectAction:(id)sender;
- (IBAction)updateAction:(id)sender;
- (IBAction)deleteAction:(id)sender;
- (IBAction)saveAction:(id)sender;
- (IBAction)addAction:(id)sender;

@end

