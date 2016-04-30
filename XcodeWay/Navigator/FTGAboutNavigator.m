//
//  FTGAboutNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGAboutNavigator.h"
#import "XcodeWay-Swift.h"

@implementation FTGAboutNavigator

- (NSString *)title {
  return @"About";
}

- (void)navigate
{
    [NSAlert ftg_showMessage:@"https://github.com/onmyway133/XcodeWay"];
}

@end
