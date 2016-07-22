//
//  UUIDCommand.swift
//  XcodeWay
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class ShowUUIDCommand: NSObject, Navigator {

  var title: String {
    return "Show Xcode DVTPlugInCompatibilityUUID"
  }

  func navigate() {
    let uuid = NSTask.ftg_outputTaskResultWithLaunchPath("/usr/bin/defaults", arguments: ["read", "/Applications/Xcode.app/Contents/Info", "DVTPlugInCompatibilityUUID"])
    NSAlert.ftg_showMessage(uuid)
  }
}
