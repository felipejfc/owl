/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

@interface OwlStorage : NSObject

- (void) putWithKey :(NSString*) key value:(id)value;
- (id) getWithKey:(NSString *) key;
- (void) removeWithKey :(NSString *) key;
- (BOOL) containsKey :(NSString *) key;

@end
