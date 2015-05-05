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
@property NSString *stringABC;
@property NSString *stringAlpha;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;
    self.array = [NSMutableArray new];
    self.stringABC =@"abcdefghijklmnopqrstuvwxyz";
//    self.stringAlpha =@"aaaaabcdefghijklmnopqrstuvwxyz";

    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [@"hello" length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[@"hello" substringWithRange:subStrRange]];
//        NSLog(@"%@", reversedString);
    }
    NSLog(@"%@", reversedString);

}

-(NSString*) shiftingString: (NSString*) mystring {
    NSMutableString *tempString = [NSMutableString string];
    for (int i=0; i< mystring.length; i++)
    {
        NSRange range = NSMakeRange(i ,1);
        if (range.location != NSNotFound)
        {
            NSString *letter = [mystring substringWithRange:range];

            NSRange rangeFromABC = [self.stringABC rangeOfString:letter];
            rangeFromABC.location = (rangeFromABC.location + 5)%26;
            [tempString  appendString:[self.stringABC substringWithRange:rangeFromABC]];
        }
    }

    NSLog(@"new word %@", tempString);

    return tempString;

}
-(void)matchStringAndCap:(NSString *)string{
    for (NSInteger i = 0; i < [self.stringABC length] - string.length; i++)
    {
        NSRange range = NSMakeRange(i, string.length);


        NSString *tempString = [self.stringABC substringWithRange:range];
        if (range.location != NSNotFound)
        {
//            NSLog(@" location %lu", (unsigned long)range.location);
            if ([string isEqualToString:tempString])
            {

                NSLog(@"the letter is %@", [tempString capitalizedString]);
                NSLog(@"range %lu %lu", (unsigned long)range.location, (unsigned long)range.length);

                break;
            }
        }
        else
            NSLog(@"nope");
    }
}

-(void)reversingString:(NSString*)string{
    NSMutableString *tempstring =[NSMutableString new];
    NSInteger lengthOfString =string.length;
    while (lengthOfString)
    {
        NSRange range = NSMakeRange(lengthOfString-1, 1);
        [tempstring appendString:[string substringWithRange:range]];
//          NSLog(@"reversed %@", tempstring);
         lengthOfString--;
    }
    NSLog(@"reversed %@", tempstring);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSString *string = [NSString new];
    string = self.textField.text;

    [ self.array addObject:string];

    [self.textField resignFirstResponder];

    [self shiftingString:string];

    [self matchStringAndCap:string];
    [self reversingString:string];



//    self.textField.text = @"";

    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
  self.textField.text = @"";
//     NSLog(@"Begin editing");
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.textField.text = @"";
//    NSLog(@"End editing");

}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
//    [self.textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DestViewController *dvc = segue.destinationViewController;
//    dvc.destArray = [NSMutableArray arrayWithArray:self.array];
    dvc.destArray = self.array;

}
@end
