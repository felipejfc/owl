//
//  Owl.m
//  Pods
//
//  Created by Felipe Cavalcanti on 24/02/15.
//
//

#import "Owl.h"
#import "OwlStorage.h"

@implementation Owl

NSString * cryptoKey;
OwlStorage * storage ;

+ (id)sharedInstance {
    static Owl *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        cryptoKey = @"cOg5c000t6HjnH30";
        storage = [[OwlStorage alloc] init];
    }
    return self;
}

- (instancetype)initWithCryptoKey: (NSString*) key{
    self = [super init];
    if (self) {
        cryptoKey = key;
        storage = [[OwlStorage alloc] init];
    }
    return self;
}

-(void) putWithKey :(NSString *) key andValue:(id) value{
//    
    NSArray * toSave = [NSArray arrayWithObject:value];
    if([NSJSONSerialization isValidJSONObject:[toSave ]]){
        NSError *error = nil;
        NSData * data = [NSJSONSerialization dataWithJSONObject:toSave options:NSJSONWritingPrettyPrinted error:&error];
        if(error){
            NSLog(@"%@",[error description]);
        }
        [storage putWithKey:key value:data];
    NSData * dataToSave = [NSKeyedArchiver archivedDataWithRootObject:value];
    [storage putWithKey:key value:dataToSave];
    }else{
        NSLog(@"This object cannot be converted to JSON!");
    }
}

-(id) getWithKey :(NSString *) key{
    NSData * data = [storage getWithKey:key];
    NSError * error;
    id ret = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//    id ret = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return ret[0];
}
@end
