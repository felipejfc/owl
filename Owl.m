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
#import "OwlEncryption.h"
#import <objc/runtime.h>

@implementation Owl

NSString * cryptoKey;
OwlStorage * storage;
OwlEncryption * encryption;

#pragma mark - initialization methods

+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        @autoreleasepool {
            storage = [[OwlStorage alloc] init];
            encryption = [[OwlEncryption alloc] init];
            cryptoKey = @"2c)2zW!YS:i9(zlq";
        }
    });
}

+(void) putWithKey :(NSString *) key andValue:(id) value{
    NSData * data = [encryption encrypt:[value toJSONString] withPassword:cryptoKey];
    [storage putWithKey:key value:data];
}

+(id) getWithKey :(NSString *) key andClass:(Class) class{
    id obj = [class alloc];
    NSString * json = [encryption decryptData:[storage getWithKey:key] withPassword:cryptoKey];
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

+(void) setPassword :(NSString *) password{
    unsigned long len = [password length];
    if(len != 16 && len != 24 && len !=32){
        NSLog(@"Owl: Password must have 16, 24 or 32 characters");
        return;
    }
    cryptoKey = password;
}

@end
