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

NSData * ck;
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
            ck = owlGetPassword(owlSec);
        }
    });
}

+(void) putObject :(NSObject *) object withKey:(NSString *) key{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
    data = [data gzippedData];
    NSData * encryptedData = owlEncryptData(data, ck);
    [owlStorage putObject:encryptedData withKey:key];
}

+(id) getObjectWithKey :(NSString *) key{
    NSData * data = owlDecryptData([owlStorage getObjectWithKey:key], ck);
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

@end
