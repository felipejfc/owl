/*
Copyright (c) 2015 Felipe Cavalcanti
See the file LICENSE for copying permission.
*/

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
        [Owl removeObjectWithKey:key];
    });
    
    describe(@"persist NSWrappers test", ^{

        it(@"can persist NSString", ^{
            [Owl putObject:@"hello!" withKey:key];
            expect([Owl getObjectWithKey:key]).equal(@"hello!");
        });
        
        it(@"can persist NSNumber", ^{
            [Owl putObject:[NSNumber numberWithDouble:3.3f] withKey:key];
            expect([Owl getObjectWithKey:key]).equal([NSNumber numberWithDouble:3.3f]);
        });

        it(@"can persist NSArray", ^{
            [Owl putObject:[NSArray arrayWithObjects:@"object1", @"object2", [NSNumber numberWithInt:1],nil] withKey:key];
            NSArray * arr = [Owl getObjectWithKey:key];
            expect(arr[0]).equal(@"object1");
            expect(arr[1]).equal(@"object2");
            expect([(NSNumber *)arr[2] integerValue]).equal(1);
        });

        it(@"can persist NSDictionary", ^{
            [Owl putObject:[NSDictionary dictionaryWithObjectsAndKeys:@"object1", @"key1", nil] withKey:key];
            NSDictionary * myDict = [Owl getObjectWithKey:key];
            expect([myDict objectForKey:@"key1"]).equal(@"object1");
        });

        it(@"can persist nested objects", ^{
            NSArray * myArr = [NSArray arrayWithObjects:@"object1", @"object2", [NSNumber numberWithInt:1], nil];
            NSDictionary * myDict = [NSDictionary dictionaryWithObjectsAndKeys:myArr, @"key1", nil];
            [Owl putObject:myDict withKey:key];
            NSDictionary * dict = [Owl getObjectWithKey:key];
            NSArray * arr = [dict objectForKey:@"key1"];
            expect(arr[0]).equal(@"object1");
        });
                
    });
    
    describe(@"array of objects tests", ^{
       
        it(@"can persist arrays of objects", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"test"];
            TestModel * model2 = [[TestModel alloc] init];
            [model2 setNum:123];
            [model2 setASrt:@"test"];
            NSArray * arr = [NSArray arrayWithObjects:model, model2, nil];
            [Owl putObject:arr withKey:key];
            NSArray * arr2 = [Owl getObjectWithKey:key];
            expect([arr2[0] aSrt]).equal(@"test");
            expect([arr2[1] num]).equal(123);
        });
        
    });
    
    describe(@"contains tests", ^{
        
        it(@"contains returns true when the key is found", ^{
            [Owl putObject:@"someval" withKey:key];
            expect([Owl containsKey:key]).equal(true);
        });

        it(@"contains returns false when the key is not found", ^{
            expect([Owl containsKey:key]).equal(false);
        });
        
    });
    
    describe(@"remove tests", ^{
        
        it(@"must remove", ^{
            [Owl putObject:@"someval" withKey:key];
            expect([Owl containsKey:key]).equal(true);
            [Owl removeObjectWithKey:key];
            expect([Owl containsKey:key]).equal(false);
        });

        it(@"will not raise if key is not found", ^{
            [Owl removeObjectWithKey:key];
        });

    });
    
    describe(@"persist custom classes", ^{
        
        it(@"can persist a custom class", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setModel:[TestModel2 alloc]];
            [Owl putObject:model withKey:key];
            TestModel * m = [Owl getObjectWithKey:key];
            expect([m aSrt]).equal(@"some string");
        });
        
        it(@"can persist custom class with primitive properties", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setNum:123];
            [model setModel:[TestModel2 alloc]];
            [Owl putObject:model withKey:key];
            TestModel * m = [Owl getObjectWithKey:key];
            expect([m aSrt]).equal(@"some string");
            expect([m num]).equal(123);
        });
        
        it(@"can persist nested objects of classes", ^{
            TestModel * model = [[TestModel alloc] init];
            [model setASrt:@"some string"];
            [model setNum:123];
            TestModel2 * model2 = [[TestModel2 alloc]init ];
            [model2 setNumFloat:3.33f];
            [model2 setTestBool:TRUE];
            [model setModel:model2];
            [Owl putObject:model withKey:key];
            TestModel * m = [Owl getObjectWithKey:key];
            expect([m aSrt]).equal(@"some string");
            expect([m num]).equal(123);
            expect([[m model] numFloat]).equal(3.33f);
            expect([[m model] testBool]).equal(TRUE);
        });
    });
    
    describe(@"encryption tests", ^{
        
        it(@"can not encrypt with one password and decrypt the valid object with another", ^{
            [Owl putObject:@"someval" withKey:key];
            expect([Owl getObjectWithKey:key]).equal(@"someval");
            [Owl setPassword:@"aanotherPassword"];
            expect([Owl getObjectWithKey:key]).notTo.equal(@"someval");
        });
        
    });

});

SpecEnd