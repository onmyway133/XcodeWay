//
//  FTGDerivedDataFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGDerivedDataFolderNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGDerivedDataFolderNavigator

- (NSString *)title {
  return @"Go To Derived Data Folder";
}

- (void)navigate
{
    NSString *XcodeDirectoryPath = [[FTGEnvironmentManager sharedManager] XcodeDirectoryPath];
    NSString *derivedDataDirectoryPath = [XcodeDirectoryPath stringByAppendingPathComponent:@"DerivedData"];

    NSURL *URL = [NSURL fileURLWithPath:derivedDataDirectoryPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
