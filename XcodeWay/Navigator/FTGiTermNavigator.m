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
    BOOL launchediTerm = [[NSWorkspace sharedWorkspace] launchApplication:@"iTerm"];
    if (launchediTerm == NO) {
        [NSAlert ftg_showMessage:@"Could not launch iTerm"];
    }
}

@end
