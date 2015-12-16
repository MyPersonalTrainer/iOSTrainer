//
//  AgeWeightGenderVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/22/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "AgeWeightGenderVC.h"
#import "Constants.h"

@interface AgeWeightGenderVC ()

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) UITextField *activeField;
@property (strong, nonatomic) UIPickerView *picker;

@end

@implementation AgeWeightGenderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker = [[UIPickerView alloc] init];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.ageTextField.delegate = self;
    self.weightTextField.delegate = self;
    self.heightTextField.delegate = self;
    self.genderTextField.delegate = self;
    
    self.ageTextField.inputView = self.picker;
    self.weightTextField.inputView = self.picker;
    self.heightTextField.inputView = self.picker;
    self.genderTextField.inputView = self.picker;
    
    // add a toolbar with Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    
    [toolBar setItems:[NSArray arrayWithObjects:doneButton, nil]];
    self.ageTextField.inputAccessoryView = toolBar;
    self.weightTextField.inputAccessoryView = toolBar;
    self.heightTextField.inputAccessoryView = toolBar;
    self.genderTextField.inputAccessoryView = toolBar;
    
    self.ageTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.weightTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.heightTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.genderTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;

    self.ageTextField.layer.borderWidth = 2.0;
    self.weightTextField.layer.borderWidth = 2.0;
    self.heightTextField.layer.borderWidth = 2.0;
    self.genderTextField.layer.borderWidth = 2.0;
    
    self.ageTextField.layer.cornerRadius = 22.0;
    self.weightTextField.layer.cornerRadius = 22.0;
    self.heightTextField.layer.cornerRadius = 22.0;
    self.genderTextField.layer.cornerRadius = 22.0;
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.scrollEnabled = NO;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if([ud objectForKey:kUserAge]) {
        self.ageTextField.text = [ud objectForKey:kUserAge];
    }
    if([ud objectForKey:kUserWeight]) {
        self.weightTextField.text = [ud objectForKey:kUserWeight];
    }
    if([ud objectForKey:kUserGender]) {
        self.genderTextField.text = [ud objectForKey:kUserGender];
    }
    if([ud objectForKey:kUserHeight]) {
        self.heightTextField.text = [ud objectForKey:kUserHeight];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeField = textField;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if([textField isEqual:self.ageTextField]) {
        for (int i = 18; i <= 99; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
    }
    if([textField isEqual:self.weightTextField]) {
        for (int i = 35; i <= 150; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
    }
    if([textField isEqual:self.heightTextField]) {
        for (int i = 120; i <= 210; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
    }
    if([textField isEqual:self.genderTextField]) {
        array = [NSMutableArray arrayWithObjects:@"Male", @"Female", nil];
    }
    self.data = array;
    
    [self.picker reloadAllComponents];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.data.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    self.activeField.text = [NSString stringWithFormat:@"%@",[self.data objectAtIndex:row]];

    return [NSString stringWithFormat:@"%@",[self.data objectAtIndex:row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.activeField.text = [NSString stringWithFormat:@"%@",[self.data objectAtIndex:row]];
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    [self.activeField resignFirstResponder];
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = (CGFloat)self.myTableView.frame.size.height - 65.0;
    return cellHeight;
}
- (IBAction)nextButtonClicked:(id)sender {
    
    if([self.ageTextField.text isEqualToString:@""] ||
       [self.weightTextField.text isEqualToString:@""] ||
       [self.genderTextField.text isEqualToString:@""] ||
       [self.heightTextField.text isEqualToString:@""])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"You must set all fields before proceeding" preferredStyle:UIAlertControllerStyleActionSheet];
        [self presentViewController:alert animated:YES completion:^{
            double delayInSeconds = 0.48;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        }];
    }
    else
    {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:self.ageTextField.text forKey:kUserAge];
        [ud setObject:self.weightTextField.text forKey:kUserWeight];
        [ud setObject:self.genderTextField.text forKey:kUserGender];
        [ud setObject:self.heightTextField.text forKey:kUserHeight];
        [ud synchronize];
        
        [self performSegueWithIdentifier:@"trainingTypeSegue" sender:nil];
    }
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
