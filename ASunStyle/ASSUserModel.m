//
//  ASSUserModel.m
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSUserModel.h"

@implementation ASSUserModel

+ (ASSUserModel *)shareUserModel
{
    static ASSUserModel *_userModel = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _userModel = [[ASSUserModel alloc] init];
        if ([self ifLogin]) {
            [_userModel initWithDictionary:[ReadWriteSandbox readPropertyFile:User_File_Path]];
        }
    });
    return _userModel;
}

- (void)initWithDictionary:(NSDictionary *)dictionary
{
    
    _phone = [dictionary objectForKey:@"phone"];
    _token = [dictionary objectForKey:@"token"];
    if ([ReadWriteSandbox writePropertyFile:dictionary FilePath:User_File_Path]) {
        NSLog(@"用户写入成功");
    };
}

+ (BOOL)ifLogin
{
    return [ReadWriteSandbox propertyFileExists:User_File_Path];
}

+ (void)logoff
{
    [ReadWriteSandbox deletePropertyFile:User_File_Path];
}


@end
