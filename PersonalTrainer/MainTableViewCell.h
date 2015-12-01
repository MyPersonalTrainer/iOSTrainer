//
//  MainTableViewCell.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 12/1/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeNeededLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainingType;

@end
