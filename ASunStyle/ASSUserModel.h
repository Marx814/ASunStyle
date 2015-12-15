//
//  ASSUserModel.h
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadWriteSandbox.h"

@interface ASSUserModel : NSObject

+ (ASSUserModel *)shareUserModel;

@property(nonatomic)NSString *phone;
@property(nonatomic)NSString *token;

+ (BOOL)ifLogin;
+ (void)logoff;

- (void)initWithDictionary:(NSDictionary *)dictionary;

@end
