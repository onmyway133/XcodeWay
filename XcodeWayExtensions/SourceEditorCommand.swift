//
//  SourceEditorCommand.swift
//  XcodeWayExtensions
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
  func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
    if let navigator = MenuManager.find(commandIdentifier: invocation.commandIdentifier) {
      DispatchQueue.main.async {
        navigator.navigate()
      }
    }

    completionHandler(nil)
  }
}
