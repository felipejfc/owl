//
//  ViewController.m
//  OwlExample
//
//  Created by Felipe Cavalcanti on 24/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import "ViewController.h"
#import "Owl.h"
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize toSaveField;
@synthesize toLoadSafeTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    TestModel * model = [[TestModel alloc] init];
    [model setASrt:[toSaveField text]];
    [model setNum:3000];
    
    TestModel2 * model2 = [[TestModel2 alloc] init];
    [model2 setNumFloat:3.20f];
    [model2 setTestBool:YES];
    
    [model setModel:model2];
    
    [Owl putWithKey:@"safe" andValue:model];
}

- (IBAction)load:(id)sender {
    TestModel * test = [Owl getWithKey:@"safe"];
    [toLoadSafeTextField setText:[NSString stringWithFormat:@"%@",[test aSrt]]];
}

@end
