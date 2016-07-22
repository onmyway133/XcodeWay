//
//  FTGTemplateFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGTemplateFolderNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGTemplateFolderNavigator

- (NSString *)title {
  return @"Go To Templates Folder";
}

- (void)navigate
{
    NSString *XcodeDirectoryPath = [[FTGEnvironmentManager sharedManager] XcodeDirectoryPath];
    NSString *derivedDataDirectoryPath = [XcodeDirectoryPath stringByAppendingPathComponent:@"Templates"];

    NSURL *URL = [NSURL fileURLWithPath:derivedDataDirectoryPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
