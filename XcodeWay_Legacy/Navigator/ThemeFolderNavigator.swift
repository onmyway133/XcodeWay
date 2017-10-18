//
//  ThemeFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class ThemeFolderNavigator: NSObject, Navigator {

  var title: String {
    return "Go To Themes Folder"
  }

  func navigate() {
    let path = FTGEnvironmentManager.shared().userDataPath()
    guard let url = NSURL(fileURLWithPath: path).appendingPathComponent("FontAndColorThemes") else { return }

    NSWorkspace.shared.open(url)
  }
}
