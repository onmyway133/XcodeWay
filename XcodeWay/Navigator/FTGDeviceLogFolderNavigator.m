//
//  FTGDeviceLogFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGDeviceLogFolderNavigator.h"

@implementation FTGDeviceLogFolderNavigator

- (void)navigate
{
    NSString *XcodeDirectoryPath = [[FTGEnvironmentManager sharedManager] XcodeDirectoryPath];
    NSString *derivedDataDirectoryPath = [XcodeDirectoryPath stringByAppendingPathComponent:@"iOS Device Logs"];

    NSURL *URL = [NSURL fileURLWithPath:derivedDataDirectoryPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
