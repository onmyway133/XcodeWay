//
//  ThemeFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

@objc class ThemeFolderNavigator: NSObject, Navigator {

  var title: String {
    return "Go To Themes Folder"
  }

  func navigate() {
    let path = FTGEnvironmentManager.sharedManager().userDataPath()
    let url = NSURL(fileURLWithPath: path).URLByAppendingPathComponent("FontAndColorThemes")

    NSWorkspace.sharedWorkspace().openURL(url)
  }
}
