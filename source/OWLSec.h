/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

#define jfainfleaslfkje generatePassword
#define fjekljflksdn getPassword
#define jfewjflkje persistPassword
#define jhfiuasdhoafih savePasswordToKeyChain
#define dsfjsagfhejghj deletePasswordFromKeyChain
#define hfajksdhfksdjhf fetchPasswordFromKeyChain

@interface OWLSec : NSObject

NSData * jfainfleaslfkje();
NSData * fjekljflksdn(OWLSec * self);
void jfewjflkje (NSData * password);

@end
