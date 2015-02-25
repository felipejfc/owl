//
//  OwlTestsUtil.m
//  Owl
//
//  Created by Felipe Cavalcanti on 25/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import "OwlTestsUtil.h"

@implementation OwlTestsUtil

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

@end
