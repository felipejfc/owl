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
OwlStorage * owlStorage;
OwlEncryption * owlCrypto;

#pragma mark - initialization methods

+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        @autoreleasepool {
            owlStorage = [[OwlStorage alloc] init];
            owlCrypto = [[OwlEncryption alloc] init];
            cryptoKey = @"2c)2zW!YS:i9(zlq";
        }
    });
}
//TODO put and get JSONSerializables
+(void) putWithKey :(NSString *) key andValue:(id) value{
    if(![[value class] isSubclassOfClass:[OwlModel class]]){
        NSArray * arr = [NSArray arrayWithObjects:value,nil];
        if ([NSJSONSerialization isValidJSONObject:arr]){
            NSError * error = nil;
            NSData * json = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
            if(!error){
                NSData * encryptedData = [owlCrypto encrypt:[[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding] withPassword:cryptoKey];
                [owlStorage putWithKey:key value:encryptedData];
            }else{
                NSLog(@"%@",[error description]);
            }
        }
    }else{
        NSData * data = [owlCrypto encrypt:[value toJSONString] withPassword:cryptoKey];
        [owlStorage putWithKey:key value:data];
    }
}

+(id) getWithKey :(NSString *) key andClass:(Class) class{
    id obj = [class alloc];
    if(![class isSubclassOfClass:[OwlModel class]]){
        NSString *json = [owlCrypto decryptData:[owlStorage getWithKey:key] withPassword:cryptoKey];
        NSError * error = nil;
        id obj = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        if(!error){
            return obj[0];
        }else{
            NSLog(@"%@", [error description]);
            return NULL;
        }
    }
    NSString * json = [owlCrypto decryptData:[owlStorage getWithKey:key] withPassword:cryptoKey];
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
