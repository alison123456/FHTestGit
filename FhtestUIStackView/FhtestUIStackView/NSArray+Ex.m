//
//  NSArray+Ex.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/23.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "NSArray+Ex.h"
#import <objc/runtime.h>
static char *addNameStringKey = "addNameKey";
/**
如果属性定义在分类的m文件中，则只需要通过写一个get方法即可
@interface NSArray ()
@property(copy,nonatomic) NSString *addNameString;
@end**/

@implementation NSArray (Ex)
+(void)load{
    Method fromMethod = class_getClassMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NASrrayI"), @selector(em_objectAtIndex:));
    method_exchangeImplementations(fromMethod,toMethod);
}

-(void)em_objectAtIndex:(NSUInteger)index{
    if(self.count -1 <index){
        @try{
            return [self em_objectAtIndex:index];
        }
        @catch(NSException *exception){
            
        }
        @finally{}
    }
    else{
        return [self em_objectAtIndex:index];
    }
}


//-(NSString *)addNameString{
//    NSString *tmpStr = objc_getAssociatedObject(self, addNameStringKey);
//    if(!tmpStr){
//        tmpStr = [NSString string];
//        objc_setAssociatedObject(self, addNameStringKey, tmpStr, OBJC_ASSOCIATION_COPY_NONATOMIC)
//    }
//    return tmpStr;
//}


-(void)setAddNameString:(NSString *)addNameString{
    objc_setAssociatedObject(self, addNameStringKey, addNameString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)addNameString{
    return objc_getAssociatedObject(self, addNameStringKey);
}
@end
