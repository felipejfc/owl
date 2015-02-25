//
//  OwlTests.m
//  OwlExample
//
//  Created by Felipe Cavalcanti on 25/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import "Owl.h"
#import "OwlTestsUtil.h"
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(OwlTests)

describe(@"all tests", ^{
    
    __block NSString * key;
    
    beforeAll(^{
       key = @"testKey";
    });
    
    beforeEach(^{
        [Owl setPassword:[OwlTestsUtil randomStringWithLength:32]];
        [Owl removeWithKey:key];
    });
    
    describe(@"persist NSWrappers test", ^{

        it(@"can persist NSString", ^{
            [Owl putWithKey:key andValue:@"hello!"];
            expect([Owl getWithKey:key andClass:[NSString class]]).equal(@"hello!");
        });
        
        it(@"can persist NSNumber", ^{
            [Owl putWithKey:key andValue:[NSNumber numberWithDouble:3.3f]];
            expect([Owl getWithKey:key andClass:[NSString class]]).equal([NSNumber numberWithDouble:3.3f]);
        });

        it(@"can persist NSArray", ^{
            [Owl putWithKey:key andValue:[NSArray arrayWithObjects:@"object1", @"object2", [NSNumber numberWithInt:1],nil]];
            NSArray * arr = [Owl getWithKey:key andClass:[NSArray class]];
            expect(arr[0]).equal(@"object1");
            expect(arr[1]).equal(@"object2");
            expect([(NSNumber *)arr[2] integerValue]).equal(1);
        });

        it(@"can persist NSDictionary", ^{
            [Owl putWithKey:key andValue:[NSDictionary dictionaryWithObjectsAndKeys:@"object1", @"key1", nil]];
            NSDictionary * myDict = [Owl getWithKey:key andClass:[NSDictionary class]];
            expect([myDict objectForKey:@"key1"]).equal(@"object1");
        });

        it(@"can persist nested objects", ^{
            NSArray * myArr = [NSArray arrayWithObjects:@"object1", @"object2", [NSNumber numberWithInt:1], nil];
            NSDictionary * myDict = [NSDictionary dictionaryWithObjectsAndKeys:myArr, @"key1", nil];
            [Owl putWithKey:key andValue:myDict];
            NSDictionary * dict = [Owl getWithKey:key andClass:[NSDictionary class]];
            NSArray * arr = [dict objectForKey:@"key1"];
            expect(arr[0]).equal(@"object1");
        });

        
    });
    
    describe(@"contains tests", ^{
        
        it(@"contains returns", <#^(void)block#>)
        
    });
    
    describe(@"remove tests", ^{
        
    });
    
    describe(@"persist subclasses of OwlmMdel", ^{
        
    });
    
    describe(@"encryption tests", ^{
    });

});

SpecEnd