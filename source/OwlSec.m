//
//  OwlSec.m
//  Pods
//
//  Created by Felipe Cavalcanti on 25/02/15.
//
//

#import "OwlSec.h"

@implementation OwlSec

+ (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

- (NSString *) getPassword{
    NSString * password = [SSKeychain passwordForService:@"owlService" account:@"owlPassword"];
    if(password == nil){
        //generates a 16 chars password
        password = [[OwlSec GetUUID] substringToIndex:16];
        [self persistPassword:password];
    }
    return password;
}

- (void) persistPassword :(NSString *) password{
    [SSKeychain setPassword:password forService:@"owlService" account:@"owlPassword"];
}

@end
