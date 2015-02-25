//
//  OwlEncryption.h
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

@interface OwlEncryption : NSObject

- (NSData *) encrypt :(NSData *) data withPassword:(NSString *) password;
- (NSData *) decryptData :(NSData *) data withPassword:(NSString *) password;

@end
