//
//  FTGEnvironmentManager.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGEnvironmentManager.h"

id objc_getClass(const char* name);

@interface FTGEnvironmentManager ()

@property (nonatomic, assign) Class IDEWorkspaceWindowControllerClass;

@end

@implementation FTGEnvironmentManager

+ (instancetype)sharedManager
{
    static FTGEnvironmentManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}

- (void)setup
{
    self.IDEWorkspaceWindowControllerClass = objc_getClass("IDEWorkspaceWindowController");
}

- (void)handleWindowDidUpdate:(NSNotification *)notification
{
    id window = [notification object];
    if ([window isKindOfClass:[NSWindow class]] && [window isMainWindow])
    {
        self.window = window;
    }
}


#pragma mark - Path

- (id)workspace {
  NSArray *workspaceWindowControllers = [self.IDEWorkspaceWindowControllerClass valueForKey:@"workspaceWindowControllers"];

  id workSpace = nil;

  for (id controller in workspaceWindowControllers) {
    if ([[controller valueForKey:@"window"] isEqual:[NSApp keyWindow]]) {
      workSpace = [controller valueForKey:@"_workspace"];
    }
  }

  return workSpace;
}

// http://stackoverflow.com/questions/21054699/get-the-path-of-current-project-opened-in-xcode-plugin
- (NSString *)projectPath {
  NSString * path = [[[self workspace] valueForKey:@"representingFilePath"] valueForKey:@"_pathString"];
  return [[NSFileManager defaultManager] fileExistsAtPath:path] ? path : nil;
}

// http://stackoverflow.com/questions/8430777/programatically-get-path-to-application-support-folder
- (NSString *)applicationSupportDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

- (NSString *)libraryDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

- (NSString *)XcodeDirectoryPath
{
    NSString *libraryDirectoryPath = [self libraryDirectoryPath];
    return [libraryDirectoryPath stringByAppendingPathComponent:@"Developer/Xcode"];
}

- (NSString *)userDataPath
{
  return [[self XcodeDirectoryPath] stringByAppendingPathComponent:@"UserData"];
}

@end
