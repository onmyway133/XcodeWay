//
//  ProjectDerivedDataFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

class ProjectDerivedDataFolderNavigator: NSObject, Navigator {

  var title: String {
    return "Go To Project Derived Data Folder"
  }

  func navigate() {
    guard let workspace = FTGEnvironmentManager.shared().workspace(),
      let arena = workspace.value(forKeyPath: "_workspaceArena"),
      let derivedDataPath = arena.value(forKeyPath: "derivedDataLocation._pathString") as? String
    else { return }

    let url = URL(fileURLWithPath: derivedDataPath, isDirectory: true)

    NSWorkspace.shared().open(url)
  }
}
