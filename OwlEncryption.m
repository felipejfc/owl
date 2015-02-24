//
//  OwlEncryption.m
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import "OwlEncryption.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"

@implementation OwlEncryption

- (NSData *) encrypt :(NSString *) data withPassword:(NSString *) password{
    NSError * error = nil;
    NSData *encryptedData = [RNEncryptor encryptData:[data dataUsingEncoding:NSUTF8StringEncoding] withSettings:kRNCryptorAES256Settings password:password error:&error];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return encryptedData;
}

- (NSString *) decryptData :(NSData *) data withPassword:(NSString *) password{
    NSError * error = nil;
    NSData* decryptedData = [RNDecryptor decryptData:data withPassword:password error:&error];
    NSString* decryptedStr = [[NSString alloc]initWithData:decryptedData encoding:NSUTF8StringEncoding];
    if(error){
        NSLog(@"%@",[error description]);
    }
    return decryptedStr;
}

@end
