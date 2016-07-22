//
//  FTGTerminalNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGTerminalNavigator.h"
#import "XcodeWay-Swift.h"
#import "FTGEnvironmentManager.h"
#import "NSTask+FTGAdditions.h"

@implementation FTGTerminalNavigator

- (NSString *)title {
  return @"Go To Terminal";
}

// http://stackoverflow.com/questions/9823395/how-to-launch-command-line-version-of-app-from-command-line-programmatically
- (void)navigate
{
    NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];
    NSString *projectFolderPath = [projectPath stringByDeletingLastPathComponent];

    [NSTask ftg_runTaskWithLaunchPath:@"/usr/bin/open"
                            arguments:@[@"-a", @"Terminal", projectFolderPath]];
}

@end
