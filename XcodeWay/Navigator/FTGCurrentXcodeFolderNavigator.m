//
//  FTGCurrentXcodeFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGCurrentXcodeFolderNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGCurrentXcodeFolderNavigator

- (NSString *)title {
  return @"Go To Current Xcode Folder";
}

// http://stackoverflow.com/questions/4087328/how-to-find-the-residing-directory-of-a-os-x-application-package-programmatica
- (void)navigate
{
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    NSURL *URL = [bundleURL URLByAppendingPathComponent:@"Contents/Developer"];

    [[NSWorkspace sharedWorkspace] openURL:URL];
}

@end
