//
//  NSTask+FTGAdditions.h
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTask (FTGAdditions)

+ (NSString *)ftg_outputTaskResultWithLaunchPath:(NSString *)launchPath
                                       arguments:(NSArray *)arguments;

+ (NSString *)ftg_outputTaskResultWithLaunchPath:(NSString *)launchPath
                                       arguments:(NSArray *)arguments
                            currentDirectoryPath:(NSString *)currentDirectoryPath;

+ (void)ftg_runTaskWithLaunchPath:(NSString *)launchPath
                        arguments:(NSArray *)arguments;

@end
