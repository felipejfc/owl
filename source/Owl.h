/*
 Copyright (c) 2015 Felipe Cavalcanti
 See the file LICENSE for copying permission.
 */

#import <Foundation/Foundation.h>

@interface Owl : NSObject

+(void) putObject :(NSObject *) object withKey:(NSString *) key;
+(id) getObjectWithKey :(NSString *) key;
+(void) setPassword :(NSString *) password;
+(void) removeObjectWithKey :(NSString *) key;
+(bool) containsKey :(NSString *) key;

@end
