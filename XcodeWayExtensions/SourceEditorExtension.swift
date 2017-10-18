//
//  SourceEditorExtension.swift
//  XcodeWayExtensions
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
  var commandDefinitions: [[XCSourceEditorCommandDefinitionKey : Any]] {
    return MenuManager.navigators.map { navigator in
      return [
        XCSourceEditorCommandDefinitionKey.nameKey: navigator.title,
        XCSourceEditorCommandDefinitionKey.classNameKey: SourceEditorCommand.className(),
        XCSourceEditorCommandDefinitionKey.identifierKey: Helper.namespacedIdentifier(identifier: navigator.title)
      ]
    }
  }
}
