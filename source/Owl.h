/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

@interface Owl : NSObject

+(void) putWithKey :(NSString *) key andValue:(id) value;
+(id) getWithKey :(NSString *) key;
+(void) setPassword :(NSString *) password;
+(void) removeWithKey :(NSString *) key;
+(bool) containsKey :(NSString *) key;

@end
