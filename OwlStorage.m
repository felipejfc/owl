//
//  OwlStorage.m
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import "OwlStorage.h"

@implementation OwlStorage

- (void) putWithKey :(NSString*) key value:(id)value{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
}

- (id) getWithKey:(NSString *) key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

@end
