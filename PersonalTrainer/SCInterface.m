//
//  SCInterface.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/14/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "SCInterface.h"
#import "ExcersiseTableVC.h"


#define BASE_URL @""

@implementation SCInterface

+ (BOOL)archive:(NSDictionary *)dict withKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = nil;
    if (dict) {
        data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    }
    [defaults setObject:data forKey:key];
    return [defaults synchronize];
}

+ (NSDictionary *)unarchiveForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:key];
    NSDictionary *userDict = nil;
    if (data) {
        userDict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return userDict;
}

+ (void)getJSONDataFromUrl
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithURL:[NSURL URLWithString:@"https://personal-trainer-app.herokuapp.com"]
           completionHandler:^(NSData *data,
                               NSURLResponse *response,
                               NSError *error) {
               if (!error) {
                   NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                   if (httpResp.statusCode == 200) {
                       
                       NSError *jsonError;
                    
                       NSDictionary *cleanJSON =
                       [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingAllowFragments
                                                         error:&jsonError];
                       NSLog(@"%@", cleanJSON);
                       
                       [SCInterface archive:cleanJSON withKey:kExerciseResponseObject];
                       
                       
                       if (!jsonError) {                    
                           // Handle error
                       }
                   }
               }
           }];
    [dataTask resume];
}

@end
