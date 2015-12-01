//
//  Program.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 12/2/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "Program.h"

@implementation Program

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    _dayOfWeek = @"Monday";
    _timeNeeded = @"Est. 240 min.";
//    _trainingType = 
    
    return self;
}


@end
