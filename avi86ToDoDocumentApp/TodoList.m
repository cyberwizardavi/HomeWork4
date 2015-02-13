//
//  TodoList.m
//  avi86ToDoDocumentApp
//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "TodoList.h"

@implementation TodoList

//+(instancetype)initWithTitle:(NSString*)name
//{
//    //no need super init since init takes care of it
//    TodoList *object = [[self alloc]init];
//    object.title = name;
//   return object;
//}

-(void)addItem:(TodoItem*)item {
    
        if(self.theTodoList == nil)
        {
            self.theTodoList = [[NSMutableArray alloc]init];
        }
       [self.theTodoList addObject:item];
    
    
}

-(void)removeItem:(TodoItem*)item {
    
 
//    NSUInteger idx = [self.theTodoList indexOfObject:item];
//    NSLog(@"Item count %lu", (unsigned long)self.theTodoList.count);
//    NSLog(@"Item index %lu", idx);
//     NSLog(@"Item name %@", item.name);
//
//    [self.theTodoList removeObjectAtIndex:idx];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", item.name];
    NSArray *filtered = [self.theTodoList filteredArrayUsingPredicate:predicate];
    
    
    
    
        NSUInteger idx = [self.theTodoList indexOfObject:filtered.lastObject];
        [self.theTodoList removeObjectAtIndex:idx];
    
   

}



-(NSInteger)itemCount{
    return self.theTodoList.count;
    
}

-(TodoItem*)getItemByIndex: (NSInteger)rowIndex{
    
    return [self.theTodoList objectAtIndex:(NSInteger)rowIndex];
}


//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.theTodoList forKey:@"itemsArray"];
    [aCoder encodeObject:self.title forKey:@"titleKey"];
    
     NSLog(@"Item from encoder: %ld",self.theTodoList.count);
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self){
        self.title = [aDecoder decodeObjectForKey:@"titleKey"];
        self.theTodoList = [aDecoder decodeObjectForKey:@"itemsArray"];
        
        NSLog(@"Item from decoder: %ld",self.theTodoList.count);
        
    }
    
    return self;
}

@end
