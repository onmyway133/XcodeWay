//
//  FTGSelectedXcodeFolderNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGSelectedXcodeFolderNavigator.h"

@implementation FTGSelectedXcodeFolderNavigator

- (void)navigate
{
    NSString *selectedXcodePath = [self selectedXcodePath];

    // selectedXcodePath contains %0a
    NSString *correctSelectedXcodePath = [selectedXcodePath stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];

    NSURL *URL = [NSURL fileURLWithPath:correctSelectedXcodePath];;

    [[NSWorkspace sharedWorkspace] openURL:URL];
}

#pragma mark - Helper
- (NSString *)selectedXcodePath
{
    return [NSTask ftg_outputTaskResultWithLaunchPath:@"/usr/bin/xcode-select"
                                            arguments:@[ @"-print-path" ]];
}

@end
