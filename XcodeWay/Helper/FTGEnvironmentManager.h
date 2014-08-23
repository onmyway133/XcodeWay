//
//  FTGEnvironmentManager.h
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTGEnvironmentManager : NSObject

@property (nonatomic, strong) id window;

+ (instancetype)sharedManager;

- (void)setup;
- (void)handleWindowDidUpdate:(NSNotification *)notification;

- (NSString *)projectPath;
- (NSString *)applicationSupportDirectoryPath;
- (NSString *)libraryDirectoryPath;
- (NSString *)XcodeDirectoryPath;

@end
