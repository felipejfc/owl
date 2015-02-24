//
//  OwlEncryption.h
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

@interface OwlEncryption : NSObject

- (NSData *) encrypt :(NSString *) data withPassword:(NSString *) password;
- (NSString *) decryptData :(NSData *) data withPassword:(NSString *) password;

@end
