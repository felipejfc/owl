//
//  Owl.h
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import <Foundation/Foundation.h>
#import "OwlModel.h"

@interface Owl : NSObject

+(void) putWithKey :(NSString *) key andValue:(id) value;
+(id) getWithKey :(NSString *) key andClass:(Class) class;
+(void) putUnsafeWithKey :(NSString *)key andValue:(id) value;
+(id) getUnsafeWithKey :(NSString *)key andClass:(Class) class;
+(void) setPassword :(NSString *) password;

@end
