//
//  iOS7SimulatorNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class iOS7SimulatorFolder: NSObject, Navigator {

  var title: String {
    return "Go To iOS 7 Simulator Folder"
  }

  func navigate() {
    let applicationSupportDirectoryPath = FTGEnvironmentManager.shared().applicationSupportDirectoryPath()
    guard let url = NSURL(fileURLWithPath: applicationSupportDirectoryPath, isDirectory: true).appendingPathComponent("iPhone Simulator") else { return }

    NSWorkspace.shared().open(url)
  }
}
