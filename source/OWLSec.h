/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@interface OWLSec : NSObject

NSString * generatePassword();
NSString * getPassword(OWLSec * self);
void persistPassword (NSString * password);

@end
