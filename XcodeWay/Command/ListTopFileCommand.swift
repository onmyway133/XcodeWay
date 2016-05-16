//
//  TopFileNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class ListTopFileCommand: NSObject, Navigator {

  var title: String {
    return "List files with most lines"
  }

  func navigate() {
    guard let path = FTGEnvironmentManager.sharedManager().projectPath() else { return }

    let output = NSTask.ftg_outputTaskResultWithLaunchPath("/usr/bin/find", arguments: [".", "-name \"*.swift\" -type f | xargs wc -l|sort -rn|grep -v ' total$'|head -10"], currentDirectoryPath: path)
    NSAlert.ftg_showMessage(output)
  }
}
