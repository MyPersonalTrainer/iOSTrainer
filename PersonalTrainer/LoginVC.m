//
//  LoginVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 12/15/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    self.passwordTextField.layer.borderColor = [UIColor colorWithRed:18.0/255.0 green:166.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    
    self.loginTextField.layer.borderWidth = 2.0;
    self.passwordTextField.layer.borderWidth = 2.0;
    
    self.loginTextField.layer.cornerRadius = 22.0;
    self.passwordTextField.layer.cornerRadius = 22.0;
}

- (IBAction)loginButtonClicked:(id)sender {

//    [self performSegueWithIdentifier:@"loginWasPerformed" sender:nil];
}


@end
