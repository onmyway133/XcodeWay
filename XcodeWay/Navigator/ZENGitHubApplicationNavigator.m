//
//  ZENGitHubApplicationNavigator.m
//  XcodeWay
//
//  Created by Christoffer Winterkvist on 04/02/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import "ZENGitHubApplicationNavigator.h"

@implementation ZENGitHubApplicationNavigator

- (void)navigate
{
    NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];
    NSString *projectFolderPath = [projectPath stringByDeletingLastPathComponent];

    [NSTask ftg_runTaskWithLaunchPath:@"/usr/bin/open"
                            arguments:@[@"-a", @"GitHub", projectFolderPath ]];
}

@end
