//
//  Exercise.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    _eName = [dictionary valueForKey:@"name"];
    _eDescription = [dictionary valueForKey:@"description"];
//    _eMuscleGroup = [dictionary valueForKey:@"muscle_group"];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    if (self == nil) return nil;
    
    _eName = [coder decodeObjectForKey:@"eName"];
    _eDescription = [coder decodeObjectForKey:@"eDescription"];
//    _eMuscleGroup = [coder decodeObjectForKey:@"eMuscleGroup"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    if (self.eName != nil) [coder encodeObject:self.eName forKey:@"eName"];
    if (self.eDescription != nil) [coder encodeObject:self.eDescription forKey:@"eDescription"];
//    if (self.eMuscleGroup != nil) [coder encodeObject:self.eMuscleGroup forKey:@"eMuscleGroup"];
}


- (BOOL)isEqual:(Exercise *)exercise {
    if (![exercise isKindOfClass:Exercise.class]) return NO;
    
    return [self.eName isEqual:exercise.eName] && [self.eDescription isEqual:exercise.eDescription]; //&& [self.eMuscleGroup isEqual:exercise.eMuscleGroup];
}

@end
