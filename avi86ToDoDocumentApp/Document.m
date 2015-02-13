//
//  Document.m
//  avi86ToDoDocumentApp

//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "Document.h"
#import "TodoList.h"
#import "TodoItem.h"
#import "ViewController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self._toDoList = [TodoList new];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    
   ViewController *vc = (ViewController *)wc.contentViewController;
    vc.toDoList = self._toDoList;
    NSLog(@"Item from makeWindowControllers : %ld",vc.toDoList.itemCount);
    
    [self addWindowController:wc];
    
   // ((ViewController*)wc.contentViewController).toDoList = self._toDoList;
    
    
}



//saving
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    
  
     NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self._toDoList];
     NSLog(@"Item from save %ld",self._toDoList.itemCount);
    return data;
    
   
   
}


//loading
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if([object isKindOfClass:[TodoList class]])
    {
        self._toDoList = object;
        
         NSLog(@"Item from load %ld",self._toDoList.itemCount);
        return YES;
    }
    return NO;
}

@end
