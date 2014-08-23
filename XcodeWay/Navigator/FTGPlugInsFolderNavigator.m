//
//  FTGPlugInsFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGPlugInsFolderNavigator.h"

@implementation FTGPlugInsFolderNavigator

- (void)navigate
{
    NSString *applicationSupportDirectoryPath = [[FTGEnvironmentManager sharedManager] applicationSupportDirectoryPath];
    NSString *plugInsDirectoryPath = [applicationSupportDirectoryPath
                                      stringByAppendingPathComponent:@"Developer/Shared/Xcode/Plug-ins"];

    NSURL *URL = [NSURL fileURLWithPath:plugInsDirectoryPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];


}

@end
