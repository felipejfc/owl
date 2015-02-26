/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OwlSec.h"

@implementation OWLSec

NSString * generatePassword()
{
    uint8_t rBytes[16];
    SecRandomCopyBytes(kSecRandomDefault, 16, rBytes);
    return [[NSString alloc] initWithBytes:rBytes length:16 encoding:NSASCIIStringEncoding];
}

NSString * getPassword(OWLSec * self){
    NSString * password = [SSKeychain passwordForService:@"owlService" account:@"p"];
    if(password == nil){
        password = generatePassword();
        persistPassword(password);
    }
    return password;
}

void persistPassword (NSString * password){
    [SSKeychain setPassword:password forService:@"owlService" account:@"p"];
}

@end
