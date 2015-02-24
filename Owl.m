//
//  Owl.m
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import "Owl.h"
#import "OwlStorage.h"
#import "JSONModel.h"
#import "OwlModel.h"
#import <objc/runtime.h>
@implementation Owl

NSString * cryptoKey;
OwlStorage * storage;

#pragma mark - initialization methods

+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        @autoreleasepool {
            storage = [[OwlStorage alloc] init];
        }
    });
}


+(void) putWithKey :(NSString *) key andValue:(id) value{
    NSString * json = [value toJSONString];
    [storage putWithKey:key value:json];
}

+(id) getWithKey :(NSString *) key andClass:(Class) class{
    id obj = [class alloc];
    NSString * json = [storage getWithKey:key];
    NSError * error = nil;
    obj = [obj initWithString:json error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return obj;
}

+(void) checkSuperClass :(Class) class{
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if(![class isSubclassOfClass:[OwlModel class]]){
        class_setSuperclass(class, [OwlModel class]);
    }
}

+(void) putUnsafeWithKey :(NSString *)key andValue:(id) value{
    [self checkSuperClass :[value class]];
    NSString * json = [value toJSONString];
    [storage putWithKey:key value:json];
}

+(id) getUnsafeWithKey :(NSString *)key andClass:(Class) class{
    [self checkSuperClass :class];
    id obj = [class alloc];
    NSString * json = [storage getWithKey:key];
    NSError * error = nil;
    obj = [obj initWithString:json error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return obj;
    
}

@end
