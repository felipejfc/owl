/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

@interface OwlEncryption : NSObject

- (NSData *) encrypt :(NSData *) data withPassword:(NSString *) password;
- (NSData *) decryptData :(NSData *) data withPassword:(NSString *) password;

@end
