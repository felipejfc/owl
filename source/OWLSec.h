//
//  OwlSec.h
//  Pods
//
//  Created by Felipe Cavalcanti on 25/02/15.
//
//

#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@interface OWLSec : NSObject

- (NSString *) getPassword;
- (void) persistPassword :(NSString *) password;

@end
