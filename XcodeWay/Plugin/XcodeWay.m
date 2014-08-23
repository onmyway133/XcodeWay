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

        [[FTGEnvironmentManager sharedManager] setup];
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

    [notificationCenter addObserver:self
                           selector:@selector(windowDidUpdate:)
                               name:NSWindowDidUpdateNotification
                             object:nil];
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

- (void)windowDidUpdate:(NSNotification *)notification
{
    [[FTGEnvironmentManager sharedManager] handleWindowDidUpdate:notification];
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
        [self addMenuItemNamed:@"Go To Plug-Ins Folder" action:@selector(goToPlugInsFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Templates Folder" action:@selector(goToTemplateFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Archive Folder" action:@selector(goToArchiveFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To User Data Folder" action:@selector(goToUserDataFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To iOS Device Logs Folder" action:@selector(goToDeviceLogFolder:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Derived Data Folder" action:@selector(goToDerivedDataFolder:) intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"Go To Current Xcode Folder" action:@selector(goToCurrentXcodeFolder:)
            intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To Selected Xcode Folder" action:@selector(goToSelectedXcodeFolder:)
            intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"Go To Terminal" action:@selector(goToTerminal:) intoParentMenuItem:xcodeWayMenuItem];
        [self addMenuItemNamed:@"Go To iTerm" action:@selector(goToiTerm:) intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"Go To Git Repository" action:@selector(goToGitRepository:) intoParentMenuItem:xcodeWayMenuItem];

        [[xcodeWayMenuItem submenu] addItem:[NSMenuItem separatorItem]];

        [self addMenuItemNamed:@"About" action:@selector(goToAbout:) intoParentMenuItem:xcodeWayMenuItem];
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
    [self.navigatorManager navigateWithNavigator:[FTGProjectFolderNavigator new]];
}

- (void)goToSimulatorFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGSimulatorFolderNavigator new]];
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

- (void)goToCurrentXcodeFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGCurrentXcodeFolderNavigator new]];
}

- (void)goToSelectedXcodeFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGSelectedXcodeFolderNavigator new]];
}

- (void)goToArchiveFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGArchiveFolderNavigator new]];
}

- (void)goToUserDataFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGUserDataFolderNavigator new]];
}

- (void)goToDeviceLogFolder:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGDeviceLogFolderNavigator new]];
}

- (void)goToTerminal:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGTerminalNavigator new]];
}

- (void)goToiTerm:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGiTermNavigator new]];
}

- (void)goToGitRepository:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGGitRepoNavigator new]];
}

- (void)goToAbout:(id)sender
{
    [self.navigatorManager navigateWithNavigator:[FTGAboutNavigator new]];
}


@end
