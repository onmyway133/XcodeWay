//
//  FTGEnvironmentManager.h
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTGEnvironmentManager : NSObject

@property (nonatomic, strong, nullable) id window;

+ (nonnull instancetype)sharedManager;

- (void)setup;
- (void)handleWindowDidUpdate:(nonnull NSNotification *)notification;

- (nullable id)workspace;
- (nullable NSString *)projectPath;
- (nonnull NSString *)applicationSupportDirectoryPath;
- (nonnull NSString *)libraryDirectoryPath;
- (nonnull NSString *)XcodeDirectoryPath;
- (nonnull NSString *)userDataPath;

@end
