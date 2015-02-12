//
//  ViewController.h
//  avi86ToDoDocumentApp

//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTableViewDelegate,NSTableViewDataSource ,NSTextFieldDelegate >

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSButton *addItemButton;
@property (weak) IBOutlet NSButton *removeItemButton;
@property (weak) IBOutlet NSTextField *headerText;
@property (weak) IBOutlet NSTextField *bodyText;
@property (strong) IBOutlet TodoList *toDoList;
@property (strong) IBOutlet TodoItem *theItem;

@end

