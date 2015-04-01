//
//  KYDateViewController.m
//  PickerView
//
//  Created by K.Yawn Xoan on 3/27/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

#import "KYDateViewController.h"

@interface KYDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;

@end

@implementation KYDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *now = [NSDate date];
    [self.myDatePicker setDate:now animated:NO];
}
- (IBAction)SelectBtnPressed:(id)sender {
    
    NSDate *selected = [self.myDatePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@",selected];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"That's so true!" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
