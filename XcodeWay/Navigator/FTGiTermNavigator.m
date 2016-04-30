//
//  FTGiTermNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGiTermNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGiTermNavigator

- (NSString *)title {
  return @"Go To iTerm";
}

- (void)navigate
{
    if ([[NSWorkspace sharedWorkspace] launchApplication:@"iTerm"] == NO) {
        [NSAlert ftg_showMessage:@"Could not launch iTerm"];
    }
}

@end
