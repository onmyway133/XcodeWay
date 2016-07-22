//
//  MenuManager.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

struct MenuManager {

  static let navigators: [Navigator] = [
    FTGProjectFolderNavigator(),
    ProjectDerivedDataFolderNavigator(),
//    Separator(),
    iOS7SimulatorFolder(),
    FTGSimulatorFolderNavigator(),
    FTGPlugInsFolderNavigator(),
    FTGTemplateFolderNavigator(),
    FTGArchiveFolderNavigator(),
    FTGDeviceLogFolderNavigator(),
    FTGDerivedDataFolderNavigator(),
//    Separator(),
    ProvisioningProfileFolderNavigator(),
//    Separator(),
    FTGUserDataFolderNavigator(),
    xcdebuggerFolderNavigator(),
    ThemeFolderNavigator(),
//    Separator(),
    FTGCurrentXcodeFolderNavigator(),
    FTGSelectedXcodeFolderNavigator(),
//    Separator(),
    FTGTerminalNavigator(),
    FTGiTermNavigator(),
//    Separator(),
    FTGGitRepoNavigator(),
//    Separator(),
    FTGAboutNavigator(),
  ]

  static func find(commandIdentifier: String) -> Navigator? {
    for navigator in navigators {
      if Helper.namespacedIdentifier(identifier: navigator.title) == commandIdentifier {
        return navigator
      }
    }

    return nil
  }
}
