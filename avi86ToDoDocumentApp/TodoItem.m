//
//  TodoItem.m
//  avi86ToDoDocumentApp
//
//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem



+(instancetype)TodoItemName:(NSString*)name
{
    //no need super init since init takes care of it
    TodoItem *object = [[self alloc] init];
    object.name = name;
    return object;
}


//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"itemsName"];
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self){
        
        self.name = [aDecoder decodeObjectForKey:@"itemsName"];
        
    }
    
    return self;
}

@end
