//
//  XcodeWay.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "XcodeWay.h"
#import "FTGNavigatorManager.h"

static XcodeWay *sharedPlugin;

@interface XcodeWay ()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) FTGNavigatorManager *navigatorManager;

@end

@implementation XcodeWay

+ (void)pluginDidLoad:(NSBundle *)bundle
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:bundle];
        });
    }
}

- (id)initWithBundle:(NSBundle *)bundle
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource acccess
        self.bundle = bundle;

        // Navigator Manager
        self.navigatorManager = [[FTGNavigatorManager alloc] init];

        // Notifications
        [self registerNotifications];
    }
    return self;
}

- (void)dealloc
{
    [self unregisterNotifications];
}

#pragma mark - Notification
- (void)registerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    [notificationCenter addObserver:self
                           selector:@selector(applicationDidFinishLaunching:)
                               name:NSApplicationDidFinishLaunchingNotification
                             object:NSApp];
}

- (void)unregisterNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Application did finish launching is only send once. We do not need it anymore.
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self
                                  name:NSApplicationDidFinishLaunchingNotification
                                object:NSApp];

    [self setupMenu];
}

#pragma mark - Setup Menu
- (void)setupMenu
{
    // Navigate
    NSMenuItem *navigateMenuItem = [[NSApp mainMenu] itemWithTitle:@"Window"];
    if (navigateMenuItem) {
        // Separator
        [[navigateMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        // XcodeWay
        NSMenuItem *xcodeWayMenuItem = [[NSMenuItem alloc] initWithTitle:@"XcodeWay"
                                                                  action:nil
                                                           keyEquivalent:@""];
        xcodeWayMenuItem.enabled = YES;
        [xcodeWayMenuItem setTarget:self];
        [[navigateMenuItem submenu] addItem:xcodeWayMenuItem];
        xcodeWayMenuItem.submenu = [[NSMenu alloc] initWithTitle:xcodeWayMenuItem.title];

        // Sub Menu Item
        [self addMenuItemNamed:@"Go To Project Folder" action:@selector(gotoProjectFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Simulator Folder" action:@selector(goToSimulatorFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Derived Data Folder" action:@selector(goToDerivedDataFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Plug-Ins Folder" action:@selector(goToPlugInsFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Template Folder" action:@selector(goToTemplateFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Xcode Folder" action:@selector(goToXcodeFolder:) intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"Go To Terminal" action:@selector(goToTerminal:) intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"Go To Github" action:@selector(goToGithub:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Bitbucket" action:@selector(goToBitbucket:) intoParentMenuItem:xcodeWayMenuItem];
    }
}

- (void)addMenuItemNamed:(NSString *)name action:(SEL)action intoParentMenuItem:(NSMenuItem *)parentMenuItem
{
    NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:name
                                                      action:action
                                               keyEquivalent:@""];

    [menuItem setTarget:self];
    [[parentMenuItem submenu] addItem:menuItem];
}

#pragma mark - Menu Action
- (void)gotoProjectFolder:(id)sender
{
    NSAlert *alert = [NSAlert alertWithMessageText:@"Hello, World" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [alert runModal];
}

- (void)goToSimulatorFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGProjectFolderNavigator new]];
}

- (void)goToDerivedDataFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGDerivedDataFolderNavigator new]];
}

- (void)goToPlugInsFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGPlugInsFolderNavigator new]];
}

- (void)goToTemplateFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGTemplateFolderNavigator new]];
}

- (void)goToXcodeFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGXcodeFolderNavigator new]];
}

- (void)goToTerminal:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGTerminalNavigator new]];
}

- (void)goToGithub:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGGitRepoNavigator new]];
}

- (void)goToBitbucket:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGGitRepoNavigator new]];
}


@end
