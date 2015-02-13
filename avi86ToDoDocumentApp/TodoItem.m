//
//  TodoItem.m
//  avi86ToDoDocumentApp
//
//  Copyright (c) 2015 Avishek. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem



+(instancetype)TodoItemName:(NSString*)name forText: (NSString *)text
{
    //no need super init since init takes care of it
    TodoItem *object = [[self alloc] init];
    object.name = name;
    object.textArea = text;
    return object;
}


//called when saving
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"itemsName"];
    [aCoder encodeObject:self.textArea forKey:@"itemsText"];
}

//called when loading
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if(self){
        
        self.name = [aDecoder decodeObjectForKey:@"itemsName"];
        self.textArea = [aDecoder decodeObjectForKey:@"itemsText"];
        
    }
    
    return self;
}

@end
