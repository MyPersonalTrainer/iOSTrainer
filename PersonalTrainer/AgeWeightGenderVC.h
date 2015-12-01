//
//  AgeWeightGenderVC.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/22/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgeWeightGenderVC : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
