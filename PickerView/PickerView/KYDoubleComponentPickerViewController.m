//
//  KYDoubleComponentPickerViewController.m
//  PickerView
//
//  Created by K.Yawn Xoan on 3/27/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

#import "KYDoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface KYDoubleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *myDoublePicker;

@property (strong,nonatomic) NSArray *fillingTypes;
@property (strong,nonatomic) NSArray *breadTypes;

@end

@implementation KYDoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fillingTypes = @[@"Ham",@"Turkey",@"Peanut Butter",@"Tuna Salad",@"Chicken Salad",@"Roast Beef",@"Vegemite"];
    self.breadTypes = @[@"White",@"Whole Wheat",@"Rye",@"Sourdough",@"Seven Grain"];
    
}
- (IBAction)SelectBtnPressed:(id)sender {
    
    NSInteger fillingRow = [self.myDoublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.myDoublePicker selectedRowInComponent:kBreadComponent];
    
    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread = self.breadTypes[breadRow];
    NSString  *message = [[NSString alloc]initWithFormat:@"Your %@ on %@ bread will be right up.",filling,bread];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Thank you for your order" message:message delegate:nil cancelButtonTitle:@"Great" otherButtonTitles:nil];
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
    return 2;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == kBreadComponent){
        return [self.breadTypes count];
    }else{
        return [self.fillingTypes count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == kBreadComponent){
        return self.breadTypes[row];
    }else{
        return self.fillingTypes[row];
    }
}














@end
