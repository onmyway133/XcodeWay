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

  /*
   func extensionDidFinishLaunching() {
   // If your extension needs to do any work at launch, implement this optional method.
   }
   */

  
  var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: AnyObject]] {
    return MenuManager.navigators.map { navigator in
      return [
        XCSourceEditorCommandDefinitionKey.nameKey: navigator.title,
        XCSourceEditorCommandDefinitionKey.classNameKey: SourceEditorCommand.className(),
        XCSourceEditorCommandDefinitionKey.identifierKey: Helper.namespacedIdentifier(identifier: navigator.title)
      ]
    }
  }
}
