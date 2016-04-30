//
//  XcodeWay.swift
//  XcodeWay
//
//  Created by Khoa Pham on 30/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

var sharedPlugin: XcodeWay?

public class XcodeWay: NSObject, PluginType {

  struct Static {
    static var onceToken: dispatch_once_t = 0
  }

  // Reference to plugin's bundle, for resource acccess
  let bundle: NSBundle

  // Navigator
  let navigatorManager = FTGNavigatorManager()

  // MARK: - PluginType

  static func pluginDidLoad(bundle: NSBundle) {
    if let currentApplicationName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? String
      where currentApplicationName == "Xcode" {

      dispatch_once(&Static.onceToken) {
        sharedPlugin = XcodeWay(bundle: bundle)
      }
    }
  }

  public required init(bundle: NSBundle) {
    self.bundle = bundle

    super.init()

    registerNotifications()
    FTGEnvironmentManager.sharedManager().setup()
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

    let XcodeWay = NSMenuItem(title: "XcodeWay", action: nil, keyEquivalent: "")
    XcodeWay.enabled = true
    XcodeWay.target = self
    window.submenu?.addItem(XcodeWay)
    XcodeWay.submenu = NSMenu(title: XcodeWay.title)

    let actions: [String: Selector?] = [
      "Go To Project Folder": #selector(gotoProjectFolder(_:)),
      "Go To Simulator Folder": #selector(goToSimulatorFolder(_:)),
      "Go To New Simulator Folder": #selector(goToNewSimulatorFolder(_:)),
      "Go To Plug-Ins Folder": #selector(goToPlugInsFolder(_:)),
      "Go To Templates Folder": #selector(goToTemplateFolder(_:)),
      "Go To Archive Folder": #selector(goToArchiveFolder(_:)),
      "Go To User Data Folder": #selector(goToUserDataFolder(_:)),
      "Go To iOS Device Logs Folder": #selector(goToDeviceLogFolder(_:)),
      "Go To Derived Data Folder": #selector(goToDerivedDataFolder(_:)),
      "_": nil,
      "Go To Current Xcode Folder": #selector(goToCurrentXcodeFolder(_:)),
      "Go To Selected Xcode Folder": #selector(goToSelectedXcodeFolder(_:)),
      "_": nil,
      "Go To Terminal": #selector(goToTerminal(_:)),
      "Go To iTerm": #selector(goToiTerm(_:)),
      "_": nil,
      "About": #selector(goToAbout(_:)),
    ]

    actions.forEach { title, action in
      switch title {
      case "_":
        XcodeWay.submenu?.addItem(NSMenuItem.separatorItem())
      default:
        guard let action = action else { return }
        
        let item = NSMenuItem(title: title, action: action, keyEquivalent: "")
        XcodeWay.submenu?.addItem(item)
      }
    }
    
  }

  // MARK: - Action

  func gotoProjectFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGProjectFolderNavigator())
  }

  func goToSimulatorFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGSimulatorFolderNavigator())
  }

  func goToNewSimulatorFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGNewSimulatorFolderNavigator())
  }

  func goToDerivedDataFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGDerivedDataFolderNavigator())
  }

  func goToPlugInsFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGPlugInsFolderNavigator())
  }

  func goToTemplateFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGTemplateFolderNavigator())
  }

  func goToCurrentXcodeFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGCurrentXcodeFolderNavigator())
  }

  func goToSelectedXcodeFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGSelectedXcodeFolderNavigator())
  }

  func goToArchiveFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGArchiveFolderNavigator())
  }

  func goToUserDataFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGUserDataFolderNavigator())
  }

  func goToDeviceLogFolder(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGDeviceLogFolderNavigator())
  }

  func goToTerminal(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGTerminalNavigator())
  }

  func goToiTerm(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGiTermNavigator())
  }

  func goToGitRepository(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGGitRepoNavigator())
  }

  func goToAbout(sender: AnyObject) {
    navigatorManager.navigateWithNavigator(FTGAboutNavigator())
  }
}
