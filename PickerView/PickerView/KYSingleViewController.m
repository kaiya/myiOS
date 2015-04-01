//
//  KYSingleViewController.m
//  PickerView
//
//  Created by K.Yawn Xoan on 3/27/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

#import "KYSingleViewController.h"

@interface KYSingleViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;

@property (strong,nonatomic) NSArray *characterNames;


@end

@implementation KYSingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.characterNames = @[@"Luke",@"Leia",@"Han",@"Chewbacca",@"Artoo",@"Threepio",@"Lando"];
    
}
- (IBAction)selectBtnPressed:(id)sender {
    
    NSInteger row = [self.myPickerView selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc]initWithFormat:@"You selected %@",selected];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"Thank you for choosing"  delegate:nil cancelButtonTitle:@"You are welcome" otherButtonTitles:nil];
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

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}

#pragma  mark Picker Delegate Methods

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.characterNames[row];
}









@end
