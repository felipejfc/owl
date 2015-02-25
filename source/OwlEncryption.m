/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OwlEncryption.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"

@implementation OwlEncryption

- (NSData *) encrypt :(NSData *) data withPassword:(NSString *) password{
    NSError * error = nil;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:password error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return encryptedData;
}

- (NSData *) decryptData :(NSData *) data withPassword:(NSString *) password{
    NSError * error = nil;
    NSData* decryptedData = [RNDecryptor decryptData:data withPassword:password error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return decryptedData;
}

@end
