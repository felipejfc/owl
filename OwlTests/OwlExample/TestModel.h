//
//  TestModel.h
//  OwlExample
//
//  Created by Felipe Cavalcanti on 24/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestModel2.h"

@interface TestModel : NSObject
@property(nonatomic, strong) NSString *aSrt;
@property(nonatomic, strong) TestModel2 *model;
@property(nonatomic) int num;

@end
