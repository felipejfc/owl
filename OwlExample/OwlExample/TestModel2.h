//
//  TestModel2.h
//  OwlExample
//
//  Created by Felipe Cavalcanti on 24/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwlModel.h"
#import "TestModel3.h"

@interface TestModel2 : OwlModel
@property(nonatomic, strong) NSString *aSrt;
@property(nonatomic, strong) TestModel3 *model;
@property(nonatomic) int num;

@end
