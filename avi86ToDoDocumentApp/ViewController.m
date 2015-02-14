//
//  ViewController.m
//  avi86ToDoDocumentApp

//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"
#import "TodoItem.h"

@implementation ViewController

NSInteger row = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addItemButton.enabled = YES;
    self.removeItemButton.enabled = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.headerText.delegate = self;
   // self.toDoList = [TodoList new];
   // self.theItem = [TodoItem new];
    
    
    
    NSLog(@"Item from view load: %ld",self.toDoList.itemCount);
    
   
}



-(void)viewDidAppear{
    [self.tableView reloadData];
//    if(self.toDoList.itemCount>0){
//        self.removeItemButton.enabled = true;
//    }
    
}

- (IBAction)textAreaAction:(id)sender {
    
    NSString *string = self.bodyText.stringValue;
    NSLog(@"body %@",string);
    TodoItem *item = [TodoItem new];
    item.name = self.headerText.stringValue;
    item.textArea = self.bodyText.stringValue;
    
    [self.toDoList replaceObject:item Index:row];
    
}


-(void)controlTextDidChange:(NSNotification *)obj{
    
   // NSUInteger row = 0;
    if(self.tableView.selectedRow >= 0){
        row = (NSUInteger)self.tableView.selectedRow;
    }
    
  
    
    NSLog(@"rows: %ld",row);
    
   // NSTableColumn *column = [self.tableView tableColumnWithIdentifier:@"Cell"];
    
   // NSCell *cell = [column dataCellForRow:row];
    
  //  [self.toDoList setValue:self.headerText.stringValue forKey:[cell stringValue]];
    
    
    NSLog(@"%@", self.headerText.stringValue );
    
    TodoItem *item = [TodoItem new];
    item.name = self.headerText.stringValue;
   // item.textArea = self.bodyText.stringValue;
    
    [self.toDoList replaceObject:item Index:row];
    
    [self.tableView reloadDataForRowIndexes:self.tableView.selectedRowIndexes columnIndexes:self.tableView.selectedColumnIndexes];
    
    [self.tableView reloadData];
    
    
    
}


-(void)tableViewSelectionDidChange:(NSNotification *)notification{
    
        if(self.toDoList.itemCount>0){
            self.removeItemButton.enabled = true;
        }
    
    row = (NSUInteger)self.tableView.selectedRow;
    TodoItem *item = [self.toDoList getItemByIndex:row];
    self.headerText.stringValue = item.name;
    self.bodyText .stringValue  = item.textArea;
   // [self.tableView reloadData];
    
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
    //item.textArea = self.bodyText.stringValue;
    
    item.textArea = self.bodyText.stringValue;

   
    [self.toDoList addItem:item];
    [self.tableView reloadData];
    
    //self.headerText.stringValue = item.name;
    
    NSLog(@"Item %ld",self.toDoList.itemCount);
    
    if(self.toDoList.itemCount > 0){
        self.removeItemButton.enabled = YES;
    }
    
}


- (IBAction)removeButtonClicked:(id)sender {
    
    TodoItem *itemToRemove = [TodoItem new];
    
    itemToRemove.name = self.headerText.stringValue;
    
    NSLog(@"Item removeeee %@", itemToRemove.name);
    
   // [self.toDoList removeItem:itemToRemove];
    [self.toDoList removeTest:(NSUInteger)row];
    [self.tableView reloadData];
    self.headerText.stringValue = @"";
    self.bodyText.stringValue = @"";
    
   // if(self.toDoList.itemCount == 0){
        self.removeItemButton.enabled = NO;
    //}
    
   
    
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
