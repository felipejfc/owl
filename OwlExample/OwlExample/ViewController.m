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

@synthesize toSaveTextField;
@synthesize toLoadTextField;
@synthesize toLoadSafeTextField;
@synthesize toSaveSafeTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUnsafe:(id)sender {
    NSString * toSave = [toSaveTextField text];
    TestModel * t = [[TestModel alloc] init];
    [t setIdStr:toSave];
    [t setFollowersCount:[NSNumber numberWithInt:1000]];
    [Owl putUnsafeWithKey:@"toSave" andValue:t];
}

- (IBAction)loadUnsafe:(id)sender {
    //TODO passo como ponteiro o obj pra a classe Owl dai eu faco a conversao e nao preciso disso
    TestModel *test = [Owl getUnsafeWithKey:@"toSave" andClass:[TestModel class]];
    [toLoadTextField setText:[test idStr]];
}

- (IBAction)saveSafe:(id)sender {
    TestModel2 * model2 = [[TestModel2 alloc] init];
    [model2 setASrt:@"aStr"];
    [model2 setNum:3000];
    
    TestModel3 * model3 = [[TestModel3 alloc] init];
    [model3 setNumFloat:3.20f];
    
    [model2 setModel:model3];
    
    [Owl putWithKey:@"safe" andValue:model2];
}

- (IBAction)loadSafe:(id)sender {
    TestModel2 * test = [Owl getWithKey:@"safe" andClass:[TestModel2 class]];
    [toLoadSafeTextField setText:[NSString stringWithFormat:@"t2 num: %d t3 float: %.2f",[test num], [[test model] numFloat]]];
}

@end
