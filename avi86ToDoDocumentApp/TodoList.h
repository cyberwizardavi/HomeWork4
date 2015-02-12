//
//  TodoList.h
//  avi86ToDoDocumentApp
//
//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoList : NSObject <NSCoding>
@property (nonatomic, readwrite) NSMutableArray *theTodoList;
@property (nonatomic, readwrite) NSString *title;


//-(instancetype)initWithTitle:(NSString*)name;
-(void)addItem:(TodoItem*)item;
-(void)removeItem:(TodoItem*)item;    // remove item
-(TodoItem*)getItemByIndex: (NSInteger)index;
-(NSInteger)itemCount; // number of items contained in list
-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;


@end

