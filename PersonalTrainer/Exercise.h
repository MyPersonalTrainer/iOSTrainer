//
//  Exercise.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (strong, nonatomic) NSString *eName;
@property (strong, nonatomic) NSString *eDescription;
@property (strong, nonatomic) NSString *eMuscleGroup;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
