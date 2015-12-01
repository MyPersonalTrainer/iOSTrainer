//
//  TrainingTypeVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/23/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "TrainingTypeVC.h"

@interface TrainingTypeVC ()

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) UIPickerView *picker;
@property (strong, nonatomic) UITextField *activeField;

@end

@implementation TrainingTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker = [[UIPickerView alloc] init];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.typeTextField.inputView = self.picker;
    self.placeTextField.inputView = self.picker;
    
    
    // add a toolbar with Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    
    [toolBar setItems:[NSArray arrayWithObjects:doneButton, nil]];
    self.typeTextField.inputAccessoryView = toolBar;
    self.typeTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.typeTextField.layer.borderWidth = 2.0;
    self.typeTextField.layer.cornerRadius = 22.0;
    self.typeTextField.delegate = self;
    
    self.placeTextField.inputAccessoryView = toolBar;
    self.placeTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.placeTextField.layer.borderWidth = 2.0;
    self.placeTextField.layer.cornerRadius = 22.0;
    self.placeTextField.delegate = self;
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeField = textField;
    if([textField isEqual:self.typeTextField]) {
        self.data = [NSMutableArray arrayWithObjects:@"Серце", @"Сила", @"Витривалість", nil];
    }
    if([textField isEqual:self.placeTextField]) {
        self.data = [NSMutableArray arrayWithObjects:@"Домівка", @"Зал", nil];
    }
    
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


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
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
    
}

@end
