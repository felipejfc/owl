/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OwlStorage.h"

@implementation OwlStorage

- (void) putWithKey :(NSString*) key value:(id)value{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (id) getWithKey:(NSString *) key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

- (void) removeWithKey :(NSString *) key{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL) containsKey :(NSString *) key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key] != nil;
}

@end
