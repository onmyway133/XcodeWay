//
//  ShowSelectedXcodePathCommand.swift
//  XcodeWay
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class ShowSelectedXcodePathCommand: NSObject, Navigator {

  var title: String {
    return "Show selected Xcode path"
  }

  func navigate() {
    let uuid = NSTask.ftg_outputTaskResultWithLaunchPath("/usr/bin/xcode-select", arguments: ["-p"])
    NSAlert.ftg_showMessage(uuid)
  }
}
