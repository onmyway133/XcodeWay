//
//  FTGiTermNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGiTermNavigator.h"

@implementation FTGiTermNavigator

- (void)navigate
{
    NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];
    NSString *projectFolderPath = [projectPath stringByDeletingLastPathComponent];

    NSString *iTermPath = @"/Applications/iTerm.app/Contents/MacOS/iTerm";
    if ([[NSFileManager defaultManager] fileExistsAtPath:iTermPath]) {
        [NSTask ftg_runTaskWithLaunchPath:iTermPath
                                arguments:@[ projectFolderPath ]];
    } else {
        [NSAlert ftg_showMessage:@"iTerm.app is expected to be in Applications folder"];
    }
}

@end
