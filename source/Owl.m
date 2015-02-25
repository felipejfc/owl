/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "Owl.h"
#import "OwlStorage.h"
#import "OwlEncryption.h"
#import "OwlSec.h"
#import "GZIP.h"
#import <objc/runtime.h>
#import "AutoCoding/AutoCoding.h"

@implementation Owl

NSString * cryptoKey;
OwlStorage * owlStorage;
OwlEncryption * owlCrypto;
OwlSec * owlSec;
#pragma mark - initialization methods

+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        @autoreleasepool {
            owlStorage = [[OwlStorage alloc] init];
            owlCrypto = [[OwlEncryption alloc] init];
            owlSec = [[OwlSec alloc] init];
            cryptoKey = [owlSec getPassword];
        }
    });
}

+(void) putWithKey :(NSString *) key andValue:(NSObject *) value{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:value];
    data = [data gzippedData];
    NSData * encryptedData = [owlCrypto encrypt:data withPassword:cryptoKey];
    [owlStorage putWithKey:key value:encryptedData];
}

+(id) getWithKey :(NSString *) key{
    NSData * data = [owlCrypto decryptData:[owlStorage getWithKey:key] withPassword:cryptoKey];
    data = [data gunzippedData];
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
