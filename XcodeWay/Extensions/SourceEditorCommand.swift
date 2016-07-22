//
//  SourceEditorCommand.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

  func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {
    if let navigator = MenuManager.find(commandIdentifier: invocation.commandIdentifier) {
      navigator.navigate()
    }

    completionHandler(nil)
  }

}
