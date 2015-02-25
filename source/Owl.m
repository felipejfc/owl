/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "Owl.h"
#import "OwlStorage.h"
#import "OwlEncryption.h"
#import <objc/runtime.h>
#import "AutoCoding/AutoCoding.h"

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

+(void) putWithKey :(NSString *) key andValue:(NSObject *) value{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:value];
    NSData * encryptedData = [owlCrypto encrypt:data withPassword:cryptoKey];
    [owlStorage putWithKey:key value:encryptedData];
}

+(id) getWithKey :(NSString *) key{
    NSData * data = [owlCrypto decryptData:[owlStorage getWithKey:key] withPassword:cryptoKey];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return obj;
}

+(void) removeWithKey :(NSString *) key{
    [owlStorage removeWithKey:key];
}

+(bool) containsKey :(NSString *) key{
    return [owlStorage containsKey:key];
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
