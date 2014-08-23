//
//  XcodeWay.m
//  XcodeWay
//
//  Created by Khoa Pham on 8/23/14.
//  Copyright (c) 2014 Fantageek. All rights reserved.
//

#import "XcodeWay.h"

static XcodeWay *sharedPlugin;

@interface XcodeWay ()

@property (nonatomic, strong) NSBundle *bundle;

@end

@implementation XcodeWay

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource acccess
        self.bundle = plugin;

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

}

- (void)goToDerivedDataFolder:(id)sender
{

}

- (void)goToPlugInsFolder:(id)sender
{

}

- (void)goToTemplateFolder:(id)sender
{

}

- (void)goToTerminal:(id)sender
{

}

- (void)goToGithub:(id)sender
{

}

- (void)goToBitbucket:(id)sender
{

}


@end
