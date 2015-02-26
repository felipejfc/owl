/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import "OwlStorage.h"

@implementation OWLStorage

- (void) putObject: (NSObject*) object withKey:(NSString*) key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}
- (id) getObjectWithKey:(NSString *) key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

- (void) removeObjectWithKey :(NSString *) key{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

- (BOOL) containsKey :(NSString *) key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key] != nil;
}

@end
