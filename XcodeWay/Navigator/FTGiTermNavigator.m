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
  // FIXME
  return @"Go To iTerm";
}

- (void)navigate {
  // TODO
  NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];
  NSString *projectFolderPath = [projectPath stringByDeletingLastPathComponent];

  [NSTask ftg_runTaskWithLaunchPath:@"/usr/bin/open"
                          arguments:@[@"-a", @"iTerm", projectFolderPath]];
}

@end
