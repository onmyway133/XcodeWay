//
//  FTGUserDataFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGUserDataFolderNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGUserDataFolderNavigator

- (NSString *)title {
  return @"Go To User Data Folder";
}

- (void)navigate {
    NSString *path = [[FTGEnvironmentManager sharedManager] userDataPath];
    NSURL *URL = [NSURL fileURLWithPath:path isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
