//
//  TrainingTypeVC.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/23/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainingTypeVC : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end
