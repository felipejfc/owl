/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#define fhsuadhfksd encryptData
#define fhauewgfhku decryptData
@interface OWLEncryption : NSObject

NSData * fhsuadhfksd(NSData * data, NSData *password);
NSData * fhauewgfhku(NSData * data, NSData* password);

@end
