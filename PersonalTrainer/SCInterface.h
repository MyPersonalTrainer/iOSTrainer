//
//  SCInterface.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/14/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kExerciseResponseObject @"keyForExerciseResponseObject"
#define kExerciseByMuscleGroup @"keyForExerciseResponseObject"

@interface SCInterface : NSObject

+ (void)getJSONDataFromUrl;
+ (BOOL)archive:(NSDictionary *)dict withKey:(NSString *)key;
+ (NSDictionary *)unarchiveForKey:(NSString *)key;

@end
