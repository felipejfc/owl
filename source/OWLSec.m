/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OwlSec.h"
@implementation OWLSec

//generatePassword
NSData * owlGeneratePassword()
{
    uint8_t rBytes[16];
    SecRandomCopyBytes(kSecRandomDefault, 16, rBytes);
    return [NSData dataWithBytes:rBytes length:16];
}

//getPassword
NSData * owlGetPassword(OWLSec * self){
    NSData * password = owlFetchPasswordFromKeyChain();
    if(password == nil){
        password = owlGeneratePassword();
        owlPersistPassword(password);
    }
    return password;
}

//persistPassword
void owlPersistPassword (NSData * password){
    owlSavePasswordToKeyChain(password);
}

//savePasswordToKeyChain
BOOL jhfiuasdhoafih(NSData* password) {
    OSStatus status = -1001;

    owlDeletePasswordFromKeyChain();
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"owlService", kSecAttrService, @"p", kSecAttrAccount, password, kSecValueData , nil];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];

    status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    
    return (status == errSecSuccess);
}

//deletePasswordFromKeyChain
BOOL dsfjsagfhejghj() {
    OSStatus status = -1001;
    
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"owlService", kSecAttrService, @"p", kSecAttrAccount, nil];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
#if TARGET_OS_IPHONE
    status = SecItemDelete((__bridge CFDictionaryRef)query);
#else
    CFTypeRef result = NULL;
    [query setObject:@YES forKey:(__bridge id)kSecReturnRef];
    status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (status == errSecSuccess) {
        status = SecKeychainItemDelete((SecKeychainItemRef)result);
        CFRelease(result);
    }
#endif
    
    return (status == errSecSuccess);
}

//fetchPasswordFromKeyChain
NSData* hfajksdhfksdjhf() {
    OSStatus status = -1001;
    
    CFTypeRef result = NULL;
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"owlService", kSecAttrService, @"p", kSecAttrAccount, nil];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [query setObject:@YES forKey:(__bridge id)kSecReturnData];
    [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    return (__bridge_transfer NSData *)result;
}

@end
