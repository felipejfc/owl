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
+(void) setPassword :(NSString *) password;
+(void) removeWithKey :(NSString *) key;
+(bool) containsKey :(NSString *) key;

@end
