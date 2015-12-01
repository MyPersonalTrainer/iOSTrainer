//
//  Program.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 12/2/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Program : NSObject

@property (strong, nonatomic) NSString *dayOfWeek;
@property (strong, nonatomic) NSString *timeNeeded;
@property (strong, nonatomic) NSString *trainingType;

- (id)initWithDictionary:(NSDictionary *)dictionary;


@end
