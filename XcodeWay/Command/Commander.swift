//
//  Commander.swift
//  XcodeWay
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

struct Commander {

  static func run(command: String) {
    let script =
    "tell application \"Terminal\"\n"
    " do script \"echo hello world\"\n"
    "end tell"

    NSTask.ftg_runTaskWithLaunchPath("/usr/bin/osascript", arguments: ["-e", script])
  }
}
