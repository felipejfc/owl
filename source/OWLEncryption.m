/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OWLEncryption.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"

@implementation OWLEncryption

//encryptData
NSData * fhsuadhfksd(NSData * data, NSData *password){
    NSError * error = nil;
    NSData * encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings encryptionKey:password HMACKey:nil error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return encryptedData;
}

//decryptData
NSData * fhauewgfhku(NSData * data, NSData* password){
    NSError * error = nil;
    NSData* decryptedData = [RNDecryptor decryptData:data withSettings:kRNCryptorAES256Settings encryptionKey:password HMACKey:nil error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return decryptedData;
}

@end
