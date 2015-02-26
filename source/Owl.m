/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "Owl.h"
#import "OWLStorage.h"
#import "OWLEncryption.h"
#import "OWLSec.h"
#import "GZIP.h"
#import <objc/runtime.h>
#import "AutoCoding/AutoCoding.h"

@implementation Owl

NSString * cryptoKey;
OWLStorage * owlStorage;
OWLEncryption * owlCrypto;
OWLSec * owlSec;
#pragma mark - initialization methods

+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        @autoreleasepool {
            owlStorage = [[OWLStorage alloc] init];
            owlCrypto = [[OWLEncryption alloc] init];
            owlSec = [[OWLSec alloc] init];
            cryptoKey = [owlSec getPassword];
        }
    });
}

+(void) putObject :(NSObject *) object withKey:(NSString *) key{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
    data = [data gzippedData];
    NSData * encryptedData = [owlCrypto encryptData:data withPassword:cryptoKey];
    [owlStorage putObject:encryptedData withKey:key];
}

+(id) getObjectWithKey :(NSString *) key{
    NSData * data = [owlCrypto decryptData:[owlStorage getObjectWithKey:key] withPassword:cryptoKey];
    data = [data gunzippedData];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return obj;
}

+(void) removeObjectWithKey :(NSString *) key{
    [owlStorage removeObjectWithKey:key];
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
