//
//  Dog.h
//  CBCoreData
//
//  Created by xychen on 14-10-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dog : NSManagedObject

@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end
