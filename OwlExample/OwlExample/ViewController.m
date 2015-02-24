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

Owl * owl;

- (void)viewDidLoad {
    [super viewDidLoad];
    owl = [Owl sharedInstance];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSString * toSave = [toSaveTextField text];
    TestModel * t = [[TestModel alloc] init];
    [t setIdStr:toSave];
    [t setFollowersCount:[NSNumber numberWithInt:1000]];
    [owl putWithKey:@"toSave" andValue:t];
}

- (IBAction)load:(id)sender {
    TestModel * test = [owl getWithKey:@"toSave"];
    [toLoadTextField setText:[test idStr]];
}

@end
