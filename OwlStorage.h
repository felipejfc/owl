//
//  OwlStorage.h
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import <Foundation/Foundation.h>

@interface OwlStorage : NSObject

- (void) putWithKey :(NSString*) key value:(id)value;
- (id) getWithKey:(NSString *) key;

@end
