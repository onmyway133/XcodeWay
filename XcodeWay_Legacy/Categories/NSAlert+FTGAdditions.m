//
//  NSAlert+FTGAdditions.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "NSAlert+FTGAdditions.h"

@implementation NSAlert (FTGAdditions)

+ (void)ftg_showMessage:(NSString *)message
{
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"XcodeWay";
    alert.informativeText = message;
    [alert addButtonWithTitle:@"OK"];

    [alert runModal];
}

@end
