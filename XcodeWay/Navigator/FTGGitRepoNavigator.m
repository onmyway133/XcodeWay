//
//  FTGGitRepoNavigator.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "FTGGitRepoNavigator.h"

@implementation FTGGitRepoNavigator

// https://github.com/larsxschneider/ShowInGitHub
- (void)navigate
{
    NSString *projectPath = [[FTGEnvironmentManager sharedManager] projectPath];
    NSString *projectFolderPath = [projectPath stringByDeletingLastPathComponent];
    NSURL *projectFolderURL = [NSURL fileURLWithPath:projectFolderPath];

    NSString *githubRepoPath = [self githubRepoPathForDirectory:projectFolderURL.path];

    if (githubRepoPath.length == 0) {
        return;
    }

    [self openRepo:githubRepoPath];
}


#pragma mark - Helper
- (NSString *)githubRepoPathForDirectory:(NSString *)dir
{
    if (dir.length == 0) {
        NSLog(@"Invalid git repository path.");
        return nil;
    }

    // Get github username and repo name
    NSString *githubURLComponent = nil;

    NSString *output = [self outputInPath:dir];

    NSArray *remotes = [output componentsSeparatedByString:@"\n"];

    NSLog(@"GIT remotes: %@", remotes);

    NSMutableSet *remotePaths = [NSMutableSet setWithCapacity:1];

    for (NSString *remote in remotes) {
        // Check for SSH protocol
        NSRange begin = [remote rangeOfString:@"git@"];

        if (begin.location == NSNotFound) {
            // SSH protocol not found, check for GIT protocol
            begin = [remote rangeOfString:@"git://"];
        }

        if (begin.location == NSNotFound) {
            // HTTPS protocol check
            begin = [remote rangeOfString:@"https://"];
        }

        if (begin.location == NSNotFound) {
            // HTTP protocol check
            begin = [remote rangeOfString:@"http://"];
        }

        NSRange end = [remote rangeOfString:@".git (fetch)"];

        if (end.location == NSNotFound) {
            // Alternate remote url end
            end = [remote rangeOfString:@" (fetch)"];
        }

        if ((begin.location != NSNotFound) &&
            (end.location != NSNotFound)) {

            NSUInteger githubURLBegin = begin.location + begin.length;
            NSUInteger githubURLLength = end.location - githubURLBegin;
            githubURLComponent = [[remote
                                   substringWithRange:NSMakeRange(githubURLBegin, githubURLLength)]
                                  stringByReplacingOccurrencesOfString:@":" withString:@"/"];

            [remotePaths addObject:githubURLComponent];
        }
    }

    if (remotePaths.count > 1) {
        NSArray *remotePathsArray = remotePaths.allObjects;

        NSAlert *alert = [[NSAlert alloc] init];
        alert.messageText = [NSString stringWithFormat:@"This repository has %lu remotes configured. Which one do you want to open?", (unsigned long)remotePathsArray.count];

        [alert addButtonWithTitle:@"Cancel"]; // NSAlertFirstButtonReturn

        for (NSString *string in remotePathsArray) {
            [alert addButtonWithTitle:string];
        }

        NSInteger result = [alert runModal];
        NSInteger index = result - NSAlertFirstButtonReturn - 1;

        if (index >=0 && index < remotePathsArray.count) {
            githubURLComponent = remotePathsArray[index];
        } else {
            return nil;
        }

    }

    if (githubURLComponent.length == 0) {
        [NSAlert ftg_showMessage:@"Unable to find github remote URL."];
        return nil;
    }
    
    return githubURLComponent;
}

- (NSString *)outputInPath:(NSString *)path
{
    if (path.length == 0) {
        NSLog(@"Invalid path for git working directory.");
        return nil;
    }

    NSArray *arguments = @[ @"git", @"--no-pager", @"remote", @"--verbose" ];
    return [NSTask ftg_outputTaskResultWithLaunchPath:@"/usr/bin/xcrun"
                                            arguments:arguments
                                 currentDirectoryPath:path];
}

- (void)openRepo:(NSString *)repo
{
    NSString *secureBaseUrl = [NSString stringWithFormat:@"https://%@", repo];

    [NSTask launchedTaskWithLaunchPath:@"/usr/bin/open" arguments:@[ secureBaseUrl ]];
}

@end
