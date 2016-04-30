//
//  FTGNewSimulatorFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 3/14/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import "FTGNewSimulatorFolderNavigator.h"
#import "FTGEnvironmentManager.h"
#import "FTGDirectoryItem.h"
#import "FTGDirectoryHelper.h"
#import "XcodeWay-Swift.h"

@implementation FTGNewSimulatorFolderNavigator

- (NSString *)title {
  return @"Go To New Simulator Folder";
}

- (void)navigate {
    NSString *libraryPath = [[FTGEnvironmentManager sharedManager] libraryDirectoryPath];
    NSString *devicesPath = @"Developer/CoreSimulator/Devices";
    NSString *fullDevicesPath = [libraryPath stringByAppendingPathComponent:devicesPath];

    // Find path to the lastest device
    FTGDirectoryItem *lastestDeviceItem = [FTGDirectoryHelper lastestModifiedFolderFromPath:fullDevicesPath];
    NSString *fullLastestDevicePath = [fullDevicesPath stringByAppendingPathComponent:lastestDeviceItem.name];
    if (![self fileExistsAtPath:fullLastestDevicePath]) {
        [self showError];
        return;
    }

    NSLog(@"fullLastestDevicePath %@", fullLastestDevicePath);

    // Check Application folder
    NSString *applicationPath = @"data/Containers/Data/Application";
    NSString *fullApplicationPath = [fullLastestDevicePath stringByAppendingPathComponent:applicationPath];
    if (![self fileExistsAtPath:fullApplicationPath]) {
        [self showError];
        return;
    }

    NSLog(@"fullApplicationPath %@", fullApplicationPath);

    // Find path to lastest application
    FTGDirectoryItem *lastestApplicationItem = [FTGDirectoryHelper lastestModifiedFolderFromPath:fullApplicationPath];
    NSString *fullLatestApplicationPath = [fullApplicationPath stringByAppendingPathComponent:lastestApplicationItem.name];
    if (![self fileExistsAtPath:fullLatestApplicationPath]) {
        [self showError];
        return;
    }

    NSLog(@"fullLatestApplicationPath %@", fullLatestApplicationPath);

    // Run
    NSURL *URL = [NSURL fileURLWithPath:fullLatestApplicationPath isDirectory:YES];
    [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:@[ URL ]];
}

- (void)showError {
    [NSAlert ftg_showMessage:@"You should run the project on the simulartor"];
}

- (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

@end
