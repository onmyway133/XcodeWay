//
//  XcodeWay.swift
//  XcodeWay
//
//  Created by Khoa Pham on 30/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

var sharedPlugin: XcodeWay?

public class XcodeWay: NSObject {

  // Reference to plugin's bundle, for resource acccess
  let bundle: NSBundle

  public required init(bundle: NSBundle) {
    self.bundle = bundle

    super.init()

    registerNotifications()
    FTGEnvironmentManager.sharedManager().setup()
  }

  struct Static {
    static var onceToken: dispatch_once_t = 0
  }

  class func pluginDidLoad(bundle: NSBundle) {
    if let currentApplicationName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? String
      where currentApplicationName == "Xcode" {

      dispatch_once(&Static.onceToken) {
        sharedPlugin = XcodeWay(bundle: bundle)
      }
    }
  }

  deinit {
    unregisterNotifications()
  }

  // MARK: - Notification

  func registerNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applicationDidFinishLaunching(_:)),
                                                     name: NSApplicationDidFinishLaunchingNotification, object: NSApp)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(windowDidUpdate(_:)),
                                                     name: NSWindowDidUpdateNotification, object: NSApp)
  }

  func unregisterNotifications() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  func applicationDidFinishLaunching(notification: NSNotification) {
    // Application did finish launching is only send once. We do not need it anymore.
    NSNotificationCenter.defaultCenter().removeObserver(self,
                                                        name: NSApplicationDidFinishLaunchingNotification, object: NSApp)
    setupMenu()
  }

  func windowDidUpdate(notification: NSNotification) {
    FTGEnvironmentManager.sharedManager().handleWindowDidUpdate(notification)
  }

  // MARK: - Setup

  func setupMenu() {
    guard let window = NSApp.mainMenu?.itemWithTitle("Window") else { return }

    window.submenu?.addItem(NSMenuItem.separatorItem())

    func setupSubMenu(subMenu: NSMenuItem, navigators: [Navigator]) {
      subMenu.enabled = true
      subMenu.target = self
      window.submenu?.addItem(subMenu)
      subMenu.submenu = NSMenu(title: subMenu.title)

      navigators.forEach { navigator in
        switch navigator.title {
        case "_":
          subMenu.submenu?.addItem(NSMenuItem.separatorItem())
        default:
          let item = NSMenuItem(title: navigator.title, action: #selector(Navigator.navigate), keyEquivalent: "")
          item.target = navigator
          subMenu.submenu?.addItem(item)
        }
      }
    }

    let XcodeWay = NSMenuItem(title: "XcodeWay", action: nil, keyEquivalent: "")
    setupSubMenu(XcodeWay, navigators: navigators)

    let XcodeWayCommand = NSMenuItem(title: "XcodeWay+Commands", action: nil, keyEquivalent: "")
    setupSubMenu(XcodeWayCommand, navigators: commands)
  }

  let navigators: [Navigator] = {
    return [
      FTGProjectFolderNavigator(),
      ProjectDerivedDataFolderNavigator(),
      Separator(),
      iOS7SimulatorFolder(),
      FTGSimulatorFolderNavigator(),
      FTGPlugInsFolderNavigator(),
      FTGTemplateFolderNavigator(),
      FTGArchiveFolderNavigator(),
      FTGDeviceLogFolderNavigator(),
      FTGDerivedDataFolderNavigator(),
      Separator(),
      ProvisioningProfileFolderNavigator(),
      Separator(),
      FTGUserDataFolderNavigator(),
      xcdebuggerFolderNavigator(),
      ThemeFolderNavigator(),
      Separator(),
      FTGCurrentXcodeFolderNavigator(),
      FTGSelectedXcodeFolderNavigator(),
      Separator(),
      FTGTerminalNavigator(),
      FTGiTermNavigator(),
      Separator(),
      FTGGitRepoNavigator(),
      Separator(),
      FTGAboutNavigator(),
    ]
  }()

  let commands: [Navigator] = {
    return [
      TopFileNavigator()
    ]
  }()
}
