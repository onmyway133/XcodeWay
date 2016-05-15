//
//  iOS7SimulatorNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

@objc class iOS7SimulatorFolder: NSObject, Navigator {

  var title: String {
    return "Go To iOS 7 Simulator Folder"
  }

  func navigate() {
    let applicationSupportDirectoryPath = FTGEnvironmentManager.sharedManager().applicationSupportDirectoryPath()
    let url = NSURL(fileURLWithPath: applicationSupportDirectoryPath, isDirectory: true).URLByAppendingPathComponent("iPhone Simulator")

    NSWorkspace.sharedWorkspace().openURL(url)
  }
}
