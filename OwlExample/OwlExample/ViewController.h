//
//  ViewController.h
//  OwlExample
//
//  Created by Felipe Cavalcanti on 24/02/15.
//  Copyright (c) 2015 felipejfc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *toSaveTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveBt;
@property (weak, nonatomic) IBOutlet UIButton *loadBt;
@property (weak, nonatomic) IBOutlet UIButton *saveBt2;
@property (weak, nonatomic) IBOutlet UIButton *loadBt2;
@property (weak, nonatomic) IBOutlet UITextField *toLoadTextField;
@property (weak, nonatomic) IBOutlet UITextField *toSaveSafeTextField;
@property (weak, nonatomic) IBOutlet UITextField *toLoadSafeTextField;


@end

