//
//  xcdebuggerFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class xcdebuggerFolderNavigator: NSObject, Navigator {

  var title: String {
    return "Go To xcdebugger Folder"
  }

  func navigate() {
    let path = FTGEnvironmentManager.shared().userDataPath()
    guard let url = NSURL(fileURLWithPath: path).appendingPathComponent("xcdebugger") else { return }

    NSWorkspace.shared.open(url)
  }
}
