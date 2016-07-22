//
//  FTGArchiveFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGArchiveFolderNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGArchiveFolderNavigator

- (NSString *)title {
  return @"Go To Archives Folder";
}

- (void)navigate
{
    NSString *XcodeDirectoryPath = [[FTGEnvironmentManager sharedManager] XcodeDirectoryPath];
    NSString *derivedDataDirectoryPath = [XcodeDirectoryPath stringByAppendingPathComponent:@"Archives"];

    NSURL *URL = [NSURL fileURLWithPath:derivedDataDirectoryPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
