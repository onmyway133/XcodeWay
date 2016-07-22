//
//  FTGProjectFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGProjectFolderNavigator.h"
#import "XcodeWay-Swift.h"
#import "FTGEnvironmentManager.h"

@implementation FTGProjectFolderNavigator

- (NSString *)title {
  return @"Go To Project Folder";
}

// http://stackoverflow.com/questions/7652928/launch-osx-finder-window-with-specific-files-selected
- (void)navigate
{
    NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];

    if (!projectPath) {
        return;
    }

    NSURL *URL = [NSURL fileURLWithPath:projectPath isDirectory:NO];
    [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:@[ URL ]];
}

@end
