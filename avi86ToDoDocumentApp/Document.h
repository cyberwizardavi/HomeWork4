//
//  Document.h
//  avi86ToDoDocumentApp

//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"
#import "TodoItem.h"

@interface Document : NSDocument

@property (strong) IBOutlet TodoList *_toDoList;


@end

