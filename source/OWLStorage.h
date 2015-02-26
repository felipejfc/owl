/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

@interface OWLStorage : NSObject

- (void) putObject :(NSObject *) object withKey:(NSString *)key;
- (id) getObjectWithKey:(NSString *) key;
- (void) removeObjectWithKey :(NSString *) key;
- (BOOL) containsKey :(NSString *) key;

@end
