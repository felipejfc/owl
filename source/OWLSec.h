/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

#define owlGeneratePassword jfainfleaslfkje
#define owlGetPassword fjekljflksdn
#define owlPersistPassword jfewjflkje
#define owlSavePasswordToKeyChain jhfiuasdhoafih
#define owlDeletePasswordFromKeyChain dsfjsagfhejghj
#define owlFetchPasswordFromKeyChain hfajksdhfksdjhf

@interface OWLSec : NSObject

NSData * owlGeneratePassword();
NSData * owlGetPassword(OWLSec * self);
void owlPersistPassword (NSData * password);

@end
