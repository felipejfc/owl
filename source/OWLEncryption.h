/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

@interface OWLEncryption : NSObject

NSData * encryptData(NSData * data, NSString *password);
NSData * decryptData(NSData * data, NSString* password);

@end
