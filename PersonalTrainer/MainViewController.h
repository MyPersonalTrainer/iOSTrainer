//
//  ViewController.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *feedDictionary;

@end

