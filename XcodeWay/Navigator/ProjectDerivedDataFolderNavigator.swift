//
//  ProjectDerivedDataFolderNavigator.swift
//  XcodeWay
//
//  Created by Khoa Pham on 15/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

@objc class ProjectDerivedDataFolderNavigator: NSObject, Navigator {

  var title: String {
    return "Go To Project Derived Data Folder"
  }

  func navigate() {
    guard let workspace = FTGEnvironmentManager.sharedManager().workspace(),
      arena = workspace.valueForKeyPath("_workspaceArena"),
      derivedDataPath = arena.valueForKeyPath("derivedDataLocation._pathString") as? String
    else { return }

    let url = NSURL(fileURLWithPath: derivedDataPath)

    NSWorkspace.sharedWorkspace().openURL(url)
  }
}
