//
//  ReadWriteSandbox.h
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FILE_PATH_CachesDir     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define FILE_PATH_Library       [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define Documents_FilePath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define User_File_Path      [NSString stringWithFormat:@"%@/userInfo.plist",Documents_FilePath]

@interface ReadWriteSandbox : NSObject

// 判断程序沙盒文件是否存在
+ (BOOL) propertyFileExists:(NSString *) filePath;

//读取程序沙盒文件
+ (NSMutableDictionary *) readPropertyFile:(NSString *) filePath;

// 写入程序沙盒文件
+ (BOOL) writePropertyFile:(NSMutableDictionary *) writeData FilePath:(NSString *) filePath;

// 删除程序沙盒文件
+ (BOOL) deletePropertyFile:(NSString *) filePath;

@end
