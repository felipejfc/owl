/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#define owlEncryptData fhsuadhfksd
#define owlDecryptData fhauewgfhku
@interface OWLEncryption : NSObject

NSData * owlEncryptData(NSData * data, NSData *password);
NSData * owlDecryptData(NSData * data, NSData* password);

@end
