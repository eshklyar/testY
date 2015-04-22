//
//  ViewController.m
//  testY
//
//  Created by Edik Shklyar on 4/22/15.
//  Copyright (c) 2015 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"
#import "DestViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;
    self.array = [NSMutableArray new];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSString *string = [NSString new];
    string = self.textField.text;

    [ self.array addObject:string];

    [self.textField resignFirstResponder];
    self.textField.text = @"";

    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DestViewController *dvc = segue.destinationViewController;
    dvc.destArray = [NSMutableArray arrayWithArray:self.array];
}
@end
