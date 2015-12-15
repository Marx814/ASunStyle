//
//  ASSNetWoringHttpRequestManager.h
//  ASunStyle
//
//  Created by Marx on 15/12/12.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, ASSHttpState) {
    ASSHttpStateOK      = 0,
    ASSHttpStateError   = 1,
    
};

@interface ASSNetWoringHttpRequestManager : NSObject

//接口请求
+ (void)requestInterfaceWithParameters:(NSDictionary *)dictionary andURL:(NSString *)requestURL andBlock :(void (^)(ASSHttpState state, NSDictionary * responseDictionary))block;


+ (void)requestInterfaceWithParameters:(NSDictionary *)parameters andImage:(UIImage *)image andURL:(NSString *)requestURL andBlock:(void (^)(ASSHttpState state, NSDictionary * responseDictionary))block;

@end
