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
#import "TestModel.h"
#import <objc/runtime.h>

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
        
        it(@"contains returns true when the key is found", ^{
            [Owl putWithKey:key andValue:@"someval"];
            expect([Owl containsKey:key]).equal(true);
        });

        it(@"contains returns false when the key is not found", ^{
            expect([Owl containsKey:key]).equal(false);
        });
        
    });
    
    describe(@"remove tests", ^{
        
        it(@"must remove", ^{
            [Owl putWithKey:key andValue:@"someval"];
            expect([Owl containsKey:key]).equal(true);
            [Owl removeWithKey:key];
            expect([Owl containsKey:key]).equal(false);
        });

        it(@"will not raise if key is not found", ^{
            [Owl removeWithKey:key];
        });

    });
    
    describe(@"persist subclasses of OwlModel", ^{
        
        it(@"can persist a custom class that subclasses OwlModel", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setModel:[TestModel2 alloc]];
            [Owl putWithKey:key andValue:model];
            TestModel * m = [Owl getWithKey:key andClass:[TestModel class]];
            expect([m aSrt]).equal(@"some string");
        });
        
        it(@"can persist custom classes that subclasses OwlModel with primitive properties", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setNum:123];
            [model setModel:[TestModel2 alloc]];
            [Owl putWithKey:key andValue:model];
            TestModel * m = [Owl getWithKey:key andClass:[TestModel class]];
            expect([m aSrt]).equal(@"some string");
            expect([m num]).equal(123);
        });
        
        it(@"can persist nested objects of classes that subclasses OwlModel", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setNum:123];
            TestModel2 * model2 = [[TestModel2 alloc]init ];
            [model2 setNumFloat:3.33f];
            [model2 setTestBool:TRUE];
            [model setModel:model2];
            [Owl putWithKey:key andValue:model];
            TestModel * m = [Owl getWithKey:key andClass:[TestModel class]];
            expect([m aSrt]).equal(@"some string");
            expect([m num]).equal(123);
            expect([[m model] numFloat]).equal(3.33f);
            expect([[m model] testBool]).equal(TRUE);
        });
    });
    
    describe(@"encryption tests", ^{
        
        it(@"can not encrypt with one password and decrypt the valid object with another", ^{
            [Owl putWithKey:key andValue:@"someval"];
            expect([Owl getWithKey:key andClass:[NSString class]]).equal(@"someval");
            [Owl setPassword:@"aanotherPassword"];
            expect([Owl getWithKey:key andClass:[NSString class]]).notTo.equal(@"someval");
        });
        
    });

});

SpecEnd