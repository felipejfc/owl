//
//  Owl.h
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import <Foundation/Foundation.h>

@interface Owl : NSObject
+ (id)sharedInstance;
-(void) putWithKey :(NSString *) key andValue:(id) value;
-(id) getWithKey :(NSString *) key;

@end
