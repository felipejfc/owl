/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OWLEncryption.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"

@implementation OWLEncryption

NSData * owlEncryptData(NSData * data, NSData *password){
    NSError * error = nil;
    NSData * encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings encryptionKey:password HMACKey:nil error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return encryptedData;
}

NSData * owlDecryptData(NSData * data, NSData* password){
    NSError * error = nil;
    NSData* decryptedData = [RNDecryptor decryptData:data withSettings:kRNCryptorAES256Settings encryptionKey:password HMACKey:nil error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return decryptedData;
}

@end
