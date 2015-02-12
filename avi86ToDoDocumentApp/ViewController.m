//
//  ViewController.m
//  avi86ToDoDocumentApp

//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"
#import "TodoItem.h"

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addItemButton.enabled = YES;
    self.removeItemButton.enabled = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.headerText.delegate = self;
    self.toDoList = [TodoList new];
    self.theItem = [TodoItem new];
    
   
}

-(void)controlTextDidChange:(NSNotification *)obj{
    
    
    NSInteger row = [self.tableView selectedRow];
    
    NSTableColumn *column = [self.tableView tableColumnWithIdentifier:@"Cell"];
    
    NSCell *cell = [column dataCellForRow:row];
    
  //  [self.toDoList setValue:self.headerText.stringValue forKey:[cell stringValue]];
    
//    NSUInteger idx = [self.toDoList getItemByIndex:<#(NSInteger)#>:[cell stringValue]];
    
    NSLog(@"%@", self.headerText.stringValue );
    
    [self.tableView reloadData];
    
}

- (void)tableView:(NSTableView *)tableView
mouseDownInHeaderOfTableColumn:(NSTableColumn *)tableColumn{
    
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    [self.tableView reloadData];

    // Update the view, if already loaded.
}


- (IBAction)addButtonClicked:(id)sender {
    
    TodoItem *item = [TodoItem new];
    item.name = @"New Item";
   // item.name = @"New Item";
    [self.toDoList addItem:item];
    [self.tableView reloadData];
    
    self.headerText.stringValue = item.name;
    
    NSLog(@"Item %ld",self.toDoList.itemCount);
    
    if(self.toDoList.itemCount > 0){
        self.removeItemButton.enabled = YES;
    }
    
}


- (IBAction)removeButtonClicked:(id)sender {
    
    TodoItem *itemToRemove = [TodoItem new];
    
    itemToRemove.name = self.headerText.stringValue;
    
    NSLog(@"Item remove %@", itemToRemove.name);
    
    [self.toDoList removeItem:itemToRemove];
    [self.tableView reloadData];
    
    if(self.toDoList.itemCount == 0){
        self.removeItemButton.enabled = NO;
    }
    
   
    
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"Cell" owner:nil];
    
    cell.textField.stringValue = [self.toDoList getItemByIndex:row].name;
   
    return cell;
    
    
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.toDoList itemCount];
    
}

@end
