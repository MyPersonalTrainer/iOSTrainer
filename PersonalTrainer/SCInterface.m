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
    NSString *dataUrl = @"YOUR_DATA_URL";
    NSURL *url = [NSURL URLWithString:dataUrl];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                          }];
    [downloadTask resume];
}

- (void) post {
    
    // 1
    NSURL *url = [NSURL URLWithString:@"YOUR_WEBSERVICE_URL"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    // 3
    NSDictionary *dictionary = @{@"key1": @"value1"};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       // Handle response here
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
}

@end
