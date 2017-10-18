//
//  ThemeFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import AppKit

class ThemeFolderNavigator: Navigator {

  var title: String {
    return "Go To Themes Folder"
  }

  func navigate() {
    let path = FileService.userDataPath.appendingPathExtension("FontAndColorThemes")
    NSWorkspace.shared.open(path)
  }
}
