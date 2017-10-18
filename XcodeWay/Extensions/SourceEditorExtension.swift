//
//  SourceEditorExtension.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
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
