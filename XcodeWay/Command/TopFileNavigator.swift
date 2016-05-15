//
//  TopFileNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class TopFileNavigator: NSObject, Navigator {

  var title: String {
    return "List files with most lines"
  }

  func navigate() {
    let command = "find . -name \"*.[swift, m]\" -type f | xargs wc -l|sort -rn|grep -v ' total$'|head -10"
  }
}
