//
//  NSTask+FTGAdditions.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "NSTask+FTGAdditions.h"

@implementation NSTask (FTGAdditions)

+ (NSString *)ftg_outputTaskResultWithLaunchPath:(NSString *)launchPath
                                       arguments:(NSArray *)arguments
{
    return [self ftg_outputTaskResultWithLaunchPath:launchPath arguments:arguments currentDirectoryPath:nil];
}

+ (NSString *)ftg_outputTaskResultWithLaunchPath:(NSString *)launchPath
                                       arguments:(NSArray *)arguments
                            currentDirectoryPath:(NSString *)currentDirectoryPath
{
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = launchPath;
    task.arguments = arguments;
    task.standardOutput = [NSPipe pipe];

    if (currentDirectoryPath.length > 0) {
        task.currentDirectoryPath = currentDirectoryPath;
    }

    NSFileHandle *file = [task.standardOutput fileHandleForReading];

    [task launch];

    // For some reason [task waitUntilExit]; does not return sometimes. Therefore this rather hackish solution:
    int count = 0;
    while (task.isRunning && (count < 10))
    {
        [NSThread sleepForTimeInterval:0.1];
        count++;
    }

    NSString *output = [[NSString alloc] initWithData:[file readDataToEndOfFile] encoding:NSUTF8StringEncoding];

    return output;
}

+ (void)ftg_runTaskWithLaunchPath:(NSString *)launchPath
                        arguments:(NSArray *)arguments
{
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = launchPath;
    task.arguments = arguments;
    
    [task launch];
}

@end
