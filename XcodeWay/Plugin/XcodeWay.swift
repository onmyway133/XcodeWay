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
    
  }
}
