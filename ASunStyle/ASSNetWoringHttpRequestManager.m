//
//  ASSNetWoringHttpRequestManager.m
//  ASunStyle
//
//  Created by Marx on 15/12/12.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSNetWoringHttpRequestManager.h"

@implementation ASSNetWoringHttpRequestManager

+ (void)requestInterfaceWithParameters:(NSDictionary *)parameters andURL:(NSString *)requestURL andBlock:(void (^)(ASSHttpState, NSDictionary *))block
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.request.URL);
        NSLog(@"%@",responseObject);
        NSString *msg = responseObject[@"msg"];
        NSLog(@"%@",msg);
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([code integerValue] == 1000) {
            NSDictionary *responseDic = responseObject;
            if (block) {
                block(ASSHttpStateOK,responseDic);
            }
        }else{
            if (block) {
                block(ASSHttpStateError,nil);
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",operation.responseString);
        NSLog(@"%@",error);
        if (block) {
            block(ASSHttpStateError,nil);
        }
    }];
}

+ (void)requestInterfaceWithParameters:(NSDictionary *)parameters andImage:(UIImage *)image andURL:(NSString *)requestURL andBlock:(void (^)(ASSHttpState, NSDictionary *))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:requestURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *imgData;
        imgData = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:imgData name:@"upfile" fileName:@"img.jpg" mimeType:@"jpg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.request.URL);
        NSLog(@"%@",responseObject);
        NSString *msg = responseObject[@"msg"];
        NSLog(@"%@",msg);
        
        NSString *code = [responseObject objectForKey:@"code"];
        if ([code integerValue] == 1000) {
            NSDictionary *responseDic = responseObject;
            if (block) {
                block(ASSHttpStateOK,responseDic);
            }
        }else{
            if (block) {
                block(ASSHttpStateError,nil);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",operation.responseString);
        NSLog(@"%@",error);
        if (block) {
            block(ASSHttpStateError,nil);
        }
    }];
}

@end
