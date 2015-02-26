//
//  OwlSec.m
//  Pods
//
//  Created by Felipe Cavalcanti on 25/02/15.
//
//

#import "OwlSec.h"

@implementation OwlSec

+ (NSString *)generatePassword
{
    uint8_t rBytes[16];
    SecRandomCopyBytes(kSecRandomDefault, 16, rBytes);
    return [[NSString alloc] initWithBytes:rBytes length:16 encoding:NSASCIIStringEncoding];
}

- (NSString *) getPassword{
    NSString * password = [SSKeychain passwordForService:@"owlService" account:@"p"];
    if(password == nil){
        password = [OwlSec generatePassword];
        [self persistPassword:password];
    }
    return password;
}

- (void) persistPassword :(NSString *) password{
    [SSKeychain setPassword:password forService:@"owlService" account:@"p"];
}

@end
